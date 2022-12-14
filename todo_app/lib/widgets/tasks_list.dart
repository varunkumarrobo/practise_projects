import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/widgets/task_tile.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {

  // final List<Task> tasks;
  //  TasksList(this.tasks);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder:(context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (checkboxState){
                taskData.updateTask(task);
                // setState(() {
                //   widget.tasks[index].toggleDone();
                // });
              }, longPressCallback: () {
                taskData.deleteTask(task);
            },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
     // child:
    );
  }
}



// children: [
// TaskTile( taskTitle: tasks[0].name,isChecked: tasks[0].isDone,),
// TaskTile( taskTitle: tasks[1].name,isChecked: tasks[1].isDone,),
// TaskTile( taskTitle: tasks[2].name,isChecked: tasks[2].isDone,),
// ],