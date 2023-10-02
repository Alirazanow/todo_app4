import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  // final String text;
  VoidCallback onSave;
  VoidCallback onCancle;

  DialogBox({
    super.key,
    required this.controller,
    required this.onCancle,
    required this.onSave,
  });
  @override
  Widget build(context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add new Task',
              ),
            ),
            // buttop
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                ElevatedButton(onPressed: onSave, child: Text('Save')),

                const SizedBox(
                  width: 8,
                ),

                // cancle button
                ElevatedButton(onPressed: onCancle, child: Text('Cancel')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
