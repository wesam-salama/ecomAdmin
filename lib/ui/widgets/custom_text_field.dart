import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool isDetails;
  final TextEditingController controller;

  CustomTextField({this.controller, this.isDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        maxLength: isDetails ? 150 : 10,
        keyboardType: isDetails ? TextInputType.multiline : TextInputType.text,
        minLines: isDetails ? 1 : 1,
        maxLines: isDetails ? 5 : 1,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
