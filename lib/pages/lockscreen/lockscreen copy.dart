// import 'package:flutter/material.dart';

// class PinEntryScreen extends StatefulWidget {
//   const PinEntryScreen({Key? key}) : super(key: key);

//   @override
//   _PinEntryScreenState createState() => _PinEntryScreenState();
// }

// class _PinEntryScreenState extends State<PinEntryScreen> {
//   final List<TextEditingController> _pinControllers =
//       List.generate(4, (_) => TextEditingController());
//   final List<FocusNode> _pinFocusNodes = List.generate(4, (_) => FocusNode());

//   // Simple state to hold the entered PIN (for demonstration)
//   String _enteredPin = "";

//   @override
//   void dispose() {
//     for (var controller in _pinControllers) {
//       controller.dispose();
//     }
//     for (var focusNode in _pinFocusNodes) {
//       focusNode.dispose();
//     }
//     super.dispose();
//   }

//   void _onNumberTapped(String number) {
//     for (int i = 0; i < _pinControllers.length; i++) {
//       if (_pinControllers[i].text.isEmpty) {
//         _pinControllers[i].text = number;
//         _enteredPin += number;
//         if (i < _pinControllers.length - 1) {
//           _pinFocusNodes[i + 1].requestFocus();
//         } else {
//           // PIN is complete, you would typically validate it here
//           print("Entered PIN: $_enteredPin");
//           // unfocus all fields after completion
//           _pinFocusNodes.forEach((node) => node.unfocus());
//         }
//         break;
//       }
//     }
//   }

//   void _onBackspaceTapped() {
//     for (int i = _pinControllers.length - 1; i >= 0; i--) {
//       if (_pinControllers[i].text.isNotEmpty) {
//         _pinControllers[i].text = "";
//         _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
//         _pinFocusNodes[i].requestFocus();
//         break;
//       }
//     }
//   }

//   void _onLogoutTapped() {
//     // Implement logout logic here
//     print("Logout tapped");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Top Section: Avatar and Welcome
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: Colors.blue[100],
//                     child: Text(
//                       'OM',
//                       style: TextStyle(color: Colors.blue[700]),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24.0),
//               const Text(
//                 'Welcome Back Obiajulu',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8.0),
//               const Text(
//                 'Enter your 4-Digit PIN',
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 32.0),

//               // PIN Input Fields
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(4, (index) {
//                   return SizedBox(
//                     width: 50, // Adjust size as needed
//                     child: TextField(
//                       controller: _pinControllers[index],
//                       focusNode: _pinFocusNodes[index],
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       obscureText: true, // Hide PIN digits
//                       maxLength: 1, // Only one character per field
//                       decoration: const InputDecoration(
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue),
//                         ),
//                         counterText: "", // Hide the counter text
//                       ),
//                       onChanged: (value) {
//                         // Move to the next field automatically
//                         if (value.isNotEmpty &&
//                             index < _pinControllers.length - 1) {
//                           _pinFocusNodes[index + 1].requestFocus();
//                         } else if (value.isEmpty && index > 0) {
//                           // Optionally move to the previous field on backspace
//                           // _pinFocusNodes[index - 1].requestFocus();
//                         }
//                         // Simple update to _enteredPin (consider a more robust state management for real apps)
//                         _enteredPin = _pinControllers.map((c) => c.text).join();
//                         if (_enteredPin.length == 4) {
//                           print("Entered PIN: $_enteredPin");
//                           // unfocus all fields after completion
//                           _pinFocusNodes.forEach((node) => node.unfocus());
//                         }
//                       },
//                       readOnly: true, // Prevent direct keyboard input
//                     ),
//                   );
//                 }),
//               ),

//               const Spacer(), // Pushes the keypad to the bottom

//               // Numeric Keypad
//               Column(
//                 children: [
//                   _buildKeypadRow(['1', '2', '3']),
//                   _buildKeypadRow(['4', '5', '6']),
//                   _buildKeypadRow(['7', '8', '9']),
//                   _buildKeypadRow([
//                     'fingerprint',
//                     '0',
//                     'backspace'
//                   ]), // Using strings to represent icons
//                 ],
//               ),

//               const Spacer(), // Provides space above the logout link

//               // Logout Link
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Not your account?',
//                     style: TextStyle(fontSize: 16.0),
//                   ),
//                   TextButton(
//                     onPressed: _onLogoutTapped,
//                     child: const Text(
//                       'Log out',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildKeypadRow(List<String> keys) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: keys.map((key) {
//           if (key == 'fingerprint') {
//             return InkWell(
//               onTap: () {
//                 // Handle fingerprint authentication
//                 print("Fingerprint tapped");
//               },
//               child: const Icon(
//                 Icons.fingerprint,
//                 size: 36.0,
//                 color: Colors.black87,
//               ),
//             );
//           } else if (key == 'backspace') {
//             return InkWell(
//               onTap: _onBackspaceTapped,
//               child: const Icon(
//                 Icons.backspace_outlined,
//                 size: 30.0,
//                 color: Colors.black87,
//               ),
//             );
//           } else {
//             return InkWell(
//               onTap: () => _onNumberTapped(key),
//               borderRadius: BorderRadius.circular(40.0), // Make it circular
//               child: Container(
//                 width: 60, // Adjust size of number buttons
//                 height: 60,
//                 alignment: Alignment.center,
//                 child: Text(
//                   key,
//                   style: const TextStyle(
//                     fontSize: 28.0,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ),
//             );
//           }
//         }).toList(),
//       ),
//     );
//   }
// }
