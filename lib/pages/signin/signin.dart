import 'package:ferrous/pages/signin/components/2fa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  bool is2faReady = false;
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();

    // FocusScope.of(context).unfocus();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Sign ',
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'In',
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
      body: is2faReady == false
          ? ListView(
              padding: EdgeInsets.all(16),
              children: [
                ///
                Lottie.asset(
                  "assets/lotties/signup.json",
                  height: 300,
                ),

                ///
                Text(
                  "Enter your email to continue",
                  // "",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                ///
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    // fontSize: 20,
                    // letterSpacing: 32,
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    // hintText: "barbara@contoso.com",
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    // validate email
                  },
                  onTapOutside: (value) {
                    FocusScope.of(context).unfocus();
                  },
                ),

                SizedBox(
                  height: 30,
                ),

                /// submit button
                Center(
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.amber,
                      elevation: 0,
                    ),
                    icon: Icon(Icons.play_arrow_outlined),
                    label: Text(
                      "Continue",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        is2faReady = true;
                      });
                    },
                  ),
                )
              ],
            )
          : TwoStepVerificationPage(),
    );
  }
}
