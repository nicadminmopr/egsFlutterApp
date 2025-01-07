import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';

import 'lock_controller.dart';

class LockScreen extends StatelessWidget {
  final LockController controller = Get.put(LockController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Password Lock')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showLockScreen();
          },
          child: Text('Set Password Lock'),
        ),
      ),
    );
  }

  void _showLockScreen() {
    screenLock(context: Get.context!, correctString: '1234', canCancel: false);
  }
}
