import 'package:flutter/material.dart';

class PrivacyDetails extends StatefulWidget {
  const PrivacyDetails({super.key});

  @override
  State<PrivacyDetails> createState() => _PrivacyDetailsState();
}

class _PrivacyDetailsState extends State<PrivacyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRIVACY'),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Data Collection:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                  '-Workers Project collects personal information from users, including name, email address, phone number, and location data. This information is collected to facilitate the hiring process and provide personalized services within the app.'),
              SizedBox(
                height: 5,
              ),
              Text('Data Usage:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(
                  "-Collected data is used to match users with workers based on their preferences and location. Additionally, we may use the data for analytics purposes to improve the app's functionality and user experience."),
              SizedBox(
                height: 5,
              ),
              Text('Data Sharing:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(
                  '-We do not share personal information with third parties without user consent, except in cases where it is necessary to provide the requested services (e.g., sharing user contact information with hired workers).'),
              SizedBox(
                height: 5,
              ),
              Text('Data Security:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(
                  '-We take the security of user data seriously and implement measures to protect it from unauthorized access, disclosure, or alteration. This includes encryption, access controls, and regular security audits.'),
              SizedBox(
                height: 5,
              ),
              Text('User Control:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(
                  "-Users have the right to access, update, or delete their personal information within the app. They can manage their privacy settings and preferences through the app's settings menu."),
              SizedBox(
                height: 5,
              ),
              Text('Opt-Out Options:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(
                  '-Users can opt out of certain data collection or sharing activities by adjusting their privacy settings within the app. For further assistance, users can contact our support team at [support@email.com].'),
              SizedBox(
                height: 5,
              ),
              Text('Updates to Privacy Policy:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(
                  '-This privacy policy may be updated periodically to reflect changes in our data practices. Users will be notified of any updates, and continued use of the app signifies acceptance of the revised policy.'),
              SizedBox(
                height: 5,
              ),
              Text('Contact Information:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(
                  '-For questions or concerns about our privacy practices, please contact us at [privacy@email.com].'),
            ],
          ),
        ),
      ),
    );
  }
}
