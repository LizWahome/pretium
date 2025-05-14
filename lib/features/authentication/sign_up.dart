import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pretium_app/features/authentication/login.dart';
import 'package:pretium_app/utils/button.dart';
import 'package:pretium_app/utils/colors.dart';
import 'package:pretium_app/utils/input_field.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNmeCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  bool isObscure = true;
  bool value = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Get Started",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Simplify your crypto payments with us", 
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  )),
            ),
            const SizedBox(height: 30),
            InputField(labelText: "First Name", controller: firstNmeCtr, prefixIcon: Icons.person_outlined, validator: (value) => value!.isEmpty ? "Please enter your first name" : null,),
            InputField(labelText: "Last Name", controller: lastNameCtr, prefixIcon: Icons.person_outlined, validator: (value) => value!.isEmpty ? "Please enter your last name" : null),
            InputField(labelText: "Email", controller: emailCtr, prefixIcon: Icons.email_outlined, validator: (value) => value!.isEmpty ? "Please enter your email" : null),
            InputField(labelText: "Password", controller: passwordCtr, prefixIcon: Icons.lock_outline, isObscure: isObscure ,suffixIcon: IconButton(onPressed: (){
              setState(() {
                isObscure = !isObscure;
              });
            }, icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),),
            validator: (value) => value!.isEmpty ? "Please enter your password" : null),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Row(
                children: [
                  Checkbox(value: value, onChanged: (value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),),
                  const SizedBox(width: 10),
                   TextButton(
                    onPressed: ()async {
                      
                      final Uri url = Uri.parse("https://pretium.africa/term-of-use");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: AppColors.primaryColor,
                        content: Text("Opening terms and conditions"),
                      ));
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text("Accept Terms and Conditions",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline
                      ))),
                ],
              ),
            ),
            CustomButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              }
            }, title: "Create Account"),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  TextSpan(
                    text: "    Login",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Navigator.pop(context);
                    }
                  )
                ]
              )),
            )
          ],
        ),
      ),
    );
  }
}