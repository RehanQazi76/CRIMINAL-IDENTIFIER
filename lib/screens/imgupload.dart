import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:criminal_identifier/screens/upload.dart';
import 'package:criminal_identifier/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class imgipt extends StatefulWidget {
  @override
  _inputState createState() => _inputState();
}

class _inputState extends State<imgipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('welcome '),
          actions: <Widget>[
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person),
                label: const Text("logout"))
          ],
        ),
        body: ListView(children: [
           ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: CupertinoColors.black,
                  onPrimary: CupertinoColors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                ),
                child: const Text('Scan Suspect '),
                onPressed: () async{
                  final result =await FilePicker(

                  );
                  
                },
              )
        ]));
  }
}
