import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daom/models/user.dart';

class FirestoreDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
        "chatRoomList": [],
        "profileImg": user.profileImg,
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

  Future<Map> getUserInfoForChat(String uid) async {
    try {
      DocumentSnapshot _doc = await _firestore.collection("users").doc(uid).get();
      Map miniProfileInfo = {};
      miniProfileInfo["name"] = (_doc.data() as dynamic)['name'];
      miniProfileInfo["profileImg"] = (_doc.data() as dynamic)['profileImg'];

      return miniProfileInfo;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List> getChatList(String? uid) async {
    try {
      DocumentSnapshot _doc = await _firestore.collection("users").doc(uid).get();
      return _doc["chatRoomList"];
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Map> getChatRoom(String uid) async {
    try {
      DocumentSnapshot _doc = await _firestore.collection("chats").doc(uid).get();
      Map chatRoom = {};
      chatRoom["title"] = (_doc.data() as dynamic)['title'];
      chatRoom["memberList"] = (_doc.data() as dynamic)['members'];

      return chatRoom;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> createChatRoom(String title, List memberList, String userID, String roomID) async {
    try {
      await _firestore.collection("chats").doc(roomID).set({
        "title": title,
        "members": memberList,
      });

      DocumentSnapshot _userDoc = await _firestore.collection("users").doc(userID).get();
      List chatList = _userDoc.get("chatRoomList");
      chatList.add(roomID);
      await _firestore.collection("users").doc(userID).update({
        "chatRoomList": chatList,
      });

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
