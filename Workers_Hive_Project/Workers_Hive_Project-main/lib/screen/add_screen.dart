import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workers_project/db/functions/db_functions.dart';
import 'package:workers_project/models/worker_model/worker_model.dart';
import 'package:workers_project/widgets/bottom_screen.dart';
import 'package:workers_project/widgets/textfield.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  File? images;
  Future<void> getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        images = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final jobcontroller = TextEditingController();
    final placecontroller = TextEditingController();
    final phonecontroller = TextEditingController();
    final feescontroller = TextEditingController();

    Future<void> addWorkerFunction() async {
      final name = namecontroller.text.trim();
      final job = jobcontroller.text.trim();
      final place = placecontroller.text.trim();
      final phone = phonecontroller.text.trim();
      final fees = feescontroller.text.trim();

      if (name.isNotEmpty ||
          job.isNotEmpty ||
          place.isNotEmpty ||
          phone.isNotEmpty ||
          fees.isNotEmpty) {
        final worker = WorkerModel(
          image: images!.path,
          name: name,
          job: job,
          place: place,
          phone: phone,
          fees: fees,
        );
        addWorker(worker);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  getImageFromGallery();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: images != null
                      ? Image.file(
                          images!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.add_photo_alternate,
                          size: 50,
                          color: Colors.grey,
                        ),
                ),
              ),
              Form(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldd(
                        name: 'Name :',
                        icons: Icons.person,
                        validtext: 'Enter the name',
                        controller: namecontroller),
                    TextFieldd(
                        name: 'Work :',
                        icons: CupertinoIcons.bag,
                        validtext: '',
                        controller: jobcontroller),
                    TextFieldd(
                        name: 'Place :',
                        icons: Icons.location_on,
                        validtext: '',
                        controller: placecontroller),
                    TextFieldd(
                        name: 'Phone no :',
                        icons: Icons.phone,
                        validtext: '',
                        controller: phonecontroller),
                    TextFieldd(
                        name: 'Fees :',
                        icons: Icons.currency_rupee_sharp,
                        validtext: '',
                        controller: feescontroller),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        addWorkerFunction();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyBottom()));
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 99, 100, 103),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                            child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
