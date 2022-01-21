import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseServices {
  var db = FirebaseFirestore.instance.collection("user");

  Future<void> addUser(
      String Uid, String name, String DoB, String crime, String CHistory ,String image) {
    // Call the user's CollectionReference to add a new user
    return db
        .add({
          "Uid": Uid,
          "name": name,
          "DateOfBirth": DoB,
          "crime": crime,
          "criminalHistory": CHistory,
          "image": image,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

class Storage  {
  

}
