import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workers_project/db/functions/db_functions.dart';
import 'package:workers_project/screen/settings_about_details.dart';
import 'package:workers_project/screen/settings_admin_details.dart';
import 'package:workers_project/screen/settings_help_details.dart';
import 'package:workers_project/screen/login_screen.dart';
import 'package:workers_project/screen/settings_privacy_details.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> logoutFunction() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('key', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Icon(
            Icons.settings,
            size: 40,
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AdminScreen()));
              },
              child: fakelist(title: 'Admin', icons: Icons.person_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutDetails(),
                  ),
                );
              },
              child: fakelist(title: 'About', icons: Icons.info_outline),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyDetails(),
                  ),
                );
              },
              child:
                  fakelist(title: 'Privacy', icons: Icons.privacy_tip_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpScreen(),
                  ),
                );
              },
              child: fakelist(title: 'Help', icons: Icons.help_outline),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Warning'),
                        content: const Text('Are You Sure'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                deleteAllData();
                                Navigator.pop(context);
                              },
                              child: const Text('YES'))
                        ],
                      );
                    });
              },
              child: fakelist(title: 'Reset', icons: Icons.refresh_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Warning'),
                        content: const Text('Are You Sure'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                logoutFunction();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ScreenLogin(),
                                  ),
                                );
                              },
                              child: const Text('YES'))
                        ],
                      );
                    });
              },
              child: fakelist(title: 'Logout', icons: Icons.exit_to_app),
            ),
          )
        ],
      )),
    );
  }
}

fakelist({
  required String title,
  required IconData icons,
}) =>
    Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      width: double.infinity,
      height: 80,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Icon(
              icons,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
      ),
    );
