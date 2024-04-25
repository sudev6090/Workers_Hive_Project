import 'package:flutter/material.dart';

// textfeld({
//   required TextEditingController controller,
//   required String name,
//   required IconData icons,
//   required String validtext,
// }) =>
//     Container(
//       margin: const EdgeInsets.only(top: 10, bottom: 10),
//       child: TextFormField(
//         controller: controller,
//         keyboardType: TextInputType.name,
//         decoration: InputDecoration(
//           labelText: name,
//           border:const OutlineInputBorder(),
//           prefixIcon: Icon(icons),
//         ),
//         validator: (value) {
//           if (value!.isEmpty) {
//             return validtext;
//           }
//           return null;
//         },
//       ),
//     );

class TextFieldd extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final IconData icons;
  final String validtext;

  const TextFieldd({
    super.key,
    required this.controller,
    required this.name,
    required this.icons,
    required this.validtext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: name,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icons),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return validtext;
          }
          return null;
        },
      ),
    );
  }
}
