// ignore_for_file: non_constant_identifier_names
import 'package:criminal_identifier/screens/search.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:criminal_identifier/screens/upload.dart';
import 'package:criminal_identifier/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
  TextEditingController image = TextEditingController();
  String? url;
  void rest() {
    name.text = '';
    Uid.text = '';
    DoB.text = '';
    crime.text = '';
    CHistory.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Center(child: Text('INSERT DATA ')),
        ),
        body: ListView(
          children: [
            Image.network('https://static.thenounproject.com/png/348334-200.png',
                      height: 130,
                      width: 150,),
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
                        horizontal: 20, vertical: 20),
                  ),
                  child: const Text('uplaod img '),
                  onPressed: () async {
                    FirebaseStorage storage = FirebaseStorage.instance;

                    File image;
                    try {
                      image = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                    } on PlatformException catch (e) {
                      return;
                    }
                    String path = image.path;
                    Reference reference = storage.ref().child('/$path');
                    UploadTask uploadTask = reference.putFile(image);
                    uploadTask.then((res) {
                      res.ref.getDownloadURL();
                    });
                    url = await (await uploadTask).ref.getDownloadURL();
                    if (image != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(" file uploaded")));

                      return null;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(" no file uploaded")));
                    }
                    // Waits till the file is uploaded then stores the download url
                    // String url = await taskSnapshot.ref.getDownloadURL();
                  },
                ),
              ),
            ),
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
                      primary: Colors.blue,
                      onPrimary: CupertinoColors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                    ),
                    child: const Text('ADD DATA '),
                    onPressed: () {
                      Fluttertoast.showToast(msg: "Data Sucsessfully added");
                      FireBaseServices().addUser(Uid.text, name.text, DoB.text,
                          crime.text, CHistory.text, url.toString());
                      rest();
                    }),
              ),
            ),
          ],
        ));
  }
}
