import 'package:firebase_auth/firebase_auth.dart';

class SignInController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User? _currentUser;

  User? get currentUser => _currentUser;

  Future<bool> signInWithEmailPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      _currentUser = result.user;
      return true;
    } catch (e) {
      print("Sign in error: $e");
      return false;
    }
  }
}
