import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:watch_app/features/shipping/model/address.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _usersCollection = 'users';

  // Create user document in Firestore
  static Future<bool> createUserDocument({
    required String uid,
    required String email,
    required String name,
  }) async {
    try {
      final userData = {
        'uid': uid,
        'email': email,
        'name': name,
        'displayName': name,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'isActive': true,
        'profileImageUrl': null,
        'phoneNumber': null,
        'dateOfBirth': null,
        'gender': null,
        'addresses': [],
        'preferences': {},
        'notifications': true,
        'emailupdates': true,
        'darkMode': false,
      };

      await _firestore.collection(_usersCollection).doc(uid).set(userData);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Get user document from firestore
  static Future<Map<String, dynamic>?> getUserDocument(String uid) async {
    try {
      final doc = await _firestore.collection(_usersCollection).doc(uid).get();

      if (doc.exists) {
        return doc.data();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Update User document
  static Future<bool> updateUserDocument({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _firestore
          .collection(_usersCollection)
          .doc(uid)
          .update(data); // Added missing part of the line
      return true;
    } catch (e) {
      return false;
    }
  }

  //update user profile
  static Future<bool> updateUserProfile({
    required String uid,
    String? name,
    String? phoneNumber,
    String? dateOfBirth,
    String? gender,
    String? profileImageUrl,
  }) async {
    try {
      final Map<String, dynamic> updateData = {
        "updatedAt": FieldValue.serverTimestamp(),
      };

      if (name != null) {
        updateData['name'] = name;
        updateData['displayName'] =
            name; // Assuming displayName is also updated with name
      }
      if (phoneNumber != null) updateData['phoneNumber'] = phoneNumber;
      if (dateOfBirth != null) updateData['dateOfBirth'] = dateOfBirth;
      if (gender != null) updateData['gender'] = gender;
      if (profileImageUrl != null)
        updateData['profileImageUrl'] = profileImageUrl;

      await _firestore.collection(_usersCollection).doc(uid).update(updateData);
      return true;
    } catch (e) {
      // Handle error,
      return false;
    }
  }

  //Add user Addres
  static Future<bool> addUserAddress({
    required String uid,
    required Map<String, dynamic> address,
  }) async {
    try {
      await _firestore.collection(_usersCollection).doc(uid).update({
        'addresses': FieldValue.arrayUnion([Address]),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      return true;
    } catch (e) {
      return false;
    }
  }


  //   Update user prefernces
 static Future<bool> updateUserPreferences({
    required String uid,
    required Map<String, dynamic> preferences,
  }) async {
    try {
      await _firestore.collection(_usersCollection).doc(uid).update({
        'preferences': preferences,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      return true;
    } catch (e) {
      return false;
    }
  }


// delete user document(for account delection)
static Future<bool> deleteUserDocument(String uid) async {
  try {
    await _firestore.collection(_usersCollection).doc(uid).delete();
    return true;
  } catch (e) {
    return false;
  }
}

// check if user document exists
static Future<bool> userDocumentExists(String uid) async {
  try {
    final doc = await _firestore.collection(_usersCollection).doc(uid).get();
    return doc.exists;
  } catch (e) {
    return false;
  }
}

//get user Stream for real time update
static Stream<DocumentSnapshot<Map<String, dynamic>>>getUserStream(String uid){
   return  _firestore.collection(_usersCollection).doc(uid).snapshots();
}


}
