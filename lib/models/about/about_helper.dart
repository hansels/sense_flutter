import 'package:cloud_firestore/cloud_firestore.dart';

class AboutHelper {
  final instance = FirebaseFirestore.instance;
  Future<String> getAbout() async {
    var doc = await instance.collection('configs').doc('about').get();
    if (!doc.exists) return "";
    return doc.data()['content'] ?? "";
  }
}
