import 'package:ferrous/pages/2fa/2fa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    emailController.clear();
    emailController.dispose();
    focusNode.unfocus();
    focusNode.dispose();
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
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          ///
          Lottie.asset(
            "assets/lotties/signup.json",
            height: 300,
          ),

          ///
          // Text(
          //   "Proceed With Your Email",
          // ),

          ///
          TextField(
            focusNode: focusNode,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              // fontSize: 20,
              // letterSpacing: 32,
            ),
            decoration: InputDecoration(
              hintText: "barbara@contoso.com",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              focusedBorder: InputBorder.none,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
              ),
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Colors.amber,
              //   ),
              // ),
              // focusedBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Colors.amber,
              //   ),
              // ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Colors.amber,
              //   ),
              // ),
            ),
            onChanged: (value) {
              // validate email
            },
            onTapOutside: (value) {
              focusNode.unfocus();
            },
          ),

          SizedBox(
            height: 30,
          ),

          /// submit button
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.amber,
              elevation: 0,
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
            ),
            icon: Icon(Icons.play_arrow_outlined),
            label: Text(
              "Continue",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            ///
            onPressed: () {
              emailController.clear();
              focusNode.unfocus();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TwoStepVerificationPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
