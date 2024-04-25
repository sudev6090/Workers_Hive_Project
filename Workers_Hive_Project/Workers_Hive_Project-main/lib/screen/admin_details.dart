import 'dart:io';

import 'package:flutter/material.dart';
import 'package:workers_project/db/functions/db_functions.dart';
import 'package:workers_project/models/worker_model/worker_model.dart';
import 'package:workers_project/screen/edit_screen.dart';

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
            Expanded(
              child: ValueListenableBuilder<List<WorkerModel>>(
                valueListenable: workerListNotifier,
                builder: (context, workersList, _) {
                  return ListView.builder(
                    itemCount: workersList.length,
                    itemBuilder: (context, index) {
                      final worker = workersList[index];
                      return WorkerListItem(
                        worker: worker,
                        index: index,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkerListItem extends StatelessWidget {
  final WorkerModel worker;
  final int index;

  const WorkerListItem({super.key, required this.worker, required this.index});

  @override
  Widget build(BuildContext context) {
    getAllWorkers();
    final height = MediaQuery.sizeOf(context).height * 1;
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Container(
            height: height * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: const Color.fromARGB(255, 205, 204, 204)),
              color: const Color.fromARGB(255, 111, 129, 144).withOpacity(0.2),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: const Color.fromARGB(255, 157, 167, 184),
                  margin: const EdgeInsets.only(right: 35),
                  child: worker.image.isNotEmpty
                      ? FittedBox(
                          fit: BoxFit.cover,
                          child: Image.file(File(worker.image)),
                        )
                      : Container(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      worker.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('WORK: ${worker.job}'),
                    Text('PLACE: ${worker.place}'),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditScreen(
                                  name: worker.name,
                                  work: worker.job,
                                  place: worker.place,
                                  phone: worker.phone,
                                  fees: worker.fees,
                                  image: worker.image,
                                  index: index),
                            ),
                          );
                        },
                        child: const Icon(Icons.edit)),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          deleteWorker(index);
                        },
                        child: const Icon(Icons.delete))
                  ],
                ),
                const SizedBox(
                  width: 1,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
