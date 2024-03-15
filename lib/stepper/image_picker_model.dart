import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class ChoseImage extends GetxController {
  RxString imagePath = ''.obs;
  Future selectImage() async {
    final pick = ImagePicker();
    final pickImage = await pick.pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      imagePath.value = pickImage.path.toString();
    }
    if (kDebugMode) {
      print(imagePath.value.toString());
    }
  }
}

class ImagePickerCont extends GetxController {
  RxString imagePath = ''.obs;

  Future getImage() async {
    final picker = ImagePicker();

    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}
