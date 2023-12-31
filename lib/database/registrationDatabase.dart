import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RegistrationDatabase {
  final database = FirebaseFirestore.instance;

  Future<void> setUserName(
    String uid,
    String email,
    String name,
  ) async {
    await database.collection('users').doc(uid).set({
      'name': name,
      'email': email,
      'eventID': [],
    }).then((value) async {
      Get.snackbar('Congrat', 'You have been Registered');
    });
  }

  Future<String> getUserName(
    String uid,
  ) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    final name = snapshot.data() as Map<String, dynamic>;
    return name['name'].toString();
  }

  Future<void> registerInEvent(String uid, String eventID) async {
   try{
     await database.collection('users').doc(uid).update({
      'eventID': FieldValue.arrayUnion([eventID]),
    }).then((value) async {
      Get.snackbar('Congratulations', 'You have been Registered in this Event');
    });
   }
    catch(e){
      Get.snackbar('Error', '${e.toString()}');
    }
  }
  

}
