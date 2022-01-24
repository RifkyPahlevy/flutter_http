import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart '
    as http; // untuk menggunakan http harus import http package dulu
//

class HttpGet extends StatefulWidget {
  @override
  State<HttpGet> createState() => _HttpGetState();
}

class _HttpGetState extends State<HttpGet> {
  late String id;
  late String email;
  late String nama;
  late String foto;
  @override
  void initState() {
    id = '';
    email = '';
    nama = '';
    foto = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP GET'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(foto),
            Text(
              'ID : $id',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Email : $email',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Nama : $nama',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  var myRespone = await http
                      .get(Uri.parse('https://reqres.in/api/users/3'));

                  if (myRespone.statusCode == 200) {
                    print('Berhasil dipanggil');
                    //json digunakan untuk mengubah string ke object
                    Map<String, dynamic> result =
                        json.decode(myRespone.body) as Map<String, dynamic>;
                    setState(() {
                      foto = result['data']['avatar'].toString();
                      id = result['data']['id'].toString();
                      email = result['data']['email'].toString();
                      nama =
                          '${result['data']['first_name']} ${result['data']['last_name']}'
                              .toString();
                    });
                  } else {
                    print('Gagal dipanggil');
                  }
                },
                child: Text('Get Data'))
          ],
        ),
      ),
    );
  }
}
