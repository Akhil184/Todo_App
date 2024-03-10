import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyHomePage extends StatefulWidget {
  const  MyHomePage({super.key});

  @override
  State< MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 TextEditingController Controller=TextEditingController();
  int count=0;
List input=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
     title:Text('Todo App'),
       backgroundColor:Colors.green,
       centerTitle:true,
    ),
    body:ListView.builder(
      itemCount:count,
      itemBuilder: (context, position) {
        return Container(
        height:100,
          child:Card(
          child:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              input[position],
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          ),
        );
      },
    ),
      floatingActionButton:FloatingActionButton(
        backgroundColor:Colors.green,
        child:Icon(Icons.add),
        onPressed: () {
        setState(() {
          Controller.clear();
          _displayDialog(context);
        });
      },

      ),
    );

  }
 _displayDialog(BuildContext context) async {
   return showDialog(
       context: context,
       builder: (context) {
         return AlertDialog(
           title: Text('Add Items'),
           content: TextField(
             controller:Controller,
             decoration: InputDecoration(hintText: "Item Name"),
           ),
           actions: <Widget>[
             new ElevatedButton(
               child: new Text('SUBMIT'),
               onPressed: () {
                 setState(() {
                   input.add(Controller.text);
                   count=count+1;

                 });

                 Navigator.of(context).pop();
               },
             )
           ],
         );
       });
 }

}



