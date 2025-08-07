import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepo = AuthRepository();

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
    required VoidCallback onSuccess,
  }) async {
    try {
      EasyLoading.show(status: 'Creating account...');
      await _authRepo.signUp(
        email: email,
        password: password,
        username: username,
      );
      EasyLoading.dismiss();
      onSuccess();
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }
}
