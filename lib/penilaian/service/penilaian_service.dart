import 'dart:ffi';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:youtube/dummy_data.dart';
import 'package:youtube/main.dart';
import 'package:youtube/penilaian/pages/penilaian_list.dart';

 class penilaianservice extends ChangeNotifier{
   List<Map<String, dynamic>> Nilai = DummyData.gambar;
   List<Map<String, dynamic>> myFavoriteVideo = [];
  int? selectedIndex;
  

  void addFavoriteVideo(String utama, String title){
    myFavoriteVideo.add({
      "Utama": utama,
      "title": title
    });
    notifyListeners();
  }

  void deletevidio(String utama,String title){
    for(int i =0;i<myFavoriteVideo.length;i++){
      if(myFavoriteVideo[i]['Utama']==utama ){
        myFavoriteVideo.removeAt(i);
        break;
      }
    }
    notifyListeners();
  }

  List<Map<String, dynamic>> get favorite => myFavoriteVideo;


  static Future<Person?> getbyid(String id) async{
   
      var respon = await Dio().get("https://reqres.in/api/users/$id");
      if(respon.statusCode ==200){
        return Person(email: respon.data['data']['email'],
         id: respon.data['data']['id'].toString(),
          nama: respon.data['data']['first_name']+' '+respon.data['data']['last_name']);
      }
      return null;
      
    
  }

  static Future<Person?> create(String firstname,String lastname,String email ) async{
    var respon = await Dio().post("https://reqres.in/api/users",data:{
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
    }
    );

    if(respon.statusCode == 201){
      return Person(email:respon.data['email'].toString() , id:  respon.data['id'].toString(), nama: respon.data['first_name']+' '+ respon.data['last_name'].toString());
    }
    return null;
  }

  static Future<Person?> delete(String id) async{
    var respon = await Dio().delete("https://reqres.in/api/users/$id");

    if( respon.statusCode == 204){
      print("Delete is sucsecfully");
    }
  }

  static Future<Person?> update(String firstname,String lastname) async{
    var respon = await Dio().put("https://reqres.in/api/users/2",data: [{
      "first_name": firstname,
      "last_name": lastname,
    }
    ]);

    if(respon.statusCode == 200){
       
      return Person(email:respon.data['email'] , id:  respon.data['id'], nama: respon.data['first_name']+' '+ respon.data['last_name'].toString());
    }
    
  }

  
}

class Person {
   Person({required this.email,required this.id,required this.nama});
  String id;
      String nama;
    String email;
   
}




