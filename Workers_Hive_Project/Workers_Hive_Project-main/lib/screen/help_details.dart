import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HELP & SUPPORT'),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions (FAQ):',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text('- How do I create an account?'),
            Text('- How do I search for workers?'),
            Text('- How do I book a worker for a job?'),
            Text('- How do I update my profile information?'),
            Text('- How do I reset my password?'),
            SizedBox(
              height: 5,
            ),
            Text('Tutorials and How-To Guides:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text('- How to find workers in your area'),
            Text('- How to book a worker for a job'),
            Text('- How to manage your bookings and payments'),
            Text('- How to leave a review for a worker'),
            Text('- How to contact support for assistance'),
            SizedBox(
              height: 5,
            ),
            Text('Contact Support:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(
                'For further assistance or if you encounter any issues while using the app, please contact our support team at [sudevdevaraj@email.com] or call us at [9072556090].'),
            SizedBox(
              height: 5,
            ),
            Text('Feedback and Suggestions:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(
                'We value your feedback! Please take a moment to share your thoughts, report any bugs, or suggest new features by filling out our feedback.'),
            SizedBox(
              height: 5,
            ),
            Text('Community Forums:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(
                'Join our community forum to connect with other users, share tips and tricks, and get help from fellow members.'),
            SizedBox(
              height: 5,
            ),
            Text('Helpful Resources:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text('- User Manual: [Link to user manual]'),
            Text('- Knowledge Base: [Link to knowledge base]'),
            Text(
                '- External Resources: [Links to relevant websites or articles]'),
            SizedBox(
              height: 5,
            ),
            Text('App Updates and Release Notes:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(
                'Stay up to date with the latest app updates and improvements.'),
            Text(''),
          ],
        ),
      ),
    );
  }
}
