import 'package:firebase_auth/firebase_auth.dart';
import 'package:skype_clone/resources/firebase_methods.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<User> getCurrentUser() => _firebaseMethods.getCurrentUser();

  Future<User> signIn() => _firebaseMethods.signIn();

  Future<bool> authenticateUser(User user) =>
      _firebaseMethods.authenticateUser(user);

  Future addDataToDb(User user) => _firebaseMethods.addDataToDb(user);

  Future signOut() => _firebaseMethods.signOut();
}
