import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daom/models/user.dart';

class FirestoreDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String? uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();
      return UserModel?.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> writeNewPost(String title, String content, int photoAmount, String postID) async {
    try {
      await _firestore.collection("posts").doc(postID).set({
        "title": title,
        "content": content,
        "photoAmount": photoAmount
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
