import 'package:flutter/gestures.dart';
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
      appBar: AppBar(title: Text('Login'),centerTitle: true,),
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
              isLoading: provider.loading,
              title: 'Login',
              onTap: () {
                if (provider.emailController.text.isEmpty) {
                  Utils.showFlushBarMessage('Please enter email', context);
                } else if (provider.passwordController.text.isEmpty) {
                  Utils.showFlushBarMessage('Please enter password', context);
                } else if (provider.passwordController.text.length < 6) {
                  Utils.showFlushBarMessage(
                    'Please 6 digits password required',
                    context,
                  );
                } else {
                  provider.login(context);
                }
              },
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: "Don't have an account ? ",style: TextStyle( // 👈 yeh add karna zaroori hai
                color: Colors.black,
                fontSize: 16,
              ),
                children: [
                  TextSpan(
                    text: 'Sign Up',style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, 'sign_up');
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
