import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sense_flutter/models/resort/resort.dart';
import 'package:sense_flutter/extensions/stream_extensions.dart';
import 'package:sense_flutter/extensions/future_extensions.dart';

class ResortHelper {
  final instance = FirebaseFirestore.instance;
  Stream<Iterable<Resort>> listResortByType(String type) {
    return instance
        .collection('resorts')
        .where("type", isEqualTo: type)
        .snapshots()
        .mapList<Resort>(Resort.fromMap);
  }

  Future<List<Resort>> getResortsBySpecialties(String specialty) async {
    var resorts = await instance
        .collection('resorts')
        .get()
        .mapQuery<Resort>(Resort.fromMap, []);

    return resorts.where((e) => e.specialties.contains(specialty)).toList();
  }
}
