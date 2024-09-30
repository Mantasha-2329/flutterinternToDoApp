import 'package:flutter/material.dart';
import 'package:todo_listapp/Splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splashscreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> _todos = [];
  void _addTodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTodo = "";
        return AlertDialog(
          title: Text("Add your To-Do list"),
          content: TextField(
            onChanged: (value) {
              newTodo = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (newTodo.isNotEmpty) {
                    _todos.add(newTodo);
                  }
                  Navigator.pop(context);
                });
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" To-Do List",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white),)),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue.shade200,
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            child: ListTile(
              title: Text(
                _todos[index],
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
              ),

              //by clicking this button we can remove the list
              trailing: IconButton(
                icon: Icon(Icons.cancel_outlined),
                onPressed: () {
                  setState(() {
                    _todos.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),

      //with this button we can add list
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}