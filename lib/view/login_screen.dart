import 'package:flutter/material.dart';
import 'package:mvvm/resources/components/custom_field.dart';
import 'package:mvvm/resources/components/round_button.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField(title: 'Email', controller: provider.emailController),
            SizedBox(height: 20),
            CustomField(
              title: 'Password',
              controller: provider.passwordController,
            ),
            SizedBox(height: 20),
            RoundButton(
              title: 'Login',
              onTap: () {
                if (provider.emailController.text.isEmpty) {
                  Utils.showFlushBarMessage('Please enter email', context);
                }else if (provider.passwordController.text.isEmpty) {
                  Utils.showFlushBarMessage('Please enter password', context);
                }else if (provider.passwordController.text.length < 6) {
                  Utils.showFlushBarMessage('Please 6 digits password required', context);
                }else{
                  provider.login(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
