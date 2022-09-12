import 'package:flutter/material.dart';
import 'package:project_dvc/config/glassmorphism.dart';
import 'package:project_dvc/config/palette.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);

  final List<String> titleList = ['의료', '사람', '금융', '문화', '동물', '2'];
  final List<IconData> iconList = [
    Icons.medical_services_outlined,
    Icons.person_outline,
    Icons.money_outlined,
    Icons.museum_outlined,
    Icons.pets_outlined,
    Icons.medical_services_outlined,
  ];
  final List<Widget> pageList = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '데이터 시각화 집합소',
          style: TextStyle(color: Colors.black87, fontSize: 18),
        ),
        backgroundColor: Colors.white24,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 동적 시각화 차트
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  child: GlassMorphism(
                    child: Text('동적 그래프'),
                    start: .7,
                    end: .5,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),

          // 분야별 아이콘 버튼
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return GlassMorphism(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            iconList[index],
                          ),
                          iconSize: 50,
                        ),
                        Text(
                          titleList[index],
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    start: .7,
                    end: .5,
                  );
                },
                itemCount: titleList.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
