import 'package:firebase_auth/firebase_auth.dart';
import 'package:watch_app/services/firebase_services.dart';

class FirebaseAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  static User? get currentUser => _auth.currentUser;

  // get current user stream
  static Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign up with email and password
  static Future<AuthResult> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Update displayNAme
      await result.user?.updateDisplayName(name);
      await result.user?.reload();

      //update display Name
      if (result.user != null) {
        final firestoreSuccess = await FirestoreService.createUserDocument(
          uid: result.user!.uid,
          email: email,
          name: name,
        );

        if (!firestoreSuccess) {
          // if firestore creations fails ,we still return success for auth
          //but log the error (user can still use the app)
          print("warning : Failed to create user document in firestore");
        }
      }
      return AuthResult(
        success: true,
        user: result.user,
        message: "Sign up successful",
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(success: false, message: _getErrorMessage(e.code));
    } catch (e) {
      // Handle errors, e.g., weak password, email already in use
      return AuthResult(
        success: false,
        user: null,
        message: 'An Unexpected Error Occured , Please Try AGain',
      );
    }
  }

  // Sign in with email and password
  static Future<AuthResult> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult(
        success: true,
        user: result.user,
        message: 'Signed in Successfully',
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(success: false, message: _getErrorMessage(e.code));
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'An Unexpected error Occured . Please Try Again',
      );
    }
  }

  //// send password reset email
  static Future<AuthResult> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return AuthResult(
        success: true,
        message: 'Password reset email sent successfully',
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(success: false, message: _getErrorMessage(e.code));
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'An unexpected error occurred. Please Try AgaIN',
      );
    }
  }

  // Sign out
  static Future<AuthResult> signOut() async {
    try {
      await _auth.signOut();
      return AuthResult(success: true, message: 'Signed out successfully');
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Failed to sign out. Please try again',
      );
    }
  }

  //CHECK if user is signed in
  static bool get isSignedIn => _auth.currentUser != null;

  //Get user email
  static String? get userEmail => _auth.currentUser?.email;

  //Get user Display Name
  static String? get userDisplayNAme => _auth.currentUser?.displayName;

  //Get User Id
  static String? get userId => _auth.currentUser?.uid;

  //helper method to get user friendly error messages
  static String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'An account already exists with this email address.';
      case 'weak-password':
        return 'Password is too weak. Please choose a stronger password.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';
      case 'invalid-credential':
        return 'Invalid email or password. Please check your credentials.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}

class AuthResult {
  final bool success;
  final User? user;
  final String message;

  AuthResult({required this.success, this.user, required this.message});
}
