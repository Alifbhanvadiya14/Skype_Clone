import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skype_clone/models/user.dart';
import 'package:skype_clone/utils/utilities.dart';

class FirebaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //User class;
  UserDetails userDetails = UserDetails();

  Future<User> getCurrentUser() async {
    User _currentUser;
    _currentUser = _auth.currentUser;

    return _currentUser;
  }

  Future<User> signIn() async {
    GoogleSignInAccount account = await _googleSignIn.signIn();
    GoogleSignInAuthentication authentication = await account.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken);

    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    User user = userCredential.user;

    return user;
  }

  Future<bool> authenticateUser(User user) async {
    QuerySnapshot result = await firestore
        .collection("users")
        .where("email", isEqualTo: user.email)
        .get();

    final List<DocumentSnapshot> docs = result.docs;
    //user is registered then length > 0 else 0
    return docs.length == 0 ? true : false;
  }

  Future addDataToDb(User currentUser) async {
    String username = Utils.getUsername(currentUser.email);

    userDetails = UserDetails(
      uid: currentUser.uid,
      email: currentUser.email,
      name: currentUser.displayName,
      profilePhoto: currentUser.photoURL,
      username: username,
    );

    firestore
        .collection("users")
        .doc(currentUser.uid)
        .set(userDetails.toMap(userDetails));
  }

  Future signOut() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();

    return await _auth.signOut();
  }
}
