import 'package:criminal_identifier/screens/search.dart';
import 'package:criminal_identifier/screens/imagedisplay.dart';
import 'package:criminal_identifier/screens/input_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screen extends StatelessWidget {
  const screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('welcome '),
         actions: <Widget>[
          ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.person), label: Text("Logout"))
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey,
          child: Column(
            children: <Widget>[
             Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),),
      
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
              ),
              ),
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
                    MaterialPageRoute(builder: (context) => imgipt()),
                  );
                },
              ),)
                ],),
                ),
              ),
               Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 15,
              ),
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: CupertinoColors.black,
                      onPrimary: CupertinoColors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                    ),
                    child: const Text('View data '),
                    onPressed: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => display(),));
                    }),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
