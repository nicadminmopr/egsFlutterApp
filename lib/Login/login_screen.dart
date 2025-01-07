import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home/home_screen.dart';
import 'login_controller.dart';

enum _SupportState { unknown, supported, unsupported }

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

  void showLockScreen() {
    screenLock(
      useBlur: true,
      context: Get.context!,
      correctString: '1234',
      canCancel: false,
      customizedButtonChild: Icon(
        Icons.fingerprint,
        color: Colors.white,
        size: 50,
      ),
      customizedButtonTap: () {},
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showLockScreen();
    });
    // showLockScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.14),
              Image.asset(
                'assets/images/Emblem_of_India.svg.png',
                height: 80,
                width: 80,
              ),
              SizedBox(height: 20),
              Text(
                'Login',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                onChanged: (value) => controller.userId.value = value,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
                decoration: InputDecoration(
                  labelText: 'User  ID',
                  labelStyle: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => TextField(
                  onChanged: (value) => controller.password.value = value,
                  obscureText: controller.isPasswordVisible.value,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  minWidth: Get.width,
                  height: 48,
                  onPressed: () {
                    if (controller.validate()) {
                      Get.to(() => HomeScreen());
                      // Perform login action
                      Get.snackbar(
                        'Success',
                        'Login successful',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
