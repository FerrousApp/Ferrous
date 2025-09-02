import 'package:flutter/material.dart';
import 'package:ferrous/misc/appsizing.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  DateTime? _selectedDate;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    countryController.dispose();

    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) => child!,
    );

    ///
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        dobController.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
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
                text: 'Sign ',
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Up',
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
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(12),

          ///
          children: [
            Icon(
              Icons.account_box_rounded,
              size: 100,
              color: Colors.amber,
            ),

            ///
            Text('First Name'),
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
              ),
              validator: (value) => value == null || value.isEmpty
                  ? 'Enter your first name'
                  : null,
            ),
            AppSizing.k20(context),

            ///
            Text("Last Name"),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(
                // labelText: 'Last Name',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
              ),
              validator: (value) => value == null || value.isEmpty
                  ? 'Enter your last name'
                  : null,
            ),
            AppSizing.k20(context),

            ///
            Text('Phone Number'),
            IntlPhoneField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
              ),

              // validator: (value) =>
              //     value == null || value.completeNumber.isEmpty
              //         ? 'Enter your phone number'
              //         : null,
            ),
            AppSizing.k20(context),

            ///
            Text('Date of Birth'),
            TextFormField(
              controller: dobController,
              readOnly: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: _pickDate,
              validator: (value) => value == null || value.isEmpty
                  ? 'Select your date of birth'
                  : null,
            ),
            AppSizing.k20(context),

            ///
            // Text('Country of Origin'),
            // TextFormField(
            //   controller: countryController,
            //   decoration: InputDecoration(
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(
            //         color: Colors.amber,
            //       ),
            //     ),
            //     enabledBorder: UnderlineInputBorder(
            //       borderSide: BorderSide(
            //         color: Colors.amber,
            //       ),
            //     ),
            //   ),
            //   validator: (value) => value == null || value.isEmpty
            //       ? 'Enter your country of origin'
            //       : null,
            // ),

            const SizedBox(height: 30),

            ///
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.account_circle),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amber,
                  elevation: 0,
                ),
                label: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle sign up logic here
                    final data = {
                      "first_name": firstNameController.text,
                      "last_name": lastNameController.text,
                      "phone_number": phoneController.text,
                      "date_of_birth": dobController.text,
                      "country_of_origin": countryController.text,
                    };
                    // TODO: send data to backend or next page
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sign up successful!')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
