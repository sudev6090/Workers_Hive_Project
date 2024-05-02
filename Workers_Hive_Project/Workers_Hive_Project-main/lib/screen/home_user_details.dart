// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:workers_project/db/functions/db_functions.dart';
import 'package:workers_project/models/booked_model/booked_model.dart';
import 'package:workers_project/widgets/bottom_nav_screen.dart';

class UserDetailScreen extends StatefulWidget {
  final String name;
  final String work;
  final String place;
  final String phone;
  final String fees;
  final String image;

  const UserDetailScreen({
    super.key,
    required this.name,
    required this.work,
    required this.place,
    required this.phone,
    required this.fees,
    required this.image,
  });

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 320,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 251, 250, 250)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(image: FileImage(File(widget.image))),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textfeildDetails(text1: 'Name', text2: widget.name),
                      textfeildDetails(text1: 'Job', text2: widget.work),
                      textfeildDetails(text1: 'Place', text2: widget.place),
                      textfeildDetails(text1: 'Phone No', text2: widget.phone),
                      textfeildDetails(text1: 'Fees', text2: widget.fees),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 87, 88, 90),
                      minimumSize: const Size(150, 50),
                    ),
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Booking'),
                              content: const Text('Are You Sure'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                      final bookedWorker = BookedModel(
                                        image: widget.image,
                                        name: widget.name,
                                        job: widget.work,
                                        place: widget.place,
                                        phone: widget.phone,
                                        fees: widget.fees,
                                      );
                                      await addBookedWorker(bookedWorker);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MyBottom(),
                                        ),
                                      );
                                    },
                                    child: const Text('YES'))
                              ],
                            );
                          });
                    },
                    child: const Text(
                      'book',
                      style: TextStyle(
                          color: Color.fromARGB(255, 246, 245, 245),
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  textfeildDetails({
    required String text1,
    required String text2,
  }) =>
      Row(
        children: [
          Text(
            '$text1: ',
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            text2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      );
}
