import 'dart:io';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> choseimage() async {
  ImagePicker imagePicker = ImagePicker();
  XFile? xFile = await imagePicker.pickImage(source: ImageSource.gallery);
  if (xFile != null) {
    return File(xFile.path);
  }
  return null;
}

Future<String?> uplodimage(File image) async {
  try {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference ref = firebaseStorage.ref('images').
    child(DateTime.now().toString() + '.jpg');
    UploadTask task = ref.putFile(image);
    TaskSnapshot aa = await task;
    String url = await aa.ref.getDownloadURL();
    return url;
  } catch (e) {
    return null;
  }
}
