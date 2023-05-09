
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

class AuthRepository {
  Future<void> verifyPhoneNumber(
      {required String phoneNumber,
      required void Function(FirebaseAuthException) verificationFailed,
      required void Function(PhoneAuthCredential) verificationCompleted,
      required void Function(String, int?) codeSent,
      required void Function(String) codeAutoRetrievalTimeout}) async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 79877 96282',
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
