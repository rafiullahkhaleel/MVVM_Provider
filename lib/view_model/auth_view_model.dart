import 'package:flutter/material.dart';
import 'package:mvvm/data/app_exception.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  login(BuildContext context) async {
    Map data = {
      'username': _emailController.text.toString(),
      'password': _passwordController.text.toString(),
    };
    print(data);
    final response = await    AuthRepository().loginApi(data).then((value) {
      Utils.showFlushBarMessage('Login Successfully', context);
    });
    print(response);
  }
}
