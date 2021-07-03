import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sense_flutter/configs/configs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickerHelper {
  static ImagePicker imagePicker = ImagePicker();
  static Future<File> openCamera({double x = 1, double y = 1}) async {
    var pickedImage = await imagePicker.getImage(source: ImageSource.camera);
    return pickedImage == null ? null : await cropImage(pickedImage, x, y);
  }

  static Future<File> openGallery({double x = 1, double y = 1}) async {
    var pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    return pickedImage == null ? null : await cropImage(pickedImage, x, y);
  }

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

  static Future<File> cropImage(PickedFile image, double x, double y) async {
    return await ImageCropper.cropImage(
      sourcePath: image.path,
      cropStyle: CropStyle.rectangle,
      androidUiSettings: androidSettings,
      iosUiSettings: iosSettings,
      aspectRatio: CropAspectRatio(ratioX: x, ratioY: y),
    );
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

  static AndroidUiSettings get androidSettings => AndroidUiSettings(
        toolbarTitle: "Potong Gambar",
        toolbarColor: Configs.primaryColor,
        toolbarWidgetColor: Colors.white,
        statusBarColor: Configs.primaryColor,
        cropGridStrokeWidth: 4,
        cropFrameStrokeWidth: 4,
        activeControlsWidgetColor: Configs.secondaryColor,
      );

  static IOSUiSettings get iosSettings => IOSUiSettings(
        title: "Potong Gambar",
        cancelButtonTitle: "Batal",
        doneButtonTitle: "Selesai",
      );
}
