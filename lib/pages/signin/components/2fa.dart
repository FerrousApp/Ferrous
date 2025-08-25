import 'dart:async';

import 'package:ferrous/pages/wb.pinentry/wb.pinentry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class TwoStepVerificationPage extends ConsumerStatefulWidget {
  const TwoStepVerificationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TwoStepVerificationPageState();
}

class _TwoStepVerificationPageState
    extends ConsumerState<TwoStepVerificationPage> {
  final TextEditingController _otpController = TextEditingController();

  final focusNode = FocusNode();

  @override
  void dispose() {
    // Later when you want to unfocus:
    focusNode.unfocus();
    _otpController.dispose();
    super.dispose();
  }

  // Future<void> _pasteFromClipboard() async {
  //   final data = await Clipboard.getData('text/plain');
  //   if (data != null && data.text != null) {
  //     String text = data.text!.replaceAll(RegExp(r'\D'), '').substring(0, 6);
  //     // String text = data.text!.trim();
  //     // Remove any non-digit characters
  //     // text = text.replaceAll(RegExp(r'\D'), '');
  //     _otpController.text = text;
  //     setState(() {});
  //   }
  // }

  Future<void> _pasteFromClipboard() async {
    final data = await Clipboard.getData('text/plain');
    if (data != null && data.text != null) {
      // Remove non-digit characters
      String text = data.text!.replaceAll(RegExp(r'\D'), '');

      // Ensure length is not shorter than 6
      if (text.length >= 6) {
        text = text.substring(0, 6);
      }

      _otpController.text = text;
      setState(() {});
    }
  }

  void _submit() {
    /// create an instance of scaffold messenger to avoid repition
    final messenger = ScaffoldMessenger.of(context);

    final code = _otpController.text;
    if (code.length == 6) {
      messenger.clearSnackBars();
      // Proceed to verify code
      print('Code submitted: $code');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeBackPinEntryPage(),
        ),
      );
    } else {
      //TODO: clear input field
      messenger.showSnackBar(
        const SnackBar(
          content: Text("Enter the full 6-digit code"),
        ),
      );

      Future.delayed(const Duration(seconds: 1), () {
        // if (!mounted) return;
        messenger.clearSnackBars();
      });
    }
    _otpController.clear();
    focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      shrinkWrap: true,
      children: [
        ///
        Lottie.asset(
          "assets/lotties/login.json",
          height: 300,
        ),

        ///

        Text(
          "Enter the code sent to your email",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 20),

        // OTP input field
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 5,
              child: TextField(
                controller: _otpController,
                focusNode: focusNode,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  // fontSize: 20,
                  letterSpacing: 30,
                ),
                decoration: const InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (value.length == 6) FocusScope.of(context).unfocus();
                },
                onTapOutside: (value) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),

            ///
            // Paste from clipboard
            Expanded(
              flex: 1,
              child: IconButton(
                tooltip: "Copy from clipboard",
                color: Colors.blue,
                onPressed: _pasteFromClipboard,
                icon: Icon(
                  Icons.paste,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        // Submit button
        Center(
          child: ElevatedButton.icon(
            icon: Icon(Icons.login_outlined),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.amber,
              elevation: 0,
            ),
            label: const Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _submit,
          ),
        ),
      ],
    );
  }
}
