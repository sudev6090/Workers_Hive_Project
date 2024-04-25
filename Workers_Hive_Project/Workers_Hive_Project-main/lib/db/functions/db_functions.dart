// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, avoid_print

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:workers_project/models/booked_model/booked_model.dart';
import 'package:workers_project/models/worker_model/worker_model.dart';

ValueNotifier<List<WorkerModel>> workerListNotifier = ValueNotifier([]);
ValueNotifier<List<BookedModel>> bookedListNotifier = ValueNotifier([]);
Future addWorker(WorkerModel value) async {
  final workerDB = await Hive.openBox<WorkerModel>('worker_db');
  await workerDB.add(value);
  print('Worker added: $value');
  workerListNotifier.value.add(value);
  workerListNotifier.notifyListeners();
  getAllWorkers();
}

Future addBookedWorker(BookedModel value) async {
  final bookedDB = await Hive.openBox<BookedModel>('booked_db');
  await bookedDB.add(value);
  print('Worker added: $value');
  bookedListNotifier.value.add(value);
  bookedListNotifier.notifyListeners();
}

Future<void> getAllWorkers() async {
  final workerDB = await Hive.openBox<WorkerModel>('worker_db');
  workerListNotifier.value.clear();
  workerListNotifier.value.addAll(workerDB.values);
  workerListNotifier.notifyListeners();
}

Future<void> getAllBookedWorkers() async {
  final bookedDB = await Hive.openBox<BookedModel>('booked_db');
  bookedListNotifier.value.clear();
  bookedListNotifier.value.addAll(bookedDB.values);
  bookedListNotifier.notifyListeners();
}

Future<void> deleteWorker(int index) async {
  final workerDB = await Hive.openBox<WorkerModel>('worker_db');
  await workerDB.deleteAt(index);
  workerListNotifier.notifyListeners();
  getAllWorkers();
}

Future<void> deleteBookedWorker(int index) async {
  final bookedDB = await Hive.openBox<BookedModel>('booked_db');
  await bookedDB.deleteAt(index);
  bookedListNotifier.notifyListeners();
  getAllBookedWorkers();
}

Future<void> deleteAllData() async {
  final workerDB = await Hive.openBox<WorkerModel>('worker_db');
  final bookedDB = await Hive.openBox<BookedModel>('booked_db');

  await workerDB.clear();
  await bookedDB.clear();
  workerListNotifier.notifyListeners();
}


Future<void> editworkers(index, WorkerModel value) async {
  final workerDB = await Hive.openBox<WorkerModel>('worker_db');
  workerListNotifier.notifyListeners();
  workerDB.putAt(index, value);
}