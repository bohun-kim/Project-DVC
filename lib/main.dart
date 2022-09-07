import 'package:flutter/material.dart';
import 'package:project_dvc/view/mypage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '데이터 시각화 집합소',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.openSansTextTheme(),
        scaffoldBackgroundColor: Color(0xffd1d8e0),
      ),
      home: const MyPage(),
    );
  }
}
