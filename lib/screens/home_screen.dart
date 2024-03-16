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
 bool valuefirst=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
     title:Text('Todo App'),
       backgroundColor:Colors.green,
       centerTitle:true,
    ),
    body:Column(
    children: [
      Text('overdue',Colors()),
    ]
    ListView.builder(
      itemCount:count,
      itemBuilder: (context, position) {
        return Container(
        height:100,
          child:Card(
          child:Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                checkColor: Colors.greenAccent,
                activeColor: Colors.red,
                value: this.valuefirst,
                onChanged: (bool? value) {
                  setState(() {
                    this.valuefirst = value ?? true;
                  });
                },
              ),
              Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              input[position],
              style: TextStyle(fontSize: 22.0),
            ),
          ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Text(
              //     'Pending',
              //     style: TextStyle(fontSize: 22.0),
              //   ),
              // ),

              IconButton(
                icon: new Icon(Icons.delete,color:Colors.red,),
                highlightColor: Colors.red,
                onPressed:(){
        deleteitem();//
        },
              ),

            ],
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

 deleteitem(){
    setState(() {

      count=count-1;
      input.removeAt(count);

    });
 }

}



