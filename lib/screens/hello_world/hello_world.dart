import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/data/hello_world.bloc.dart';

class HelloWorld extends StatelessWidget {
  HelloWorldBloc get helloWorldBloc => BlocProvider.getBloc<HelloWorldBloc>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello World"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          helloWorldBloc.increment();
        },
        child: Icon(Icons.add),
      ),
      body: new Container(
        child: new Center(
          child: StreamBuilder<int>(
            stream: helloWorldBloc.outCounter,
            builder: (context, snapshot) {
              return new Text(
                "Your counter is ${snapshot.data}",
                style: new TextStyle(
                  fontSize: 20.0,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
