import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workers_project/models/booked_model/booked_model.dart';
import 'package:workers_project/models/worker_model/worker_model.dart';
import 'package:workers_project/widgets/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await SharedPreferences.getInstance();
  if (!Hive.isAdapterRegistered(WorkerModelAdapter().typeId)) {
    Hive.registerAdapter(WorkerModelAdapter());
  }
  if (!Hive.isBoxOpen('worker_db')) {
    await Hive.openBox<WorkerModel>('worker_db');
  }
  if (!Hive.isAdapterRegistered(BookedModelAdapter().typeId)) {
    Hive.registerAdapter(BookedModelAdapter());
  }
  if (!Hive.isBoxOpen('booked_db')) {
    await Hive.openBox<BookedModel>('booked_db');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workers',
      home: SplashScreen(),
    );
  }
}
