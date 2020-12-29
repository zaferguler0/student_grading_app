import 'package:flutter/material.dart';
import 'package:student_grading_app/services/lists.dart';

class Ungraded extends StatefulWidget {
  @override
  _UngradedState createState() => _UngradedState();
}

class _UngradedState extends State<Ungraded> {


  @override
  Widget build(BuildContext context) {
    return ungradedNamesList.isEmpty == false ? Container(
      child: ListView.builder(
        itemCount: ungradedNamesList.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(ungradedNamesList[index]),
            subtitle: Text("Grade: "+ungradedGradesList[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      failNameList.add(ungradedNamesList[index]);
                      failGradeList.add(ungradedGradesList[index]);
                      ungradedNamesList.removeAt(index);
                      ungradedGradesList.removeAt(index);
                    });
                  },
                  child: Icon(Icons.cancel,color: Colors.red,size: 25),
                ),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      passNameList.add(ungradedNamesList[index]);
                      passGradeList.add(ungradedGradesList[index]);
                      ungradedGradesList.removeAt(index);
                      ungradedNamesList.removeAt(index);
                    });
                  },
                  child: Icon(Icons.check_circle,color: Colors.green,size: 25),
                )
              ],
            ),
          );
        },
      ),
    ):Container();
  }
}