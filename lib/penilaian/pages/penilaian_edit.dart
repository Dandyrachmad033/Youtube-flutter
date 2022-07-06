import 'package:flutter/material.dart';
import 'package:youtube/penilaian/service/penilaian_service.dart';
import 'package:provider/provider.dart';
import 'package:youtube/main.dart';

class penilaianeditpage extends StatefulWidget {
  penilaianeditpage({Key? key}) : super(key: key);

  @override
  State<penilaianeditpage> createState() => _penilaianeditpageState();
}

class _penilaianeditpageState extends State<penilaianeditpage> {
  final TextEditingController nilai = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<penilaianservice>(

        builder: (context, notifier, _) => ListView.builder(
          itemCount: notifier.favorite.length ,
          itemBuilder: (BuildContext context, int index) {
            return Column(
                     children: [
                       Container(
                     height: 200,
                     decoration:  BoxDecoration(
                       image: DecorationImage(
                           image: AssetImage(notifier.favorite[index]['Utama'].toString()),
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
                      
                         width: 300,
                         height: 70,
                         child: Column(
                          
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(notifier.favorite[index]['title'].toString(),style: TextStyle(fontSize: 18,color: warna3),),
                             Container(
                               child: Row(
                                 children: [
                                   Text("Music Player ",style: TextStyle(color: Colors.grey),),
                                  
                                   Text("  menyukai",style: TextStyle(color: Colors.grey),),

                                  
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
                   ) ;
          },
        ),
      ),
    );
  }
}