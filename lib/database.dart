import 'package:hive/hive.dart';

class TaskDatabase {
  List dataList = [];
  final _taskBox = Hive.box("task_box");

  void createTempData() {
    dataList = [
      ["Click the button at the bottom to add a new task!", false],
      ["This is just for testing. You can delete this task by swiping the row to the left.", true],
      ["After seeing that their codebase's line count was growing 46% every year, Duolingo's Android developers found success in migrating from Java to Kotlin. ", false]
    ];
  }

  void check() {
    if (_taskBox.get("ToDoTask") == null) {
      createTempData();
    } else {
      load();
    }
  }

  void load() {
    dataList = _taskBox.get("ToDoTask");
  }

  void update() {
    _taskBox.put("ToDoTask", dataList);
  }
}
