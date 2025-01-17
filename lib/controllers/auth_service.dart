import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  ///create user(signup) functionality
  static Future<String> createAccountWithEmail(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "Account Created";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  ///login functionality
  static Future<String> loginWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Login Successful";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  /// logout functionality
  static Future logout() async {
    await FirebaseAuth.instance.signOut();
    return "Logged Out";
  }

  ///check weather the user is logged in or not?
  static Future<bool> isLoggedIn() async {
    var user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
