import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:ferrous/pages/2fa/2fa.dart';
import 'package:ferrous/pages/signin/providers/provider.dart';
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

  // Add this state variable to manage the loading state
  AsyncValue<String>? _signInState;

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
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Lottie.asset(
            "assets/lotties/signup.json",
            height: 300,
          ),
          TextField(
            focusNode: focusNode,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              hintText: "barbara@contoso.com",
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              focusedBorder: InputBorder.none,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
              ),
            ),
            onTapOutside: (value) {
              focusNode.unfocus();
            },
          ),
          const SizedBox(height: 30),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.amber,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            icon: _signInState?.isLoading == true
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: Colors.black),
                  )
                : const Icon(Icons.play_arrow_outlined),
            label: Text(
              _signInState?.isLoading == true ? 'Processing...' : "Continue",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _signInState?.isLoading == true
                ? null
                : () async {
                    focusNode.unfocus();

                    // 1. Get the email from the text field
                    final email = emailController.text.trim();

                    // 2. Check for empty email
                    if (email.isEmpty || !EmailValidator.validate(email)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please enter an email address')),
                      );
                      Future.delayed(const Duration(seconds: 1), () {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).clearSnackBars();
                      });
                      return;
                    }

                    // 3. Clear existing state
                    setState(() {
                      _signInState = const AsyncValue.loading();
                    });

                    // 4. Use ref.read to trigger the provider and get the result
                    final response =
                        await ref.read(signInWithEmailProvider(email).future);

                    // 5. Check if the widget is still mounted before navigating
                    if (!mounted) return;

                    // 6. Update state based on success or error
                    try {
                      setState(() {
                        _signInState = AsyncValue.data(response);
                      });

                      // Show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(response)),
                      );

                      // Navigate to the next page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  TwoStepVerificationPage(email: email),
                        ),
                      );
                    } catch (e) {
                      setState(() {
                        _signInState = AsyncValue.error(e, StackTrace.current);
                      });

                      // Show error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.toString()}')),
                      );
                    }
                  },
          ),
        ],
      ),
    );
  }
}




// class GPage extends ConsumerStatefulWidget {
//   const GPage({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _GPageState();
// }

// class _GPageState extends ConsumerState<GPage> {
//   final TextEditingController emailController = TextEditingController();
//   final focusNode = FocusNode();

//   @override
//   void dispose() {
//     emailController.clear();
//     emailController.dispose();
//     focusNode.unfocus();
//     focusNode.dispose();
//     super.dispose();
//   }

//   Future<String?> doEmail() async {
    
//   }

//   @override
//   Widget build(BuildContext context) {

  

//     return Scaffold(
//       appBar: AppBar(
//         title: Text.rich(
//           TextSpan(
//             children: [
//               TextSpan(
//                 text: 'Sign ',
//                 style: TextStyle(
//                   // color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextSpan(
//                 text: 'In',
//                 style: TextStyle(
//                   color: Colors.amber,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       ///
//       body: ListView(
//         padding: EdgeInsets.all(12),
//         children: [
//           ///
//           Lottie.asset(
//             "assets/lotties/signup.json",
//             height: 300,
//           ),

//           ///
//           // Text(
//           //   "Proceed With Your Email",
//           // ),

//           ///
//           TextField(
//             focusNode: focusNode,
//             controller: emailController,
//             keyboardType: TextInputType.emailAddress,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 20,
//               // fontSize: 20,
//               // letterSpacing: 32,
//             ),
//             decoration: InputDecoration(
//               hintText: "barbara@contoso.com",
//               hintStyle: TextStyle(
//                 color: Colors.grey,
//               ),
//               focusedBorder: InputBorder.none,
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.amber,
//                 ),
//               ),
//               // border: OutlineInputBorder(
//               //   borderSide: BorderSide(
//               //     color: Colors.amber,
//               //   ),
//               // ),
//               // focusedBorder: UnderlineInputBorder(
//               //   borderSide: BorderSide(
//               //     color: Colors.amber,
//               //   ),
//               // ),
//               // enabledBorder: OutlineInputBorder(
//               //   borderSide: BorderSide(
//               //     color: Colors.amber,
//               //   ),
//               // ),
//             ),
            
//             onChanged: (value) {
//               // validate email
//             },
//             onTapOutside: (value) {
//               focusNode.unfocus();
//             },
//           ),

//           SizedBox(
//             height: 30,
//           ),

//           /// submit button
//           TextButton.icon(
//             style: TextButton.styleFrom(
//               foregroundColor: Colors.black,
//               backgroundColor: Colors.amber,
//               elevation: 0,
//               padding: EdgeInsets.symmetric(
//                 vertical: 12,
//               ),
//             ),
//             icon: Icon(Icons.play_arrow_outlined),
//             label: Text(
//               "Continue",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             ///
//             onPressed: () async {
//               emailController.clear();
//               focusNode.unfocus();

//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => TwoStepVerificationPage(),
//                 ),
//               );

//               // Navigator.of(context).push(
//               //   MaterialPageRoute(
//               //     builder: (context) => TwoStepVerificationPage(),
//               //   ),
//               // );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
