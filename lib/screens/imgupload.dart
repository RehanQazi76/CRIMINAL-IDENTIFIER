import 'dart:html';
import 'package:flutter/cupertino.dart';
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
  File? _image;
  final imagePicker = ImagePicker();
  Future imagePickerMethod() async {
    final pick = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
    );
      final path = pick.files.single.path;
              final pathname = pick.files.single.name;
    setState(() {
      if (pick != null) {

        _image = File(pick.path);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text(" file uploaded")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("no  file uploaded")));
      }
    });
  }

  Future uploadImage() async {
    Reference ref = FirebaseStorage.instance.ref().child("images");
    await ref.putFile(_image!);
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('upload img '),
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
            child: const Text('uplaod img '),
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                type: FileType.custom,
                allowedExtensions: ['png', 'jpg'],
              );
              if (result == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("no file uploaded")));

                return null;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(" file uploaded")));
              }
              final path = result.files.single.path;
              final pathname = result.files.single.name;
            },
          )
        ]));
  }
}
