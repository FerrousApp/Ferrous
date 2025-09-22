import 'package:dio/dio.dart';
import 'package:ferrous/pages/2fa/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import 'package:ferrous/pages/signup/signup.dart';
import 'package:ferrous/pages/wb.pinentry/wb.pinentry.dart';

class TwoStepVerificationPage extends ConsumerStatefulWidget {
  final String email;
  const TwoStepVerificationPage({
    super.key,
    required this.email,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TwoStepVerificationPageState();
}

class _TwoStepVerificationPageState
    extends ConsumerState<TwoStepVerificationPage> {
  final TextEditingController otpController = TextEditingController();
  final focusNode = FocusNode();
  AsyncValue<Map<String, dynamic>>? _verificationState;

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

  void _submit() async {
    // Clear any existing snackbars
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();

    final code = otpController.text.trim();
    final email = widget.email;

    if (code.length != 6) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text("Enter the full 6-digit code"),
        ),
      );
      return;
    }

    // Set the state to loading
    setState(() {
      _verificationState = const AsyncValue.loading();
    });

    // Call the provider using ref.read and the family argument
    try {
      final response = await ref.read(
        verifyOTPEmailProvider(
          {"email": email, "otp": code},
        ).future,
      );

      // After async gap, check if the widget is still mounted before proceeding
      if (!mounted) return;

      // Set the state to data
      setState(() {
        _verificationState = AsyncValue.data(response);
      });

      // On success, navigate to the next page
      otpController.clear();
      focusNode.unfocus();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeBackPinEntryPage(),
        ),
      );
    } catch (e) {
      // After async gap, check if the widget is still mounted
      if (!mounted) return;

      // Set the state to error
      setState(() {
        _verificationState = AsyncValue.error(e, StackTrace.current);
      });

      // Show error message from Dio or other sources
      String errorMessage = 'Failed to verify OTP. Please try again.';
      if (e is DioException && e.response?.data != null) {
        errorMessage = e.response!.data['message'] ?? errorMessage;
      } else {
        errorMessage = e.toString();
      }
      messenger.showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
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
            icon: _verificationState?.isLoading == true
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: Colors.black),
                  )
                : const Icon(Icons.login_outlined),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.amber,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
            ),
            label: Text(
              _verificationState?.isLoading == true
                  ? 'Verifying...'
                  : 'Sign In',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _verificationState?.isLoading == true
                ? null
                : _submit, // Disable button while loading
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
