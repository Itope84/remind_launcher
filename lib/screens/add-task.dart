import 'package:flutter/material.dart';
import 'package:remind_launcher/models/task.dart';
import 'package:remind_launcher/utils/enums/notice-type.dart';
import 'package:remind_launcher/utils/strings.dart';
import 'package:remind_launcher/widgets/buttons.dart';
import 'package:remind_launcher/widgets/inputs.dart';

class AddTask extends StatefulWidget {
  final Function(Task) onSaveOrClose;
  AddTask({this.onSaveOrClose});

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String _title, _body;
  NoticeType _type;

  @override
  void initState() {
    _title = '';
    _body = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: ListView(
        children: <Widget>[
          Text(
            "Add New Task",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          RoundedMaterialTextFormField(
            hintText: "Title",
            onChanged: (String value) {
              setState(() {
                _title = value;
              });
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          RoundedMaterialTextFormField(
            hintText: "Body",
            onChanged: (String value) {
              setState(() {
                _body = value;
              });
            },
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[400],
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<NoticeType>(
                  hint: Text(
                    _type != null
                        ? capitalize(
                            _type.toString().split('.')[1].toLowerCase())
                        : "Select Type",
                    style: TextStyle(
                      fontSize: 15.0,
                      color:
                          _type != null ? Colors.black : Colors.blueGrey[600],
                    ),
                  ),
                  items: NoticeType.values
                      .map(
                        (NoticeType type) => DropdownMenuItem<NoticeType>(
                          value: type,
                          child: Text(capitalize(
                              type.toString().split('.')[1].toLowerCase())),
                        ),
                      )
                      .toList(),
                  onChanged: (NoticeType type) {
                    setState(() {
                      _type = type;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          StyledBlockButton(
            onPressed: () {
              widget.onSaveOrClose(
                new Task(
                  title: _title,
                  body: _body,
                  type: _type,
                  createdAt: DateTime.now(),
                ),
              );
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
