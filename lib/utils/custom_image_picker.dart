import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print("No Images Selected");
}




// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// class CustomImagePicker {
//   final picker = ImagePicker();

//   Future<File> imgFromCamera() async {
//     try {
//       final pickedFile =
//           await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
//       final File file = File(pickedFile!.path);
//       return file;
//     } catch (e) {
//       return File('');
//     }
//   }


//   Future<File> openGallery() async {
//     try {
//       final pickedFile = await picker.pickImage(
//           source: ImageSource.gallery, imageQuality: 100);
//       final File file = File(pickedFile!.path);
//       return file;
//     } catch (e) {
//       return File('');
//     }
//   }
// }
