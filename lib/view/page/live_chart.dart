import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:project_dvc/config/glassmorphism.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class LiveChart extends StatefulWidget {
  const LiveChart({Key? key}) : super(key: key);

  @override
  State<LiveChart> createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {
  // 1. 변수 선언
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  // 3. initState 생성
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initState 생성 후 차트 값 반영
    chartData = getChartData();

    // 5. 타이머 주기적 반응
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
  }

  // 4. getChartData 메서드 생성
  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 42),
      LiveData(1, 42),
      LiveData(2, 42),
      LiveData(3, 42),
      LiveData(4, 42),
      LiveData(5, 42),
      LiveData(6, 42),
      LiveData(7, 42),
      LiveData(8, 42),
      LiveData(9, 42)
    ];
  }

  // 6. Timer.periodic 의 어떻게 기능작용 할 건지
  int time = 10;

  updateDataSource(Timer timer) {
    chartData.add(LiveData(time++, (math.Random().nextInt(60))));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SfCartesianChart(
          // legend: Legend(isVisible: true),
          series: [
            LineSeries<LiveData, int>(
                onRendererCreated: (ChartSeriesController controller) {
                  _chartSeriesController = controller;
                },
                dataSource: chartData,
                xValueMapper: (LiveData data, _) => data.time,
                yValueMapper: (LiveData data, _) => data.speed,
           )
          ],
          primaryXAxis: NumericAxis(majorGridLines: MajorGridLines(width: 1),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
            interval: 2,
            title: AxisTitle(text:'Time (seconds)')
          ),
          primaryYAxis: NumericAxis(majorGridLines: MajorGridLines(width: 1),
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              interval: 2,
              title: AxisTitle(text:'Speed (m/s)')
          ),
        ),
      ),
    );
  }
}

// 2. 클래스 생성
class LiveData {
  final int time;
  final num speed;

  LiveData(this.time, this.speed);
}
