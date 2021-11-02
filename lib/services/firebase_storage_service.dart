import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  uploadNewImage(String path, XFile originalFile) async {
    File file = File(originalFile.path);
    await FirebaseStorage.instance.ref(path).putFile(file);
  }
}