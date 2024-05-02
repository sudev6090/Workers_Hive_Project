import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workers_project/db/functions/db_functions.dart';
import 'package:workers_project/models/worker_model/worker_model.dart';
import 'package:workers_project/widgets/textfield.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({
    super.key,
    required this.name,
    required this.work,
    required this.place,
    required this.phone,
    required this.fees,
    required this.image,
    required this.index,
  });

  final String name;
  final String work;
  final String place;
  final String phone;
  final String fees;
  final String image;
  final int index;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final namecontroller = TextEditingController();
  final jobcontroller = TextEditingController();
  final placecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final feescontroller = TextEditingController();
  File? images;

  @override
  void initState() {
    namecontroller.text = widget.name;
    jobcontroller.text = widget.work;
    placecontroller.text = widget.place;
    phonecontroller.text = widget.phone;
    feescontroller.text = widget.fees;
    images = widget.image != '' ? File(widget.image) : null;

    super.initState();
  }

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
                        updateall();
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 72, 70, 70),
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

  Future<void> updateall() async {
    final name = namecontroller.text.trim();
    final work = jobcontroller.text.trim();
    final place = placecontroller.text.trim();
    final phone = phonecontroller.text.trim();
    final fees = feescontroller.text.trim();
    final image = images!.path;

    if (name.isEmpty ||
        work.isEmpty ||
        place.isEmpty ||
        phone.isEmpty ||
        fees.isEmpty ||
        image.isEmpty) {
      return;
    } else {
      final update = WorkerModel(
          name: name,
          job: work,
          place: place,
          phone: phone,
          fees: fees,
          image: image);

      editworkers(widget.index, update);
      showDialog(
          context: context,
          useSafeArea: true,
          builder: (context) => AlertDialog(
                scrollable: true,
                content: const Text('Changes Applied!'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Text('OK'))
                ],
              ));
    }
  }
}
