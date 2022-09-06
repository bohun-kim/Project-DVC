import 'package:flutter/material.dart';
import 'package:project_dvc/config/palette.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            '데이터 시각화 집합소',
            style: TextStyle(color: Colors.black87,fontSize: 17),
          ),
        ),
        backgroundColor: Colors.white24,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.orange,
            ),
          ), //  POINT: BoxDecoration
        ),
      ),
    );
  }
}
