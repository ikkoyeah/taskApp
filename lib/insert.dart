import 'package:flutter/material.dart';
import 'classes/task.dart';
import 'classes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Insert extends StatelessWidget {
  const Insert({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          )),
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final controllerN = TextEditingController();
  final controllerD = TextEditingController();
  final controllerT = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: close,
            icon: Icon(Icons.close),
            color: Colors.black,
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              'Inserisci il promemoria',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            controller: controllerN,
            decoration:
                InputDecoration(labelText: "Nome task", hintText: "Nome"),
          ),
          TextField(
            controller: controllerD,
            decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: "Inserisci data promemoria"),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101));

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat("yyyy-MM-dd").format(pickedDate);

                setState(() {
                  controllerD.text = formattedDate;
                });
              }
            },
          ),
          TextField(
            controller: controllerT,
            decoration: InputDecoration(
                icon: Icon(Icons.watch), labelText: "Inserisci ora promemoria"),
            readOnly: true,
            onTap: () async {
              TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: 0, minute: 0),
                  builder: (context, childWidget) {
                    return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: true),
                        child: childWidget!);
                  });

              if (time != null) {
                setState(() {
                  controllerT.text = time.hour.toString().padLeft(2, '0') +
                      ":" +
                      time.minute.toString().padLeft(2, '0');
                });
              }
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                createTask(
                    name: controllerN.text,
                    date: controllerD.text,
                    time: controllerT.text);
              },
              child: Text("Inserisci promemoria"))
        ]),
      ),
    );
  }
}

void close() {
  return;
}

Future createTask(
    {required String name, required String date, required String time}) async {
  //final docTask = FirebaseFirestore.instance.collection("task");
  //final json = {'name': name, 'date': date, 'time': time};
  //await docTask.add(json);
}
