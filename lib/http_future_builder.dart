import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_flutter/models/users.dart';

class FutureBuilderApp extends StatelessWidget {
  List<UsersModel> allUser = [];

  //membuat method yg bertipe future
  Future getAllUser() async {
    try {
      // await Future.delayed(Duration(seconds: 3));
      var respon =
          await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

      List userData = (json.decode(respon.body)
          as Map<String, dynamic>)['data']; //merubah ke bentuk map

      userData.forEach((element) {
        //memgambil semua element
        allUser.add(UsersModel.fromJson(element));
        print(allUser);
      });
    } catch (e) {
      print('Erooorrr...$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Future Builder'),
          centerTitle: true,
        ),

        //future builder digunakan untuk membuat data langsung ada tanpa diklik
        body: FutureBuilder(
            //parameter future harus diisi dengan method/variabel yg bertipe future
            future: getAllUser(),
            builder: (context, snapshot) {
              //snapshot digunakan untuk mengecek kondisi koneksi
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text('LOADING...'),
                );
              } else if (allUser.length == 0) {
                return Center(
                  child: Text('Tidak ada data'),
                );
              } else {
                return ListView.builder(
                  itemCount: allUser.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(allUser[index].avatar),
                      backgroundColor: Colors.grey[300],
                    ),
                    title: Text(
                        '${allUser[index].firstName} ${allUser[index].lastName}'),
                    subtitle: Text(allUser[index].email),
                  ),
                );
              }
            }));
  }
}
