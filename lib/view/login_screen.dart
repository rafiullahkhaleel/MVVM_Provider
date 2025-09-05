import 'package:flutter/material.dart';
import 'package:mvvm/resources/components/custom_field.dart';
import 'package:mvvm/resources/components/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField(title: 'Email', controller: TextEditingController()),
            SizedBox(height: 20),
            CustomField(title: 'Password', controller: TextEditingController()),
            SizedBox(height: 20),
            RoundButton(title: 'Login', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
