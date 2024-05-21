import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Line Chart'),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           const SizedBox(
              height: 20,
            ),
            Container(
              margin:const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              // height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            // padding: EdgeInsets.symmetric(horizontal: 20),
                            child:const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Total views: ',
                                    style: TextStyle(
                                      color: Color(0xFF363638),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '60',
                                    style: TextStyle(
                                      color: Color(0xFFE45151),
                                      fontSize: 16,
                                      fontFamily: 'Cabin',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                          ),
                         const SizedBox(width: 5,),
                          Container(
                            width: 68,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red,
                            ),
                            child:const Center(child: Text("Weekly",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)),
                          )
                        ],
                      ),
                      Container(
                        child:const Text("See details",style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                          
                        ),
                        
                        ),
                      ),
                    ],
                  ),
                 const SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: LineChartWidget(),
                  ),
                ],
              ),
            ),
       
       
          ],
        ),
      ),
    );
  }
}

class Titles {
  static getTitleData() => FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 35,

        // getTextStyles: (value) => const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return 'Sun';
            case 1:
              return '';
            case 2:
              return 'Mon';
            case 3:
              return '';
            case 4:
              return 'Tue';
            case 5:
              return '';
            case 6:
              return 'Wed';
            case 7:
              return '';
            case 8:
              return 'Thu';
            case 9:
              return '';
            case 8:
              return 'Thu';
            case 9:
              return '';
            case 10:
              return 'Fri';
            case 11:
              return '';
            case 12:
              return 'Sat';
          }
          return '';
        },
        margin: 5,
      ),
      leftTitles: SideTitles(
          showTitles: true,

          // getTextStyles: (value) =>  TextStyle(
          // color: Colors.grey,
          // fontWeight: FontWeight.bold,fontSize: 13,
          // ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '';
              case 1:
                return '1';
              case 2:
                return '2';
              case 3:
                return '3';
              case 4:
                return '4';
              case 5:
                return '5';
              case 6:
                return '6';
            }
            return '';
          },
          reservedSize: 15,
          margin: 5));
}

class LineChartWidget extends StatelessWidget {
  final List<Color> gradiantColors = [Colors.redAccent, Colors.orangeAccent];

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
        minX: 0,
        maxX: 12,
        minY: 0,
        maxY: 7,
        titlesData: Titles.getTitleData(),
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color.fromARGB(100, 100, 100, 100),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
            // show: true,
            ),
        lineBarsData: [
          LineChartBarData(
              spots: [
                FlSpot(0, 4.5),
                FlSpot(1.1, 1.3),
                FlSpot(2.5, 1.4),
                FlSpot(4, 3.8),
                FlSpot(6.5, 1.6),
                FlSpot(7.6, 4),
                // FlSpot(8.3, 3.6),
                FlSpot(9.2, 4.2),
                  FlSpot(12, 2.5),
              ],
              isCurved: true,
              //  isStrokeCapRound: true,
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
                colors: gradiantColors
                    .map((color) => color.withOpacity(.4))
                    .toList(),
              ))
        ]));
  }
}
