import 'package:cloud_firestore/cloud_firestore.dart';

extension StreamQueryExtensions on Stream<QuerySnapshot> {
  Stream<Iterable<T>> mapList<T>(T Function(Map<String, dynamic>) mapper) {
    return this?.map((event) {
      var isEmpty = event?.docs?.isEmpty ?? true;
      if (isEmpty) return [];
      return event.docs.map((e) => mapper(e.data())).toList();
    });
  }
}

extension StreamDocumentExtensions on Stream<DocumentSnapshot> {
  Stream<T> mapDoc<T>(T Function(Map<String, dynamic>) mapper, T empty) {
    return this.map((event) {
      if (!event.exists) return empty;
      return mapper(event.data());
    });
  }
}
