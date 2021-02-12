import 'package:flutter/foundation.dart';

class Task {
  String category;
  String description;
  String startTime;
  String endTime;
  String title;
  DateTime date;
  Task(
      {this.category,
      this.description,
      this.date,
      this.title,
      this.endTime,
      this.startTime});
}
