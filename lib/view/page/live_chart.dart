import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({Key? key}) : super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          // 화면 비율
          aspectRatio: 1.25,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 15.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // X축 꾸미기
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 11,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('1970', style: style);
        break;
      case 1:
        text = const Text('1980', style: style);
        break;
      case 2:
        text = const Text('1990', style: style);
        break;
      case 3:
        text = const Text('2000', style: style);
        break;
      case 4:
        text = const Text('2010', style: style);
        break;
      case 5:
        text = const Text('2020', style: style);
        break;
      case 6:
        text = const Text('2030', style: style);
        break;
      case 7:
        text = const Text('2040', style: style);
        break;
      case 8:
        text = const Text('2050', style: style);
        break;
      case 9:
        text = const Text('2060', style: style);
        break;
      case 10:
        text = const Text('2070', style: style);
        break;

      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 7.0,
      child: text,
    );
  }

  // Y축 꾸미기
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 11,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '25,000';
        break;
      case 2:
        text = '30,000';
        break;
      case 3:
        text = '40,000';
        break;
      case 4:
        text = '45,000';
        break;
      case 5:
        text = '50,000';
        break;
      case 6:
        text = '55,000';
        break;
      case 7:
        text = '총 인구(천명)';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  // 메인 그래프 데이터
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 35,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 10,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        // 그래프 수치 보여주기
        LineChartBarData(
          spots: const [
            FlSpot(0, 2.3),
            FlSpot(2.6, 3.9),
            FlSpot(4.9, 4.7),
            FlSpot(6.8, 4.3),
            FlSpot(8, 3.8),
            FlSpot(10, 2.5),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }

// avg 데이터
// LineChartData avgData() {
//   return LineChartData(
//     lineTouchData: LineTouchData(enabled: false),
//     gridData: FlGridData(
//       show: true,
//       drawHorizontalLine: true,
//       verticalInterval: 1,
//       horizontalInterval: 1,
//       getDrawingVerticalLine: (value) {
//         return FlLine(
//           color: const Color(0xff37434d),
//           strokeWidth: 1,
//         );
//       },
//       getDrawingHorizontalLine: (value) {
//         return FlLine(
//           color: const Color(0xff37434d),
//           strokeWidth: 1,
//         );
//       },
//     ),
//     titlesData: FlTitlesData(
//       show: true,
//       bottomTitles: AxisTitles(
//         sideTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 30,
//           getTitlesWidget: bottomTitleWidgets,
//           interval: 1,
//         ),
//       ),
//       leftTitles: AxisTitles(
//         sideTitles: SideTitles(
//           showTitles: true,
//           getTitlesWidget: leftTitleWidgets,
//           reservedSize: 42,
//           interval: 1,
//         ),
//       ),
//       topTitles: AxisTitles(
//         sideTitles: SideTitles(showTitles: false),
//       ),
//       rightTitles: AxisTitles(
//         sideTitles: SideTitles(showTitles: false),
//       ),
//     ),
//     borderData: FlBorderData(
//         show: true,
//         border: Border.all(color: const Color(0xff37434d), width: 1)),
//     minX: 0,
//     maxX: 11,
//     minY: 0,
//     maxY: 6,
//     lineBarsData: [
//       LineChartBarData(
//         spots: const [
//           FlSpot(0, 3.44),
//           FlSpot(2.6, 3.44),
//           FlSpot(4.9, 3.44),
//           FlSpot(6.8, 3.44),
//           FlSpot(8, 3.44),
//           FlSpot(9.5, 3.44),
//           FlSpot(11, 3.44),
//         ],
//         isCurved: true,
//         gradient: LinearGradient(
//           colors: [
//             ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                 .lerp(0.2)!,
//             ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                 .lerp(0.2)!,
//           ],
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ),
//         barWidth: 5,
//         isStrokeCapRound: true,
//         dotData: FlDotData(
//           show: false,
//         ),
//         belowBarData: BarAreaData(
//           show: true,
//           gradient: LinearGradient(
//             colors: [
//               ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                   .lerp(0.2)!
//                   .withOpacity(0.1),
//               ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                   .lerp(0.2)!
//                   .withOpacity(0.1),
//             ],
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//           ),
//         ),
//       ),
//     ],
//   );
// }
}
