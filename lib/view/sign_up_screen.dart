import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/components/custom_field.dart';
import '../resources/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField(title: 'Email', controller: provider.signUpEmailController),
            SizedBox(height: 20),
            CustomField(
              title: 'Password',
              controller: provider.signUpPasswordController,
            ),
            SizedBox(height: 20),
            RoundButton(
              isLoading: provider.signUpLoading,
              title: 'Login',
              onTap: () {
                if (provider.emailController.text.isEmpty) {
                  Utils.showFlushBarMessage('Please enter email', context);
                }else if (provider.passwordController.text.isEmpty) {
                  Utils.showFlushBarMessage('Please enter password', context);
                }else if (provider.passwordController.text.length < 6) {
                  Utils.showFlushBarMessage('Please 6 digits password required', context);
                }else{
                  provider.signUp(context);
                }
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
