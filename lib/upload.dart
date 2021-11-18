import 'package:flutter/material.dart';
import 'package:criminal_identifier/main.dart';

class screen extends StatelessWidget {
  const screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('welcome '),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey,
          child: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: 'Here  ',
                  style: DefaultTextStyle.of(context).style,
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'we end and will begin with ML ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
