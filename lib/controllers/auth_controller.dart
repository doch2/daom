import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daom/controllers/user_controller.dart';
import 'package:daom/models/user.dart';
import 'package:daom/services/firestore_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {

  void signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential _authResult = await FirebaseAuth.instance.signInWithCredential(credential);

    writeAccountInfo(_authResult.user?.uid, googleUser?.email, googleUser?.displayName, false);

  }

  void writeAccountInfo(String? userID, String? email, String? name, bool isEmailSignUp) async {
    UserModel _user = UserModel(
        id: userID,
        email: email,
        name: name,
    );

    if (isEmailSignUp) {
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
      }
    } else {
      FirebaseFirestore.instance
          .collection("users")
          .doc(userID)
          .get()
          .then((doc) async {
        if (doc.exists) {
          print("exists");
        } else {
          if (await Database().createNewUser(_user)) {
            Get.find<UserController>().user = _user;
          }
        }
      }
      );
    }
  }
}