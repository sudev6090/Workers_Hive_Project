import 'dart:io';

import 'package:flutter/material.dart';
import 'package:workers_project/db/functions/db_functions.dart';
import 'package:workers_project/models/booked_model/booked_model.dart';
import 'package:workers_project/screen/confirm_details.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    getAllBookedWorkers();
    super.initState();
  }

  final List<String> item = List.generate(2, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    getAllWorkers();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<List<BookedModel>>(
                valueListenable: bookedListNotifier,
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
  final BookedModel worker;
  final int index;

  const WorkerListItem({super.key, required this.worker, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ConfirmDetailScreen(
              name: worker.name,
              work: worker.job,
              place: worker.place,
              phone: worker.phone,
              fees: worker.fees,
              image: worker.image,
              index: index,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          height: 180,
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
                    height: 150,
                    width: 150,
                    color: const Color.fromARGB(255, 251, 251, 251),
                    margin: const EdgeInsets.only(right: 35),
                    child: worker.image.isNotEmpty
                        ? Image.file(File(worker.image))
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
                      const Row(
                        children: [
                          Text(
                            'CONFIRMED',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.done,
                            weight: 10,
                          )
                        ],
                      )
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
