import 'package:ferrous/pages/signup/signup.dart';
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
  final TextEditingController otpController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    // Later when you want to unfocus:
    otpController.clear();
    otpController.dispose();
    focusNode.unfocus();
    focusNode.dispose();
    super.dispose();
  }

  Future<void> _pasteFromClipboard() async {
    final data = await Clipboard.getData('text/plain');
    if (data != null && data.text != null) {
      // Keep only digits
      String digitsOnly = data.text!.replaceAll(RegExp(r'\D'), '');

      // Take up to 6 characters safely
      String text =
          digitsOnly.length > 6 ? digitsOnly.substring(0, 6) : digitsOnly;

      otpController.text = text;
      setState(() {});
    }
  }

  void _submit() {
    /// create an instance of scaffold messenger to avoid repition
    final messenger = ScaffoldMessenger.of(context);

    final code = otpController.text;
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
      otpController.clear();
      focusNode.unfocus();
    } else {
      messenger.showSnackBar(
        const SnackBar(
          content: Text("Enter the full 6-digit code"),
        ),
      );

      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;
        messenger.clearSnackBars();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Verify ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'OTP',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),

      ///
      body: ListView(
        padding: EdgeInsets.all(12),
        shrinkWrap: true,
        children: [
          ///
          Lottie.asset(
            "assets/lotties/login.json",
            height: 300,
          ),

          ///
          // Text("We Sent a Code, Check Your Email"),

          // OTP input field
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 5,
                child: TextField(
                  controller: otpController,
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    letterSpacing: 30,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: "123456",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      ),
                    ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //     color: Colors.amber,
                    //   ),
                    // ),
                  ),
                  onChanged: (value) {
                    if (value.length == 6) {
                      focusNode.unfocus();
                      _submit();
                    }
                  },
                  onTapOutside: (value) {
                    focusNode.unfocus();
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
          ElevatedButton.icon(
            icon: Icon(Icons.login_outlined),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.amber,
              elevation: 0,
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
            ),
            label: const Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _submit,

            ///
            onLongPress: () {
              otpController.clear();
              focusNode.unfocus();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignupPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
