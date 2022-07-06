import 'package:provider/provider.dart';
import 'package:youtube/penilaian/service/penilaian_service.dart';

import 'main.dart';
import 'package:flutter/material.dart';

class likes extends StatefulWidget {
  const likes({Key? key,required this.utama,required this.title}) : super(key: key);
  final String utama;
  final String title;

  @override
  State<likes> createState() => _likesState();
}

class _likesState extends State<likes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warna2,
      body: Column(
        children: [
          Container(
            height: 200,
            decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.utama), fit: BoxFit.cover),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              GestureDetector(
                  onTap: (){
                    Provider.of<penilaianservice>(context, listen: false).addFavoriteVideo(widget.utama,widget.title);
                    setState(() {
                      like++;
                    });
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Icon(Icons.thumb_up_alt_rounded, size: 26,color: warna3,),
                      Text(like.toString(),style: TextStyle(color: warna3),),
                    ],
                  )
                  ),
      
          GestureDetector(
                  onTap: () {
                      Provider.of<penilaianservice>(context, listen: false).deletevidio(widget.utama,widget.title);
                    setState(() {
                      dislike++;
                    });
                  },
                  child: Column(
                    
                    children: [
                      SizedBox(height: 10,),
                      Icon(Icons.thumb_down_alt_rounded, size: 26,color: warna3,),
                      Text(dislike.toString(),style: TextStyle(color: warna3),),
                      
                    ],
                    
                  )
                  ),
              
                      new Icon(Icons.comment_bank_rounded,size: 26,color: warna3,)

            ],
          ),
          Center(
            child: Column(
              children: [
              ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=> yutub(),maintainState: false,));}, child: Text('Balikan')),
              Padding(padding: EdgeInsets.only(right: 30)),
              ],
            ),
          )

          
        ],
      ),
    );
  }
}
