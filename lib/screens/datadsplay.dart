import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:criminal_identifier/screens/upload.dart';
import 'package:criminal_identifier/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class datadisplay extends StatefulWidget {
  String Uid;
  datadisplay(this.Uid);
  @override
  _datadisplayState createState() => _datadisplayState();
}

class _datadisplayState extends State<datadisplay> {
  var db = FirebaseFirestore.instance.collection("user");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: const Text('welcome '),
          
        ),
        body:
      StreamBuilder<QuerySnapshot>(
                  stream: db.where("Uid", isEqualTo: widget.Uid).snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print("ssss1 ${snapshot.hasData}");
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      print("sss ${snapshot.hasData}");
                      return ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: snapshot.data!.docs.map((doc) {
                          return Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                
                                InkWell(
                                  child: Image.network(
                                    doc.data()['image'],
                                    height: 300.0,
                                    width: 400.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    doc.data()['name'],
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    doc.data()['DateOfBirth'],
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    doc.data()['crime'],
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    doc.data()['criminalHistory'],
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    }
                  },
                )
    );
  }
}
