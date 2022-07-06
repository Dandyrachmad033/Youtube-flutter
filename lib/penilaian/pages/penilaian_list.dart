import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube/penilaian/service/penilaian_service.dart';
import 'package:provider/provider.dart';
import 'package:youtube/penilaian/pages/penilaian_edit.dart';
import 'package:flutter/material.dart';

import 'package:youtube/data_card.dart';

class halbaru extends StatefulWidget {
  const halbaru({Key? key}) : super(key: key);

  @override
  State<halbaru> createState() => _MainPageState();
}

class _MainPageState extends State<halbaru> {
  final email = TextEditingController();
  final depan = TextEditingController();
  final belakang = TextEditingController();
  final id = TextEditingController();
  Person? person;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              person != null
                  ? PersonCard(person: person!)
                  :  Text('no data'),
               SizedBox(
                height: 20,
              ),

              TextField(
                          controller: id,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Masukkan id",
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      Person? result = await penilaianservice.getbyid(id.text);
                      if(result != null){
                        setState(() {
                          person = result;
                        });
                      }
                    }, child:  Text('GET')),
              ),

                TextField(
                          controller: email,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Masukkan Email",
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),


                        TextField(
                          controller: depan,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Masukkan nama depan",
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),

                        TextField(
                          controller: belakang,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Masukkan nama belakang",
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),


              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      Person? result = await penilaianservice.create(depan.text, belakang.text, email.text);

                    if(result != null){
                      setState(() {
                        person = result;
                      });
                    }
                    }, child: const Text('POST')),
              ),

              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      Person? result = await penilaianservice.delete(id.text);

                    if(result != null){
                      setState(() {
                        person = result;
                      });
                    }
                    }, child: const Text('Delete')),
              )
              ,

              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      Person? result = await penilaianservice.update(depan.text, belakang.text);

                    if(result != null){
                      setState(() {
                        person = result;
                      });
                    }
                    }, child: const Text('update')),
              ),
            ],
          ),
        ));
  }
}