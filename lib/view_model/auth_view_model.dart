import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _signUpEmailController = TextEditingController();
  final TextEditingController _signUpPasswordController =
      TextEditingController();
  bool _isLoading = false;
  bool _signUpLoading = false;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get signUpEmailController => _signUpEmailController;
  TextEditingController get signUpPasswordController =>
      _signUpPasswordController;
  bool get loading => _isLoading;
  bool get signUpLoading => _signUpLoading;
  set loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set signUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  login(BuildContext context) async {
    loading = true;
    Map data = {
      'email': _emailController.text.toString(),
      'password': _passwordController.text.toString(),
    };
    await AuthRepository()
        .loginApi(data)
        .then((value) {
          final sp = Provider.of<UserViewModel>(context, listen: false);
          sp.saveUser(UserModel(token: value['token'].toString()));
          loading = false;

          Utils.showFlushBarMessage('Login Successfully', context);
        })
        .onError((error, trace) {
          loading = false;
          Utils.showFlushBarMessage(error.toString(), context);
        });
  }

  signUp(BuildContext context) async {
    signUpLoading = true;
    Map data = {
      'email': _signUpEmailController.text.toString(),
      'password': _signUpPasswordController.text.toString(),
    };

    await AuthRepository()
        .signUpApi(data)
        .then((value) {
          signUpLoading = false;
          Utils.showFlushBarMessage('Login Successfully', context);
        })
        .onError((error, trace) {
          signUpLoading = false;
          Utils.showFlushBarMessage(error.toString(), context);
        });
  }
}
