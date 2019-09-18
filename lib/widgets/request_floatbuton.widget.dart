import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/data/hello_world.bloc.dart';

class RequestFloatButton extends StatelessWidget {
  HelloWorldBloc get helloWorldBloc => BlocProvider.getBloc<HelloWorldBloc>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: helloWorldBloc.outLoading,
      builder: (context, snapshot) {
        return FloatingActionButton(
          onPressed: !snapshot.data
              ? () {
                  helloWorldBloc.increment();
                }
              : null,
          child: !snapshot.data
              ? Icon(Icons.cloud_download)
              : SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
        );
      },
    );
  }
}
