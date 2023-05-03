import 'package:flutter/material.dart';
import 'package:test_2/database.dart';
import 'package:test_2/row-task.dart';
import 'package:test_2/dialog-add-task.dart';

class _HomeScreen extends State<HomeScreen> {

  TaskDatabase db = TaskDatabase();

  final _textController = TextEditingController();

  @override
  void initState() {
    db.check();
    super.initState();
  }

  void openDialogCreateTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AddTaskDialog(
            controller: _textController,
            onSave: saveTask,
          );
        });
  }

  void saveTask() {
    setState(() {
      db.dataList.add([_textController.text, false]);
    });
    Navigator.of(context).pop();
    _textController.clear();
    db.update();
  }

  void deleteTask(int index) {
    setState(() {
      db.dataList.removeAt(index);
    });
    db.update();
  }

  void updateCheckBox(bool? value, int index) {
    setState(() {
      db.dataList[index][1] = !db.dataList[index][1];
    });
    db.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('TO DO LIST'),
        toolbarHeight: 60,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: db.dataList.length,
        itemBuilder: (context, index) {
          return RowTask(
            taskName: db.dataList[index][0],
            taskCompleted: db.dataList[index][1],
            onChanged: (value) => updateCheckBox(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: SizedBox(
              height: 65,
              width: 65,
              child: FloatingActionButton(
                onPressed: () {
                  openDialogCreateTask();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.white38,
                child: const Icon(Icons.post_add_outlined, size: 34),
              ),
            ),
          )),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}
