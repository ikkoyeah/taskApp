import 'package:flutter/material.dart';

class Task {
  final String name;
  final String date;
  final String time;

  Task({required this.name, required this.date, required this.time});

  Map<String, dynamic> toJson() => {'name': name, 'date': date, 'time': time};

  static Task fromJson(Map<String, dynamic> json) => Task(
        name: json['name'],
        date: json['date'],
        time: json['time'],
      );
}
