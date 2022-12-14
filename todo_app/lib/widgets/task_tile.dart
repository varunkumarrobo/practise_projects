import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  // @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   super.setState(fn);
  //
  // }


  final bool isChecked ;
  final String taskTitle;
  final Function checkboxCallback;
  final Function()? longPressCallback;

    TaskTile({super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
      required this.longPressCallback});

  // void checkboxCallback

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title:  Text(
        taskTitle,
        // 'This is a task',
      style: TextStyle(
        decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing:Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged:
        // checkboxCallback;
            ( value) {
          checkboxCallback;
        },
        // onChanged: (){},
        // toggleCheckboxState,
        //(newValue)  {
        // setState(() {
        //   checkboxState = newValue!;
        // });
        //},
      ),
    );
  }
}



// TaskCheckbox(
// checkboxState: isChecked,
// toggleCheckboxState:
// ),
// (bool checkboxState){
// setState(() {
// isChecked = checkboxState;
// });
// },

// class TaskCheckbox extends StatelessWidget {
//    final bool checkboxState;
//    final  Function toggleCheckboxState;
//    // final VoidCallback? toggleCheckboxState;
//
//    TaskCheckbox({required this.checkboxState, required this.toggleCheckboxState});
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.lightBlueAccent,
//       value: checkboxState,
//       onChanged: (checkboxState)
//       {
//         toggleCheckboxState ;
//       },
//           //(newValue)  {
//         // setState(() {
//         //   checkboxState = newValue!;
//         // });
//       //},
//     );
//   }
// }