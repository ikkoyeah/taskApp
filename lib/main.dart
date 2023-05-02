import 'package:flutter/material.dart';
import 'classes/task.dart';
import 'classes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          )),
      home: Scaffold(
        body: Center(child: Text("L'app che devo programmare!")),
      ),
    );
  }
}
