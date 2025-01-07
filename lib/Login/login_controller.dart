import 'package:get/get.dart';

class LoginController extends GetxController {
  var userId = ''.obs;
  var password = ''.obs;
  var isPasswordVisible = true.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  bool validate() {
    if (userId.value.isEmpty) {
      Get.snackbar(
        'Error',
        'User  ID cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    if (password.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Password cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true;
  }
}
