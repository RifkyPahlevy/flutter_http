import 'package:flutter/material.dart';
import 'package:http_flutter/http_delete.dart';
import 'package:http_flutter/http_future_builder.dart';
import 'package:http_flutter/http_get.dart';
import 'package:http_flutter/http_post.dart';
import 'package:http_flutter/http_put_patch.dart';

void main() {
  runApp(MyApp());
}

//add package http di project dengan add depedencies
// untuk menggunakan http harus import http dulu di setiap kelas yg menggunakan http
// gunakan extensi pubspec assist agar mudah menambahkan depedencies di pubspec.yaml

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilderApp(),
    );
  }
}
