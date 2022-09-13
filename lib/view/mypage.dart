import 'package:flutter/material.dart';
import 'package:project_dvc/config/glassmorphism.dart';
import 'package:project_dvc/config/mainpage_list.dart';
import 'package:project_dvc/view/page/live_chart.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);

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
        children: [
          // 동적 시각화 차트
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Container(
              width: double.infinity,
              height: 300,
              child: LiveChart(),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return MainPageList().pageList[index];
                              }),
                            );
                          },
                          icon: Icon(
                            MainPageList().iconList[index],
                          ),
                          iconSize: 50,
                        ),
                        Text(
                          MainPageList().titleList[index],
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    start: .7,
                    end: .5,
                  );
                },
                itemCount: MainPageList().titleList.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
