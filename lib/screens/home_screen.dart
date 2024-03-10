import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const  MyHomePage({super.key});

  @override
  State< MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int count=0;

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
              position.toString(),
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
          count=count+1;
        });
      },

      ),
    );

  }

}
