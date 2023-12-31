import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RetrieveEvents {
  Stream<QuerySnapshot> retrieveEventData() {
    final database = FirebaseFirestore.instance;
    Stream<QuerySnapshot> events = database
        .collection('users')
        .doc('events')
        .collection('eventsCollection')
        .snapshots();
    return events;
  }

  Future<List<String>> Idees(uid) async {
    final database = FirebaseFirestore.instance;
    final snapshot = await database.collection('users').doc(uid).get();
    List<String> Idees = snapshot.data()?['eventID'];
    return Idees;
  }

  retrieveMyEvents(uid) async {
    final database = FirebaseFirestore.instance;

    final snapshot = await database.collection('users').doc(uid).get();
    final eventMap = snapshot.data() as Map<String, dynamic>;

    final Ids = eventMap['eventID'];

    final events = database
        .collection('users')
        .doc('events')
        .collection('eventsCollection')
        .where(FieldPath.documentId, whereIn: Ids)
        .get();
    return events;
  }
   
}
