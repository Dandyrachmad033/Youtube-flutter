import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube/main.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class Home extends StatelessWidget {
 
final User = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 48, 45, 45),
                Colors.grey,
              ],
            )),
            child: Column(
              children: [
                new Center(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          child: Center(
                              child: Image.network(
                                  "https://www.freepnglogos.com/uploads/youtube-play-red-logo-png-transparent-background-6.png")),
                        ),
                        new Text(
                          "SELAMAT DATANG ",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: Column(
                    children: [
                      new Text(
                        User.email!,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        yutub()));
                          },
                          child: Text("Konfirmasi"))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
