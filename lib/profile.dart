import 'package:flutter/material.dart';
import 'package:youtube/penilaian/pages/penilaian_edit.dart';
import 'main.dart';
import 'login.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profil extends StatelessWidget {
  void logout() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  @override
  Widget build(BuildContext context) {
    Color warna = warna2;
    List<String> halaman = [
      "Channel Anda",
      "Youtube Studio",
      "Waktu tonton",
      "Youtube Premium",
      "Langganan",
      "Ganti Akun",
      "Mode Samaran",
      "Data Youtube",
      "Setelan",
      "Bantuan & Saran"
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: warna2,
          leading: new IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/yutup');
              },
              icon: Icon(
                Icons.cancel_outlined,
                size: 26,
                color: warna3,
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            authenticationservice service = authenticationservice(FirebaseAuth.instance);
            service.Keluar();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => login(),
                ));
          },
          backgroundColor: Colors.white,
          child: Text(
            " Keluar ",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
            itemCount: halaman.length,
            itemBuilder: (context, index) {
              return GestureDetector (
                 onTap: () {
                    // penilaianservice().updatenilai(index.toString(), widget.img[index]['title']);
                     Navigator.of(context).push(MaterialPageRoute(
                       builder: (_) => penilaianeditpage(),
                       maintainState: false,
                     ));
                   },
                child: Container(
                  width: double.infinity,
                  height: 100,
                  color: warna,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          halaman[index],
                          style: TextStyle(color: warna3, fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
