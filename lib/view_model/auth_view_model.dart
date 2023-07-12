import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_with_mvvm/repository/auth_repository.dart';
import 'package:flutter_app_with_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_app_with_mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;
  
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage("Login Successfully", context);
        Navigator.pushNamed(context, RoutesName.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage("Sign Up Successfully", context);
        Navigator.pushNamed(context, RoutesName.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
