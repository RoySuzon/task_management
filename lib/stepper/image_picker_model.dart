import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class ChoseImage extends GetxController {
  RxString imagePath = ''.obs;
  Future selectImage() async {
    final _pick = ImagePicker();
    final pickImage = await _pick.pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      imagePath.value = pickImage.path.toString();
    }
    if (kDebugMode) {
      print(imagePath.value.toString());
    }
    // if (kDebugMode) {
    //   print('Error');
    // }
  }
}

class ImagePickerCont extends GetxController {
  RxString ImagePath = ''.obs;

  Future getImage() async {
    final _picker = ImagePicker();

    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      ImagePath.value = image.path.toString();
    }
  }
}
