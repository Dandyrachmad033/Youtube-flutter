import 'package:firebase_auth/firebase_auth.dart';
import 'package:youtube/auth.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dummy_data.dart';
import 'push_notification.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _MyAppState();
}

class _MyAppState extends State<login> {
  TextEditingController controller = TextEditingController();
   
  final email = new TextEditingController();
  final pass = new TextEditingController();

  


  String mail = "";
  String sandi = "";
  List<Map<String, dynamic>> value = DummyData.data;
  void setdata() async {
    final prefs = await SharedPreferences.getInstance();

    for (int i = 0; i < value.length; i++) {
      if (value[i]['username'] == email.text &&
          value[i]['password'] == pass.text) {
        prefs.setString("nama", value[i]["nama"]);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    Home()));
      }
    }
  }

  void getdata() async {
    final prefs = await SharedPreferences.getInstance();
    mail = prefs.getString("nama").toString();
    if (prefs.getString("nama") != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Home()));
    }
  }
  void dispose(){
    email.dispose();
    pass.dispose();
    super.dispose();
  }
  

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 45, 45),
        title: new Center(
          child: Text("Halaman Login"),
        ),
      ),
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
            child: new Center(
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                              ),
                              Image.network(
                                  "https://www.freepnglogos.com/uploads/youtube-play-red-logo-png-transparent-background-6.png"),
                              Text(
                                "YouTube",
                                style:
                                    TextStyle(fontSize: 25, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      new Text(
                        "Silahkan Masuk",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: TextField(
                          controller: email,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: "Masukkan user",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: TextField(
                          controller: pass,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: "Masukkan Password",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          height: 50,
                          width: 350,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.grey),
                            child: const Text('Login'),
                            onPressed: () async{
                             authenticationservice service = authenticationservice(FirebaseAuth.instance);
                             User? user = await service.SignIn(email:email.text , password: pass.text );
                            if(user !=null){
                              Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Home()));
                            }
                             
                
                            },
                          )
                          ),
                          SizedBox(height: 20,),
                          Container(
                          height: 50,
                          width: 350,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.grey),
                            child: const Text('Register'),
                            onPressed: () async {
                              authenticationservice service = authenticationservice(FirebaseAuth.instance);
                              service.SignUp(email: email.text, password: pass.text);
                  
                            },
                          )
                          ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

 
