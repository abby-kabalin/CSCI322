import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'calendar_event_model.g.dart';

@HiveType(typeId: 1)
class CalendarEventModel {
  CalendarEventModel({
    required this.name,
    required this.begin,
    required this.end,
    this.eventColor = Colors.green,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime begin;

  @HiveField(2)
  DateTime end;

  @HiveField(3)
  Color eventColor;
}
