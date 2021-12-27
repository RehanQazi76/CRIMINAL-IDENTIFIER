// ignore_for_file: non_constant_identifier_names
import 'package:criminal_identifier/screens/display.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:criminal_identifier/screens/upload.dart';
import 'package:criminal_identifier/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InputForm extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<InputForm> {
  TextEditingController name = TextEditingController();
  TextEditingController Uid = TextEditingController();
  TextEditingController DoB = TextEditingController();
  TextEditingController crime = TextEditingController();
  TextEditingController CHistory = TextEditingController();
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
        body: ListView(
          children: [
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
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: name,
                decoration: InputDecoration(
                    labelText: 'Name ',
                    hintText: 'name of the suspect/criminal',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                keyboardType: TextInputType.datetime,
                controller: DoB,
                decoration: InputDecoration(
                    labelText: 'Date of Birth ',
                    hintText: 'DD/MM/YYYY',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                controller: crime,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'crime ',
                    hintText: 'latest crime done',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                maxLines: 5,
                controller: CHistory,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Criminal history ',
                    hintText: 'crimal history, last seen location ',
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
                    child: const Text('ADD DATA '),
                    onPressed: () {
                      Fluttertoast.showToast(msg: "Data Sucsessfully added");
                      FireBaseServices().addUser(
                         Uid.text, name.text, DoB.text, crime.text, CHistory.text);
                    }),
              ),
            ),
           
          ],
        ));
  }
}
