import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fireeeee/model/item.dart';

class CloudFireStoreProvider extends ChangeNotifier {
  CloudFireStoreProvider() {
    _controller = TextEditingController();
    fetchRecords();
  }

  String collectionName = 'random_numbers'; // Collection name in Firestore

  final db = FirebaseFirestore.instance; // Firestore instance initialization

  List<Item>? _items = [];
  List<Item>? get items => _items;

  TextEditingController? _controller;
  TextEditingController? get controller => _controller;

  bool? _condition = false;
  bool? get condition => _condition;

  getCondition() {
    _condition = !_condition!;

    notifyListeners();
  }

  fetchRecords() async {
    // Fetch records from the database
    var records = await db
        .collection(collectionName) // Collection name
        .orderBy("timestamp", descending: true) // Order by timestamp
        .get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs
        .map(
          (item) => Item(
              numbers: item['numbers'], // Field name in Firestore
              timestamp: item['timestamp']), // Field name in Firestore
        )
        .toList();

    _items = list;
    notifyListeners();
  }

  addItem(String numbers) async {
    var item = Item(numbers: numbers, timestamp: FieldValue.serverTimestamp());
    await db.collection(collectionName).add(item.toJson());
    fetchRecords();
  }

  deleteItem(String numbers) async {
    // Query the document with the matching 'numbers' field
    var snapshot = await db
        .collection(collectionName) // Collection name
        .where('numbers', isEqualTo: numbers) // Field name in Firestore
        .get();

    for (var doc in snapshot.docs) {
      await db
          .collection(collectionName)
          .doc(doc.id)
          .delete(); // Delete the document
    }
    fetchRecords();
  }
}
