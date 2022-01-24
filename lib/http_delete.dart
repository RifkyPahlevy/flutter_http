import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDelete extends StatefulWidget {
  const HttpDelete({Key? key}) : super(key: key);

  @override
  _HttpDeleteState createState() => _HttpDeleteState();
}

class _HttpDeleteState extends State<HttpDelete> {
  late String akun;
  @override
  void initState() {
    akun = 'Belum ada Data';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP DELETE'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                var respone =
                    await http.get(Uri.parse('https://reqres.in/api/users/2'));
                Map<String, dynamic> data =
                    json.decode(respone.body) as Map<String, dynamic>;
                setState(() {
                  akun =
                      'Akun : ${data['data']['first_name']} ${data['data']['last_name']}';
                });
              },
              icon: Icon(Icons.download_sharp))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(akun),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () async {
                var respone = await http
                    .delete(Uri.parse('https://reqres.in/api/users/2'));

                setState(() {
                  akun = 'Akun Berhasil dihapus';
                });
              },
              child: Text('DELETE'))
        ],
      ),
    );
  }
}
