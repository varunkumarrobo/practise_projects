import 'package:flutter/material.dart';


import '../dbservice.dart';
import '../model/emp.dart';

class AddEmployeeScreen extends StatefulWidget {
  Employee? employee;

  AddEmployeeScreen({this.employee});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final salaryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.employee != null) {
      fnameController.text = widget.employee!.firstName;
      lnameController.text = widget.employee!.lastName;
      salaryController.text = widget.employee!.salary.toString();

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(widget.employee == null ? "Add Employee" : "Update employee"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: fnameController,
              decoration: const InputDecoration(hintText: "Please enter first name"),
            ),
            TextField(
              controller: lnameController,
              decoration: const InputDecoration(hintText: "Please enter last name"),
            ),
            TextField(
              controller: salaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Please enter salary"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        if (widget.employee != null)
                          DatabaseService.instance.updateEmployee({
                            "id": widget.employee!.id,
                            "firstName": fnameController.text.trim(),
                            "lastName": lnameController.text.trim(),
                            "salary": salaryController.text.trim(),
                          });
                        else
                          DatabaseService.instance.createEmployee({
                            "firstName": fnameController.text.trim(),
                            "lastName": lnameController.text.trim(),
                            "salary": salaryController.text.trim(),
                          });

                        Navigator.pop(context);
                      },
                      child: Text(widget.employee != null ? "Update" : "Add")),
                ),
                const SizedBox(
                  width: 20,
                ),
                Visibility(
                  visible: widget.employee != null,
                  child: Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          DatabaseService.instance.deleteEmployee(
                            widget.employee!.id,
                          );

                          Navigator.pop(context);
                        },
                        child: const Text("Delete")),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
