import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:workers_project/db/functions/db_functions.dart';

class PieChartScreen extends StatefulWidget {
  const PieChartScreen({super.key});

  @override
  State<PieChartScreen> createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  @override
  Widget build(BuildContext context) {
    late int totalp;
    late int totalc;
    String tapIndex = "";
    totalp = workerListNotifier.value.length;
    totalc = bookedListNotifier.value.length;

    final List<PieData> pies = [
      PieData(value: totalp.toDouble(), color: Colors.orange),
      PieData(value: totalc.toDouble(), color: Colors.black),
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
                  style: const TextStyle(color: Colors.white),
                  child: Center(
                    child: Text(tapIndex),
                  )),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Total Workers')
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('Confirm Workers')
            ],
          ),
          const SizedBox(height: 250),
        ],
      ),
    );
  }
}
