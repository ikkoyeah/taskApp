import 'package:flutter/material.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'classes/task.dart';
import 'classes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

final GlobalKey<AnimatedCircularChartState> _chartKey =
    new GlobalKey<AnimatedCircularChartState>();

final List<Task> tasksNotCompleted = [
  Task(name: "Riunione", date: "2023-05-03", time: "15:00"),
  Task(name: "Scuola figlio", date: "2023-05-02", time: "08:00"),
  Task(name: "Palestra", date: "2023-05-03", time: "18:00"),
  Task(name: "Doc Ed Sheeran", date: "2023-05-05", time: "08:00")
];

final List<Task> tasksCompleted = [
  Task(name: "Corso Flutter", date: "2023-05-02", time: "18:00"),
  Task(name: "Esercizio Flutter", date: "2023-05-01", time: "10:00")
];

class Dash extends StatelessWidget {
  const Dash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          textTheme: GoogleFonts.latoTextTheme(
        Theme.of(context).textTheme,
      )),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                'Ciao, grandissimo!',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Promemoria'),
          backgroundColor: Colors.black54,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedCircularChart(
                key: _chartKey,
                size: const Size(200.0, 200.0),
                initialChartData: <CircularStackEntry>[
                  CircularStackEntry(
                    <CircularSegmentEntry>[
                      CircularSegmentEntry(
                        percCompleted(
                            tasksNotCompleted.length, tasksCompleted.length),
                        Colors.black12,
                        rankKey: 'completed',
                      ),
                      CircularSegmentEntry(
                        100 -
                            percCompleted(tasksNotCompleted.length,
                                tasksCompleted.length),
                        greenPastel,
                        rankKey: 'remaining',
                      ),
                    ],
                    rankKey: 'progress',
                  ),
                ],
                chartType: CircularChartType.Radial,
                percentageValues: true,
                holeLabel: (tasksCompleted.length).toString() +
                    "/" +
                    (tasksCompleted.length + tasksNotCompleted.length)
                        .toString(),
                labelStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text(
                        "Promemoria",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  // wrap in Expanded
                  child: ListView(
                      children: tasksNotCompleted.map(buildTask).toList())),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTask(Task task) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
          height: 100,
          color: taskColors[tasksNotCompleted.indexOf(task) % 4],
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      task.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.grey[600],
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  task.time,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.calendar_today,
                  color: Colors.grey[600],
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  task.date,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            )
          ])),
    );

double percCompleted(a, b) {
  return (100 * a / (a + b)).roundToDouble();
}
