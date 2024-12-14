import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ToDoController with ChangeNotifier {
  var db = FirebaseFirestore.instance;
  bool isloading = false;
  void addData({
    required String name,
  }) async {
    // Add a new document with a generated id.
    final data = {
      "title": name,
      "status": false,
    };

    await db.collection("tasks").add(data).then((documentSnapshot) =>
        print("Added Data with ID: ${documentSnapshot.id}"));
  }

  void updateData({required String name, required String docId}) async {
    final data = {
      "title": name,
    };

    await db
        .collection("tasks")
        .doc(docId)
        .update(data)
        .then((documentSnapshot) => print("document updated successfully"));
  }

  void ondelete({required String docid}) {
    db.collection("tasks").doc(docid).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }
}
