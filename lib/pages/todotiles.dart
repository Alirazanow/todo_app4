import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTiles extends StatelessWidget {
  final String teskName;
  final bool taskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleFunction;

  TodoTiles({
    super.key,
    required this.onChanged,
    required this.taskComplete,
    required this.teskName,
    required this.deleFunction,
  });
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                value: taskComplete,
                onChanged: onChanged,
                activeColor: Color.fromARGB(255, 93, 46, 221),
              ),
              Text(
                teskName,
                style: TextStyle(
                  color: Colors.white,
                  decoration: taskComplete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
