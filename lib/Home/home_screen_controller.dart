import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var isSwitched = false.obs;

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }
}
