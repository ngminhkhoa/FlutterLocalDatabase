import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RowTask extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;

  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  RowTask(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 0, top: 15.0, left: 25.0, right: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white24, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.green,
              ),
              Flexible(
                child: Text(
                  taskName,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
