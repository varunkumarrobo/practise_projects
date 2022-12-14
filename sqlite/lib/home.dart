import 'package:flutter/material.dart';

import 'add_emp/add_emp.dart';
import 'dbservice.dart';
import 'model/emp.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Employee"),
      ),
      body: FutureBuilder<List<Employee>>(
        future: DatabaseService.instance.getAllEmployee(),
        builder: (
            BuildContext context,
            AsyncSnapshot<List<Employee>> snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error ${snapshot.error.toString()}');
            } else if (snapshot.hasData) {
              List<Employee> employees = snapshot.data!;
              return employees.length > 0
                  ? ListView.builder(
                   itemCount: employees.length,
                   itemBuilder: (context, i) {
                   return InkWell(
                    onTap: () async {
                      var result = await showDialog(
                          context: context,
                          builder: (context) => AddEmployeeScreen(
                            employee: employees[i],
                          ));

                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Id: ${employees[i].id}"),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Name: ${employees[i].firstName +" "+ employees[i].lastName}"),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Salary: ${employees[i].salary}"),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            height: 1,
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
                  : const Text("No employee");
            } else {
              return const Center(child: Text('Empty data'));
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await showDialog(
              context: context, builder: (context) => AddEmployeeScreen());

          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
