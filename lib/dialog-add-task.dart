import 'package:flutter/material.dart';

class AddTaskDialog extends StatelessWidget {
  final controller;
  VoidCallback onSave;

  AddTaskDialog({super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 114,
        width: 420,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Type your task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.red,
                  child: Text("Discard"),
                ),
                const SizedBox(
                  width: 8,
                ),
                MaterialButton(
                  onPressed: onSave,
                  color: Colors.green,
                  child: Text("Save"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
