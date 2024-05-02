import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:workers_project/db/functions/db_functions.dart';

class PieChartScreen extends StatefulWidget {
  const PieChartScreen({super.key});

  @override
  State<PieChartScreen> createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  late int totalp;
  late int totalc;
  String tapIndex = "";

  @override
  Widget build(BuildContext context) {
    totalp = workerListNotifier.value.length;
    totalc = bookedListNotifier.value.length;

    final List<PieData> pies = [
      PieData(value: totalp.toDouble(), color: Colors.cyan),
      PieData(value: totalc.toDouble(), color: Colors.lightGreen),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Pie Chart')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EasyPieChart(
                children: pies,
                pieType: PieType.crust,
                onTap: (index) {
                  tapIndex = index.toString();
                  setState(() {});
                },
                gap: 0.2,
                start: 0,
                animateFromEnd: true,
                size: 200,
                child: Center(child: Text(tapIndex)),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
