import 'dart:convert';

import 'flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpPutPatch extends StatefulWidget {
  @override
  State<HttpPutPatch> createState() => _HttpPutPatchState();
}

class _HttpPutPatchState extends State<HttpPutPatch> {
  TextEditingController nameC = TextEditingController();

  TextEditingController jobC = TextEditingController();

  String myResult = 'Belum Ada Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP PUT/PATCH'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          SizedBox(height: 20),
          TextField(
              controller: jobC,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Job',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                var responeData = await http.post(
                    Uri.parse('https://reqres.in/api/users'),
                    body: {"name": nameC.text, "job": jobC.text});

                var data =
                    json.decode(responeData.body) as Map<String, dynamic>;

                setState(() {
                  myResult = '${data['name']} - ${data['job']}';
                });
              },
              child: Text('Submit')),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          Text(myResult)
        ],
      ),
    );
  }
}
