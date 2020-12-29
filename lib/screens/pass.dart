import 'package:flutter/material.dart';
import 'package:student_grading_app/services/lists.dart';


class Pass extends StatefulWidget {
  @override
  _PassState createState() => _PassState();
}

class _PassState extends State<Pass> {
  @override
  Widget build(BuildContext context) {
    return passNameList.isEmpty == false ? Container(
      child: ListView.builder(
        itemCount: passNameList.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(passNameList[index]),
            subtitle: Text("Grade: "+passGradeList[index]),
            trailing: Icon(Icons.check_circle,color: Colors.green,size: 25),
          );
        },
      ),
    ):Container();
  }
}