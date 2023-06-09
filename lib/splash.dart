import 'package:flutter/material.dart';
import 'classes/task.dart';
import 'classes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/gdg.png",
                  width: 300,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 50,
                ),
                CircularProgressIndicator()
              ]),
        ),
      ),
    );
  }
}
