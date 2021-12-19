import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:criminal_identifier/screens/upload.dart';
import 'package:criminal_identifier/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          title: const Text('welcome '),
          actions: <Widget>[
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.person),
                label: Text("logout"))
          ],
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
                    primary: CupertinoColors.black,
                    onPrimary: CupertinoColors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                  ),
                  child: const Text('search '),
                  onPressed: () {
                    setState(() {
                      isClicked = true;
                    });
                  }),
            ),
          ),
          isClicked? StreamBuilder<QuerySnapshot>(
        stream: db.where("Uid", isEqualTo: Uid.text).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: ListView(
                children: snapshot.data!.docs.map((doc) {
                  return ListView(
                    children: [
                      Text(doc.data()['name']),
                      Text(doc.data()['DateOfBirth']),
                      Text(doc.data()['crime']),
                      Text(doc.data()['criminalHistory']),
                    ],
                  );
                }).toList(),
              ),
            );
          }
        },
      )
    :Container()
        ]));
  }
}
