import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageHelper {
  final ImagePicker imagePicker = ImagePicker();
  Future<XFile?> getImageFromGallery({
    required BuildContext context,
  }) async {
    if (Platform.isAndroid) {
      bool isPermissionGranted = await Permission.photos.isGranted;
      if (!isPermissionGranted) {
        await Permission.photos.request();
      }
    }

    XFile? file = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    return file;
  }
}
