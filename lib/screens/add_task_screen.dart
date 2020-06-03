import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool _isButtonDisabled;
  TextEditingController _taskTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isButtonDisabled = true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30.0,
            ),
          ),
          TextField(
            controller: _taskTitleController,
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Task title',
            ),
            onChanged: (newValue) {
              setState(() {
                _isButtonDisabled = (_taskTitleController.text == '');
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            color: Colors.lightBlueAccent,
            disabledColor: Colors.lightBlue.shade100,
            child: Text(
              'Add',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            onPressed: _isButtonDisabled
                ? null
                : () {
                    Provider.of<TaskData>(context, listen: false).addTask(
                      newTaskTitle: _taskTitleController.text,
                    );
                    Navigator.pop(context);
                  },
          ),
        ],
      ),
    );
  }
}

//return Container(
//padding: EdgeInsets.all(20.0),
//decoration: BoxDecoration(
//color: Colors.white,
//borderRadius: BorderRadius.only(
//topLeft: Radius.circular(20.0),
//topRight: Radius.circular(20.0),
//),
//),
//child: Column(
