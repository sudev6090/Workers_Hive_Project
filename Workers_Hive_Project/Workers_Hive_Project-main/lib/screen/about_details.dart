import 'package:flutter/material.dart';

class AboutDetails extends StatefulWidget {
  const AboutDetails({super.key});

  @override
  State<AboutDetails> createState() => _AboutDetailsState();
}

class _AboutDetailsState extends State<AboutDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT'),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
                '-Workers Project is a mobile application designed to help users find and hire workers for various tasks and services.'),
            SizedBox(
              height: 5,
            ),
            Text('Features:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                '- Search and browse workers based on their skills and location.'),
            Text(
                '- View detailed profiles of workers, including their name, contact information, job details, and fees.'),
            Text('- Book workers for specific tasks directly from the app.'),
            SizedBox(
              height: 5,
            ),
            Text('Developer Information:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('- Developer: SUDEV'),
            Text('- Contact Email: sudevdevaraj01@gmail.com'),
            Text('- Website:"Coming Soon"'),
            SizedBox(
              height: 5,
            ),
            Text('Acknowledgments:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text(
                'This app utilizes open-source libraries and resources. We acknowledge and thank the contributors of these libraries for their valuable work.'),
            SizedBox(
              height: 5,
            ),
            Text('Privacy Policy:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text(
                'For information about how we collect and use data, please see our Privacy Policy.'),
            SizedBox(
              height: 5,
            ),
            Text('Terms of Service:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('By using this app, you agree to our Terms of Service.'),
          ],
        ),
      ),
    );
  }
}
