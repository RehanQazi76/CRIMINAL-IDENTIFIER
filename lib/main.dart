import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
Future main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Home(),));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('               welcome '),
      ),
      body: Center(
        child:Container(
          child:Column(
            children: <Widget>[
              TextFormField(

              ),
              Container(
                child:const Image(image: AssetImage("images/pic1.jpg"),),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: CupertinoColors.black,
                  onPrimary: CupertinoColors.white,
                ),
                child: const Text('Login'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginP()),
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

