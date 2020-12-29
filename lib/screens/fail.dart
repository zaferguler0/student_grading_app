import 'package:flutter/material.dart';
import 'package:student_grading_app/services/lists.dart';


class Fail extends StatefulWidget {
  @override
  _FailState createState() => _FailState();
}

class _FailState extends State<Fail> {
  @override
  Widget build(BuildContext context) {
    return failNameList.isEmpty == false ? Container(
      child: ListView.builder(
        itemCount: failNameList.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(failNameList[index]),
            subtitle: Text("Grade: "+failGradeList[index]),
            trailing: Icon(Icons.cancel,color: Colors.red,size: 25),
          );
        },
      ),
    ):Container();
  }
}