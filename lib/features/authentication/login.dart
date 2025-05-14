import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pretium_app/features/authentication/forgot_pass.dart';
import 'package:pretium_app/features/authentication/sign_up.dart';
import 'package:pretium_app/features/home/home.dart';
import 'package:pretium_app/utils/assets.dart';
import 'package:pretium_app/utils/button.dart';
import 'package:pretium_app/utils/colors.dart';
import 'package:pretium_app/utils/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsUrls.wallet),
            const SizedBox(height: 30),
            Text(
              "Welcome Back!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              "Sign in to continue",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 50),
            InputField(
              labelText: "Email",
              controller: emailController,
              prefixIcon: Icons.email_outlined,
              validator: (value) => value!.isEmpty ? "Please enter your email" : null,
            ),
            InputField(labelText: "Password", controller: passwordController, isObscure: isObscure, prefixIcon: Icons.lock_outline, suffixIcon: IconButton(onPressed: (){
              setState(() {
                isObscure = !isObscure;
              });
            }, icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),),
            validator: (value) => value!.isEmpty ? "Please enter your password" : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          activeColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          ),
                          const SizedBox(width: 5),
                          Text("Remember me")
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassPage()));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
           CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
            
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }
              },
              title: "Login",
            ),
            const SizedBox(height: 40),
            RichText(
                text: TextSpan(
              children: [
                TextSpan(
                  text: "Don't have an account? ",
                  
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                TextSpan(
                  text: "   Sign Up",
                  style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
