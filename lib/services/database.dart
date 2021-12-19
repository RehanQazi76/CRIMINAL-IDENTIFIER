import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseServices {
  var db = FirebaseFirestore.instance.collection("user");

  Future<void> addUser(String Uid,String name, String DoB ,String crime ,String CHistory ) {
      // Call the user's CollectionReference to add a new user
      return db.add({
           "Uid":Uid,
            "name": name,
            "DateOfBirth": DoB,
            "crime": crime,
            "criminalHistory": CHistory,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
}
