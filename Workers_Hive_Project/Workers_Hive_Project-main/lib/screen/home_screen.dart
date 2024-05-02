import 'dart:io';

import 'package:flutter/material.dart';
import 'package:workers_project/db/functions/db_functions.dart';
import 'package:workers_project/models/worker_model/worker_model.dart';
import 'package:workers_project/screen/home_user_details.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});
  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  String search = "";
  List<WorkerModel> searchedList = [];

  void searchListUpdate() {
    getAllWorkers();
    searchedList = workerListNotifier.value
        .where(
          (workers) =>
              workers.name.toLowerCase().contains(search.toLowerCase()),
        )
        .toList();
  }

  final List<String> item = List.generate(4, (index) => "Item $index");
  @override
  Widget build(BuildContext context) {
    searchListUpdate();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                },
                leading: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 129, 127, 127),
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<List<WorkerModel>>(
                valueListenable: workerListNotifier,
                builder: (context, workersList, _) {
                  return SizedBox(
                    child: search.isNotEmpty
                        ? searchedList.isEmpty
                            ? const Center(
                                child: Column(
                                  children: [
                                    Text('No Worker available'),
                                  ],
                                ),
                              )
                            : buildworkerList(searchedList)
                        : buildworkerList(workersList),
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

Widget buildworkerList(List<WorkerModel> workersList) {
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
}

class WorkerListItem extends StatelessWidget {
  final WorkerModel worker;
  final int index;

  const WorkerListItem({super.key, required this.worker, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UserDetailScreen(
              name: worker.name,
              work: worker.job,
              place: worker.place,
              phone: worker.phone,
              fees: worker.fees,
              image: worker.image,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 205, 204, 204)),
            color: const Color.fromARGB(255, 111, 129, 144).withOpacity(0.2),
          ),
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
