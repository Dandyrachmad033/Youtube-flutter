

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube/dummy_data.dart';
import 'package:youtube/pageview.dart';
import 'package:youtube/penilaian/service/penilaian_service.dart';
import 'firebase_options.dart';
import 'profile.dart';
import 'login.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'push_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:youtube/penilaian/pages/penilaian_list.dart';
import 'package:youtube/penilaian/service/penilaian_service.dart';

int like = 0;
int dislike = 0;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
);
   await notifikasi();
   
   
  runApp( ChangeNotifierProvider(
    create: (context) => penilaianservice(),
  child:  new MaterialApp(
    debugShowCheckedModeBanner :false,
    // home: penliaianlistpage()
    home: halbaru(), routes: {
     
    '/profil': (BuildContext context) => new profil(),
    '/yutup': (BuildContext context) => new yutub()
  }),
  )
   
  );
 
}






Color warna2 = Color.fromARGB(255, 48, 45, 45);
Color warna3 = Colors.white;

class yutub extends StatefulWidget {
   List<Map<String, dynamic>> img = DummyData.gambar;
     
  @override
  State<yutub> createState() => _yutubState();
}

class _yutubState extends State<yutub> {
  late TabController controller;

  int selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    pageController.animateToPage(index,
        duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
  }
     

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: warna2,
        leading: Image.network(
            'https://www.freepnglogos.com/uploads/youtube-play-red-logo-png-transparent-background-6.png'),
        title: new Padding(
            padding: new EdgeInsets.only(left: 0),
            child: new Text(
              "Youtube",
              style: TextStyle(color: warna3),
            )),
        actions: [
          new IconButton(
              onPressed: () {
                showSearch(context: context, delegate: pencarian());
              },
              icon: Icon(
                Icons.search,
                size: 26,
                color: warna3,
              )),
          SizedBox(width: 20),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () {},
                  child: new Row(
                    children: [
                      new IconButton(
                        onPressed: () {
                          setState(() {
                            if (warna2 == Colors.white) {
                              warna2 = Color.fromARGB(255, 48, 45, 45);
                              warna3 = Colors.white;
                            } else {
                              warna2 = Colors.white;
                              warna3 = Color.fromARGB(255, 48, 45, 45);
                            }
                          });
                        },
                        icon: new Icon(
                          Icons.crop_rotate,
                          size: 26.0,
                          color: warna3,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      new IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profil');
                        },
                        icon: new Icon(
                          Icons.account_circle_sharp,
                          size: 26,
                          color: warna3,
                        ),
                      )
                    ],
                  ))),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          
          Container(
              child: ListView.builder(
                itemCount:widget.img.length,
                itemBuilder: (context,index){
                  return  GestureDetector(
                   onTap: () {
                    // penilaianservice().updatenilai(index.toString(), widget.img[index]['title']);
                     Navigator.of(context).push(MaterialPageRoute(
                       builder: (_) => likes(utama: widget.img[index]["Utama"],title: widget.img[index]["title"],),
                       maintainState: false,
                     ));
                   },
                   child: Column(
                     children: [
                       Container(
                     height: 200,
                     decoration:  BoxDecoration(
                       image: DecorationImage(
                           image: AssetImage(widget.img[index]["Utama"]),
                           fit: BoxFit.cover),
                           
                     ),
                     
                   ),

                      Container(
                   height: 100,
                   color: warna2,
                   child: Row(
                    
                     children: [
                       SizedBox(width: 15,),
                      
                       Container(
                         width: 50,
                         height: 50,
                         decoration: BoxDecoration(
                           image: DecorationImage(image: AssetImage(widget.img[index]["profil"])),
                           shape: BoxShape.circle,
                           color: Colors.white
                          
                         ),
                       ),
                       SizedBox(width: 10,),
                       Container(
                      
                         width: 300,
                         height: 70,
                         child: Column(
                          
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(widget.img[index]["title"],style: TextStyle(fontSize: 18,color: warna3),),
                             Container(
                               child: Row(
                                 children: [
                                   Text("Music Player ",style: TextStyle(color: Colors.grey),),
                                   Text(like.toString(),style: TextStyle(color: Colors.grey),),
                                   Text("  menyukai",style: TextStyle(color: Colors.grey),)
                                 ],
                               ),
                             )
                             
                           ],
                         ),

                       )
                      
                     ],
                   ),
                 ),

                     ],
                   ) 
                 );
                
              }
              ),
          //     SingleChildScrollView(
          //   child: Column( 
          //     children: [
                
               
               
          //        GestureDetector(
          //         onTap: () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //             builder: (_) => likes(),
          //             maintainState: false,
          //           ));
          //         },
          //         child: Container(
          //           height: 200,
          //           decoration: const BoxDecoration(
          //             image: DecorationImage(
          //                 image: AssetImage("img/hotel.jpeg"),
          //                 fit: BoxFit.cover),
          //           ),
          //         ),
          //       ),
                
                
          //       Container(
          //         height: 100,
          //         color: warna2,
          //         child: Row(
                    
          //           children: [
          //             SizedBox(width: 15,),
                      
          //             Container(
          //               width: 50,
          //               height: 50,
          //               decoration: BoxDecoration(
          //                 image: DecorationImage(image: AssetImage("img/gambarmusic.jpg")),
          //                 shape: BoxShape.circle,
          //                 color: Colors.white
                          
          //               ),
          //             ),
          //             SizedBox(width: 10,),
          //             Container(
                      
          //               width: 300,
          //               height: 70,
          //               child: Column(
                          
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text("Play music california from engels",style: TextStyle(fontSize: 18,color: warna3),),
          //                   Container(
          //                     child: Row(
          //                       children: [
          //                         Text("Music Player ",style: TextStyle(color: Colors.grey),),
          //                         Text(like.toString(),style: TextStyle(color: Colors.grey),),
          //                         Text("  menyukai",style: TextStyle(color: Colors.grey),)
          //                       ],
          //                     ),
          //                   )
                             
          //                 ],
          //               ),

          //             )
                      
          //           ],
          //         ),
          //       ),
                
          //       Container(
          //         height: 200,
          //         width: double.infinity,
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //               image: AssetImage("img/dedy.jpeg"), fit: BoxFit.cover),
          //         ),
          //       ),
          //       Container(
          //         height: 100,
          //         color: warna2,
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.thumb_up_alt_rounded,
          //               size: 26,
          //               color: warna3,
          //             ),
          //             SizedBox(
          //               width: 20,
          //             ),
          //             Icon(
          //               Icons.thumb_down_alt_rounded,
          //               size: 26,
          //               color: warna3,
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         height: 200,
          //         width: double.infinity,
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //               image: AssetImage("img/ghost.jpg"), fit: BoxFit.cover),
          //         ),
          //       ),
          //       Container(
          //         height: 100,
          //         color: warna2,
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.thumb_up_alt_rounded,
          //               size: 26,
          //               color: warna3,
          //             ),
          //             SizedBox(
          //               width: 20,
          //             ),
          //             Icon(
          //               Icons.thumb_down_alt_rounded,
          //               size: 26,
          //               color: warna3,
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         height: 200,
          //         width: double.infinity,
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //               image: AssetImage("img/miaw.jpeg"), fit: BoxFit.cover),
          //         ),
          //       ),
          //       Container(
          //         height: 100,
          //         color: warna2,
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.thumb_up_alt_rounded,
          //               size: 26,
          //               color: warna3,
          //             ),
          //             SizedBox(
          //               width: 20,
          //             ),
          //             Icon(
          //               Icons.thumb_down_alt_rounded,
          //               size: 26,
          //               color: warna3,
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         height: 200,
          //         width: double.infinity,
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //               image: AssetImage("img/hotel.jpeg"), fit: BoxFit.cover),
          //         ),
          //       ),
          //       Container(
          //         height: 100,
          //         color: warna2,
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.thumb_up_alt_rounded,
          //               size: 26,
          //               color: warna3,
          //             ),
          //             SizedBox(
          //               width: 20,
          //             ),
          //             Icon(
          //               Icons.thumb_down_alt_rounded,
          //               size: 26,
          //               color: warna3,
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         height: 200,
          //         width: double.infinity,
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //               image: AssetImage("img/yotop.jpeg"), fit: BoxFit.cover),
          //         ),
          //       )
          //     ],
          //   ),
          // )
        
          ),
        
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: warna2,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: warna3),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions_rounded,
              color: warna3,
            ),
            label: 'Subscribe',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: warna3,
            ),
            label: 'Eksplorasi',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_rounded,
              color: warna3,
            ),
            label: 'Profil',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: warna3,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedLabelStyle: TextStyle(color: Colors.white),
        onTap: onTapped,
      ),
      
    );
  }
}

class pencarian extends SearchDelegate {
  int index = 0;
  List<String> data = ['Apple', 'Banana', 'Motor', 'Kuda', 'moter', 'Motar'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuerry = [];

    for (var fruit in data) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuerry.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuerry.length,
        itemBuilder: (context, index) {
          var result = matchQuerry[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuerry = [];
    for (var fruit in data) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuerry.add(fruit);
      }
    }

    return ListView.builder(
        itemCount: matchQuerry.length,
        itemBuilder: (context, index) {
          var result = matchQuerry[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}

class Mainpage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) =>Scaffold(
   
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
        if(snapshot.hasData){
          return Home();
        }else{
          return login();
        }
      },),
  );
  
}