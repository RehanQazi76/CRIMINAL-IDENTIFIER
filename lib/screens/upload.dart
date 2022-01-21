import 'package:criminal_identifier/main.dart';
import 'package:criminal_identifier/model/user_model.dart';
import 'package:criminal_identifier/screens/search.dart';
import 'package:criminal_identifier/screens/imagedisplay.dart';
import 'package:criminal_identifier/screens/input_form.dart';
import 'package:criminal_identifier/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screen extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            text: " HOME",
            style: TextStyle(
                          fontFamily: "MavenPro-Bold",
                            fontWeight: FontWeight.normal,
                            fontSize: 25,
                            color: Colors.white)  
            
          ),
          
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.person),
            label: Text("Logout"),
            onPressed: () async {
              await _auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child:   Column(

                    children: [
                      Image.network('https://cdn0.iconfinder.com/data/icons/data-analytics-10/64/web_hosting_data_analytic_cloud_internet_network-512.png',
                      height: 130,
                      width: 150,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue[600],
                            onPrimary: CupertinoColors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                          ),
                          child: const Text('View data '),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => display(),
                                ));
                          }),
                    ],
                  ),
                      ),
                     
                      Expanded(
                        child: Column(
                          children: [
                            const Image(
                                 image: AssetImage("images/compare.png"),
                                 height: 130.0,
                                 width: 150.0,
                              ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[600],
                                onPrimary: CupertinoColors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                              ),
                              child: const Text('Compare  Suspect '),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => imgipt()),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 15,
                ),
                child: Center(
                 child: Column(
                          children: [
                              const SizedBox(
                                 height: 30,
                                 width: 20,
                               ),
                              //  Icon(
                              //    Icons.add_box_rounded,
                              //    size: 80.0,
                              //  ),
                               const Image(
                                 image: AssetImage("images/insert.png"),
                                 height: 140.0,
                                 width: 150.0,
                              ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[600],
                                onPrimary: CupertinoColors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                              ),
                              child: const Text('Insert Data '),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InputForm()),
                                );
                              },
                            ),
                          ],
                        ),
                 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
