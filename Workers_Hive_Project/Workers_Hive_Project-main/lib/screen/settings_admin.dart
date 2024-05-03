import 'package:flutter/material.dart';
import 'package:workers_project/db/functions/db_functions.dart';
import 'package:workers_project/screen/settings_admin_details.dart';
import 'package:workers_project/screen/settings_admin_piechart.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    getAllWorkers();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADMIN'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: GestureDetector(
                child: Container(
                    height: 150,
                    width: 390,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(18)),
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Icon(
                          Icons.person_rounded,
                          size: 45,
                        ),
                        Text(
                          'USER DETAILS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )
                      ],
                    )),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AdminDetails()));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: GestureDetector(
                child: Container(
                  height: 150,
                  width: 390,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(18)),
                  child: const Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Icon(Icons.refresh_outlined, size: 45),
                      Text('RESET',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17))
                    ],
                  ),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Warning'),
                          content: const Text('Are You Sure'),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  deleteAllData();
                                  Navigator.pop(context);
                                },
                                child: const Text('YES'))
                          ],
                        );
                      });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PieChartScreen()));
                },
                child: Container(
                  height: 150,
                  width: 390,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(18)),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      Icon(
                        Icons.bar_chart_rounded,
                        size: 45,
                      ),
                      Text(
                        'PIE CHART',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
