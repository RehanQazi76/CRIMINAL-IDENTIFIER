import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:criminal_identifier/screens/datadsplay.dart';
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

class imgipt extends StatefulWidget {
  @override
  _inputState createState() => _inputState();
}

class _inputState extends State<imgipt> {
  var db = FirebaseFirestore.instance.collection("user");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            text: "DISPLAY IMAGES",
            style: TextStyle(
                          fontFamily: "MavenPro-Bold",
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.white)  
            
          ),
          
        ),
       
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: db.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              print("ssss1 ${snapshot.data}");
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              print("sss ${snapshot.data}");
              return GridView.count(
                  crossAxisCount: 2,
                  children: snapshot.data!.docs.map(
                    (doc) {
                      return GestureDetector(
                        onTap: () {
                          print(doc['Uid']);
                         Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => datadisplay(doc['Uid'])),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.network(
                            doc['image'],
                            
                            height: 300.0,
                            width: 400.0,
                          ),
                        ),
                      );
                    },
                  ).toList());
            }
          }),
    );
  }
}
