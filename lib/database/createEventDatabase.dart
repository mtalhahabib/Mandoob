import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';


class Create {
  final database = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  Future<void> createEvent(String uid, String title, String imagePath,
      String date, String time, String location, String notes) async {
    DocumentReference eventdocs = database
        .collection('users')
        .doc('events')
        .collection('eventsCollection')
        .doc();
      String eventId=eventdocs.id;
    eventdocs.set({
      'eventId':eventId,
      'OrganizerID': uid,
      'title': title,
      'imagePath': imagePath,
      'date': date,
      'time': time,
      'location': location,
      'notes': notes,
      'registrations': []
    }).then((value) async {});
  }

  Future<String> uploadImageAndGetUrl(imagePath) async {
    if (imagePath != null) {
      File file = File(imagePath);

      // Upload image to Firebase Storage
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference = storage.ref().child('images/$fileName.jpg');
      UploadTask uploadTask = storageReference.putFile(file);
      await uploadTask.whenComplete(() => null);

      // Get download URL
      String imageUrl = await storageReference.getDownloadURL();

      // Save image URL in Firestore

      print('Image uploaded and URL saved: $imageUrl');
      return imageUrl;
    } else {
      print('No image selected.');
      return '';
    }
  }

Future<void> someOneRegistered(String eventId, String name) async {
    try{
      DocumentReference eventdocs = database
        .collection('users')
        .doc('events')
        .collection('eventsCollection')
        .doc(eventId);
    eventdocs.update({
      
      'registrations':FieldValue.arrayUnion([name]),
    }).then((value) async {});
    }
    catch(e){
      Get.snackbar('Error', e.toString());
    }
  }

}
