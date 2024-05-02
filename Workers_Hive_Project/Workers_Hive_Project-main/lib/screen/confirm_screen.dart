// ignore_for_file: use_super_parameters, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:workers_project/db/functions/db_functions.dart';
import 'package:workers_project/models/booked_model/booked_model.dart';
import 'package:workers_project/screen/confirm_details.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    getAllBookedWorkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<List<BookedModel>>(
                valueListenable: bookedListNotifier,
                builder: (context, bookedList, _) {
                  if (bookedList.isEmpty) {
                    return const Center(child: Text("No Confirmations"));
                  } else {
                    return ListView.builder(
                      itemCount: bookedList.length,
                      itemBuilder: (context, index) {
                        final worker = bookedList[index];
                        return WorkerListItem(
                          key: ValueKey(worker),
                          worker: worker,
                          index: index,
                        );
                      },
                    );
                  }
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

  const WorkerListItem({Key? key, required this.worker, required this.index})
      : super(key: key);

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
                            size: 20,
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
