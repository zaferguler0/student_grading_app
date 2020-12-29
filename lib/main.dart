import 'package:flutter/material.dart';
import 'package:student_grading_app/screens/fail.dart';
import 'package:student_grading_app/screens/pass.dart';
import 'package:student_grading_app/screens/ungraded.dart';
import 'package:student_grading_app/services/lists.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var _textEditingNameController = TextEditingController();
  var _textEditingGradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Students"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Ungraded",
              ),
              Tab(
                text: "Pass",
              ),
              Tab(
                text: "Fail",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Ungraded(),
            Pass(),
            Fail(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => alertDialog(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  alertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("New Student"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textEditingNameController,
                decoration: InputDecoration(
                  labelText: "Student Name",
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _textEditingGradeController,
                decoration: InputDecoration(
                  labelText: "Student Grade",
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            FlatButton(
              onPressed: () {
                if (_textEditingNameController.text.isEmpty == false &&
                    _textEditingGradeController.text.isEmpty == false) {

                  setState(() {
                    ungradedNamesList.add(_textEditingNameController.text);
                    ungradedGradesList.add(_textEditingGradeController.text);
                  });
                  _textEditingNameController.text = "";
                  _textEditingGradeController.text = "";
                  Navigator.pop(context);
                }
              },
              child: Text("Add"),
            )
          ],
        );
      },
    );
  }
}
