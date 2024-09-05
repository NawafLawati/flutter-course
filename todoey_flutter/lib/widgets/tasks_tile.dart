import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('This is a task'),
      trailing: Checkbox(
        value: false,
        onChanged: (bool? value) {},
      ),
    );
  }
}


class TaskCheckbox extends StatelessWidget {


  final bool checkboxState;


  const TaskCheckbox(this.checkboxState);

  @override
  Widget build(BuildContext context) {
    return const Checkbox(value: true, onChanged: 
  }
}
