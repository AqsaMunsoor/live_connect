import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

/// A [JsonConverter] that converts [DateTime] objects to [Timestamp] objects
/// for Firestore serialization and vice-versa for deserialization.
class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    // Convert Firestore Timestamp to Dart DateTime
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) {
    // Convert Dart DateTime to Firestore Timestamp
    return Timestamp.fromDate(date);
  }
}
