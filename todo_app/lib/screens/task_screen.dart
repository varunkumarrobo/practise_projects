import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/screens/addtask.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class TaskScreen extends StatelessWidget {
  // const TaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.add,),
          onPressed: (){
          showModalBottomSheet(
            context: context,
              // isScrollControlled: true,
              builder: (context) => AddTaskScreen(
              //         (newTaskTitle){
              //           // setState(() {
              //           //   tasks.add(Task(name: newTaskTitle));
              //           // });
              //           Navigator.pop(context);
              //   print(newTaskTitle);
              // }
              ),
                  // SingleChildScrollView(
                  // child: Container(
                  //   padding: EdgeInsets.only(
                  //       bottom: MediaQuery.of(context).viewInsets.bottom),
                  //     child:  AddTaskScreen(
                  //         (newTaskTitle){
                  //           print(newTaskTitle);
                  //         }
                  //     ))),
          );
          //
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60.0,left: 30.0,right: 30.0,bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:    [
                const CircleAvatar(
                    backgroundColor: Colors.white,
                radius: 30.0,
                    child: Icon(Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,),),
                const SizedBox(height: 10.0,),
                const Text('Todoey',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                ),),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  // '12 Tasks',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              // color: Colors.white,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}




