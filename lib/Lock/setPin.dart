// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pinput/pinput.dart';
//
// import 'lock_controller.dart';
//
// class SetPinScreen extends StatelessWidget {
//   final LockController controller = Get.put(LockController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Set 4-Digit PIN',
//           style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15.0),
//         ),
//       ),
//       body: Container(
//         margin: EdgeInsets.symmetric(horizontal: 20.0),
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Enter your new PIN',
//               style: GoogleFonts.montserrat(
//                 color: Colors.black,
//                 fontSize: 15.0,
//               ),
//             ),
//             SizedBox(height: 20),
//             Pinput(onCompleted: (pin) => print(pin)),
//             SizedBox(height: 40),
//             Text(
//               'Confirm your new PIN',
//               style: GoogleFonts.montserrat(
//                 color: Colors.black,
//                 fontSize: 15.0,
//               ),
//             ),
//             SizedBox(height: 20),
//             Pinput(onCompleted: (pin) => print(pin)),
//             Spacer(),
//             MaterialButton(
//               onPressed: () {},
//               height: 48,
//               minWidth: Get.width,
//               child: Text(
//                 'Save',
//                 style: GoogleFonts.montserrat(
//                   color: Colors.white,
//                   fontSize: 15.0,
//                 ),
//               ),
//               color: Colors.black,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showConfirmPinDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirm PIN'),
//           content: PinInputWidget(
//             onCompleted: (confirmPin) {
//               if (confirmPin == controller.pin.value) {
//                 controller.savePin(confirmPin);
//                 Get.snackbar('Success', 'PIN set successfully');
//                 Get.back(); // Close the dialog
//                 Get.back(); // Navigate back to the previous screen
//               } else {
//                 Get.snackbar('Error', 'PINs do not match');
//                 Navigator.of(context).pop(); // Close the dialog
//               }
//             },
//           ),
//         );
//       },
//     );
//   }
// }
//
// class PinInputWidget extends StatefulWidget {
//   final Function(String) onCompleted;
//
//   const PinInputWidget({Key? key, required this.onCompleted}) : super(key: key);
//
//   @override
//   _PinInputWidgetState createState() => _PinInputWidgetState();
// }
//
// class _PinInputWidgetState extends State<PinInputWidget> {
//   final List<TextEditingController> _controllers = List.generate(
//     4,
//     (_) => TextEditingController(),
//   );
//   final FocusNode _focusNode = FocusNode();
//   String _pin = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(() {
//       if (!_focusNode.hasFocus) {
//         _clearPin();
//       }
//     });
//   }
//
//   void _clearPin() {
//     for (var controller in _controllers) {
//       controller.clear();
//     }
//     _pin = '';
//   }
//
//   void _onChanged(int index, String value) {
//     if (value.length == 1) {
//       _pin += value;
//       if (index < 3) {
//         FocusScope.of(context).nextFocus();
//       }
//     } else if (value.isEmpty && index > 0) {
//       _pin = _pin.substring(0, _pin.length - 1);
//       FocusScope.of(context).previousFocus();
//     }
//
//     if (_pin.length == 4) {
//       widget.onCompleted(_pin);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(4, (index) {
//         return Container(
//           width: 60,
//           height: 60,
//           margin: const EdgeInsets.symmetric(horizontal: 5),
//           child: TextField(
//             controller: _controllers[index],
//             onChanged: (value) => _onChanged(index, value),
//             focusNode: index == 0 ? _focusNode : null,
//             textAlign: TextAlign.center,
//             keyboardType: TextInputType.number,
//             maxLength: 1,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               counterText: '',
//             ),
//             obscureText: true,
//           ),
//         );
//       }),
//     );
//   }
// }
