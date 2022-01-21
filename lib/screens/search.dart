import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:criminal_identifier/screens/upload.dart';
import 'package:criminal_identifier/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class display extends StatefulWidget {
  @override
  _displayState createState() => _displayState();
}

class _displayState extends State<display> {
  TextEditingController Uid = TextEditingController();
  bool isClicked = false;
  var db = FirebaseFirestore.instance.collection("user");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text.rich(
          TextSpan(
            text: "SEARCH DATA",
            style: TextStyle(
                          fontFamily: "MavenPro-Bold",
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.white)  
            
          ),
          
        ),
          
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: Uid,
              decoration: InputDecoration(
                  labelText: 'Uid',
                  hintText: 'enter a unique Uid',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 15,
            ),
            child: Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    onPrimary: CupertinoColors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                  ),
                  child: const Text('SEARCH',
                  style: TextStyle(fontSize: 15.0),),
                  onPressed: () {
                    setState(() {
                      isClicked = true;
                    });
                  }),
            ),
          ),
          isClicked
              ? StreamBuilder<QuerySnapshot>(
                  stream: db.where("Uid", isEqualTo: Uid.text).snapshots(),
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
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    doc.data()['name'],
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    doc.data()['DateOfBirth'],
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    doc.data()['crime'],
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
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
              : Container(
                  child: Spacer()
                )
        ]));
  }
}
