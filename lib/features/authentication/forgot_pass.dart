import 'package:flutter/material.dart';
import 'package:pretium_app/utils/button.dart';
import 'package:pretium_app/utils/input_field.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Forgot Password",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Enter your email to receive a password reset code",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  )),
            ),
            const SizedBox(height: 30),
           InputField(labelText: "Email", controller: emailController, prefixIcon: Icons.email_outlined,
            validator: (value) => value!.isEmpty ? "Please enter your email" : null,
            ),
            const SizedBox(height: 20),
           
         CustomButton(onPressed: (){
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Password reset email sent')),
              );
            }
         }, title: "Send Reset Code",),
          ],
        )),
    );
  }
}