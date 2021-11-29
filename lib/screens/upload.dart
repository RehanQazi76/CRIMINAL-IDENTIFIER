import 'package:criminal_identifier/screens/input_form.dart';
import 'package:flutter/cupertino.dart';
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
             Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),),
              RichText(
                  textAlign: TextAlign.center,
                  
                text: const TextSpan(
                  text: 'Here  ',
                  style: 
                  TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 40,
                  ), 
                  children: <TextSpan>[
                    TextSpan(
                        text: 'we end and will begin with ML ',
                        style: TextStyle(
                          fontFamily: "ComforterBrush-Regular",
                            fontWeight: FontWeight.normal,
                            fontSize: 50,
                            color: Colors.lightBlue)),
                  ],
                ),
              ),
              Center(
                child:Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row
                (children: <Widget>[
                   Expanded(child:  ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: CupertinoColors.black,
                  onPrimary: CupertinoColors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                ),
                child: const Text('Insert Data '),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputForm()),
                  );
                },
              ),),
              Container(width: 8.0,),
               Expanded(child:  ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: CupertinoColors.black,
                  onPrimary: CupertinoColors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                ),
                child: const Text('Scan Suspect '),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputForm()),
                  );
                },
              ),)
                ],),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}