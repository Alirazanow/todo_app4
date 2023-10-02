import 'package:flutter/material.dart';
import 'package:todo_app4/pages/dialogbx.dart';
import 'package:todo_app4/pages/todotiles.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() {
    return _homeState();
  }
}

class _homeState extends State<Home> {
  final _controller = TextEditingController();

  // list f todo task
  List todoTask = [
    [
      "helo todo",
      false,
    ],
    [
      "Hy todo",
      true,
    ]
  ];

  //check box
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoTask[index][1] = !todoTask[index][1];
    });
  }

  //save new task
  void saveTask() {
    todoTask.add([_controller.text, false]);
    Navigator.of(context).pop();
    _controller.clear();
  }

  // creaye new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onCancle: () => Navigator.of(context).pop(),
            onSave: saveTask,
          );
        });
  }

  // delet task
  void deletTask(int index) {
    setState(() {
      todoTask.removeAt(index);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 63, 63, 63),
      appBar: AppBar(
        title: const Text(
          'Todo App',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todoTask.length,
          itemBuilder: (context, index) {
            return TodoTiles(
              onChanged: (value) => checkBoxChanged(value, index),
              taskComplete: todoTask[index][1],
              teskName: todoTask[index][0],
              deleFunction: (context) => deletTask(index),
            );
          }),
    );
  }
}
