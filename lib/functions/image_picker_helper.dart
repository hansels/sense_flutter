import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static ImagePicker imagePicker = ImagePicker();

  static Future<File> openCameraWithoutCrop({int quality = 60}) async {
    var pickedImage = await imagePicker.getImage(
      source: ImageSource.camera,
      imageQuality: quality,
    );
    return pickedImage == null ? null : File(pickedImage.path);
  }

  static Future<File> openGalleryWithoutCrop({int quality = 60}) async {
    var pickedImage = await imagePicker.getImage(
      source: ImageSource.gallery,
      imageQuality: quality,
    );
    return pickedImage == null ? null : File(pickedImage.path);
  }

  static Future<File> retrieveLostData() async {
    try {
      final LostData response = await imagePicker.getLostData();
      if (response.isEmpty) return null;
      return response?.file == null ? null : File(response.file.path);
    } catch (err) {
      return null;
    }
  }
}
