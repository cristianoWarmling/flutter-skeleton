import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/data/hello_world.bloc.dart';
import 'package:flutter_skeleton/model/todo.model.dart';
import 'package:flutter_skeleton/widgets/request_floatbuton.widget.dart';

class HelloWorld extends StatelessWidget {
  HelloWorldBloc get helloWorldBloc => BlocProvider.getBloc<HelloWorldBloc>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello World"),
      ),
      floatingActionButton: RequestFloatButton(),
      body: new Container(
        child: new Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              StreamBuilder<int>(
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
              StreamBuilder<TodoModel>(
                stream: helloWorldBloc.outTodo,
                builder: (context, snapshot) {
                  return new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Card(
                      child: snapshot.data != null
                          ? new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      new Text(
                                        "id: ",
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      new Text(
                                        "${snapshot.data.id}",
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      new Text(
                                        "userId: ",
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      new Text(
                                        "${snapshot.data.userId}",
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        "title: ",
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Flexible(
                                        child: new Text(
                                          "${snapshot.data.title}",
                                          style: new TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      new Text(
                                        "completed: ",
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      new Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: snapshot.data.completed,
                                        onChanged: null,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : new Container(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
