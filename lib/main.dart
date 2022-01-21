import 'package:criminal_identifier/screens/upload.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('welcome')),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              
              const SizedBox(
                height: 30,
                width: 20,
              ),
              const Image(
                image: AssetImage("images/detectivep.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text.rich(
          TextSpan(
            text: " CRIMINAL IDENTIFIER ",
            style: TextStyle( 
                            fontFamily: "MavenPro-Bold",
                              fontWeight: FontWeight.normal,
                              fontSize: 25,
                              color: Colors.black)  
            
          ),
          
        ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: CupertinoColors.white,
                  fixedSize:Size(180.0, 80.0),
                ),
                child:  Text('Get started ',
                style: TextStyle(fontSize: 25.0,
                fontFamily: "MavenPro-Bold"),),
                onPressed: () async {
                  _auth.authStateChanges().listen((user) {
                    if (user == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginP()),
                      );
                      print(' error');
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => screen()));
                      print(user);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
