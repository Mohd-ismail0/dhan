import 'package:dhanda_app/features/auth/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userModelProvider = null;

final authControllerProvider = Provider(
    (ref) => AuthController(authRepository: ref.read(authRepositoryProvider)));

class AuthController {
  AuthRepository _authRepository;

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> phoneSignIn(BuildContext context, String phoneNumber) async {
    await _authRepository.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credentials) {},
      verificationFailed: (FirebaseAuthException e) {
        print("ver fail : ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("data")));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
