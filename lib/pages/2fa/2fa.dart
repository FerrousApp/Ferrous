import 'package:ferrous/misc/animate_page.dart';
import 'package:ferrous/pages/wb.pinentry/wb.pinentry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TwoStepVerificationPage extends ConsumerStatefulWidget {
  const TwoStepVerificationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TwoStepVerificationPageState();
}

class _TwoStepVerificationPageState
    extends ConsumerState<TwoStepVerificationPage> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _pasteFromClipboard() async {
    final data = await Clipboard.getData('text/plain');
    if (data != null && data.text != null) {
      // final text = data.text!.replaceAll(RegExp(r'\D'), '').substring(0, 6);
      String text = data.text!.trim();
      // Remove any non-digit characters
      text = text.replaceAll(RegExp(r'\D'), '');
      _otpController.text = text;
      setState(() {});
    }
  }

  void _submit() {
    final code = _otpController.text;
    if (code.length == 6) {
      ScaffoldMessenger.of(context).clearSnackBars();
      // Proceed to verify code
      print('Code submitted: $code');

      Navigator.push(
        context,
        PageRouteAnimations.fadeTransitionRoute(
          WelcomeBackPinEntryPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter the full 6-digit code")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              '2-step verification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Enter the code from your authenticator app'),
            const SizedBox(height: 32),

            // OTP input field
            Center(
              child: SizedBox(
                width: width * 0.8,
                child: TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, letterSpacing: 32),
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.length == 6) FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Paste from clipboard
            Center(
              child: ElevatedButton.icon(
                onPressed: _pasteFromClipboard,
                icon: const Icon(Icons.paste, size: 18),
                label: const Text('Paste from clipboard'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: const Color(0xFFE7F1FF),
                  elevation: 0,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Log into your account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
