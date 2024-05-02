// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:workers_project/widgets/bottom_nav_screen.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formfeild = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;

  Future<void> loginFunction() async {
    String username = "123";
    String password = "123";
    String userControl = nameController.text.trim();
    String passControl = passwordController.text.trim();
    if (userControl == username && passControl == password) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool('key', true);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyBottom(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: _formfeild,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/plumber.jpg'),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    decoration: const InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value != '123') {
                        return "Enter Username";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: passwordController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    validator: (value) {
                      if (value != '123') {
                        return "Enter Password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formfeild.currentState!.validate()) {
                        loginFunction();
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
