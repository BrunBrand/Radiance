import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sun_time/api/apiTest.dart';
import 'package:sun_time/pages/home/home.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const ApiTest());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Application extends State {
  late TooltipBehavior _tooltipBehaviour;

  @override
  void initState() {
    _tooltipBehaviour = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(text: "That is a graph"),
      legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehaviour,
      series: <LineSeries<SalesData, String>>[
        LineSeries<SalesData, String>(
            dataSource: <SalesData>[
              SalesData('Jan', 35),
              SalesData('Feb', 28),
              SalesData('Mar', 34),
              SalesData('Apr', 32),
              SalesData('May', 40)
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales)
      ],
    )));
  }
}

class SalesData {
  final String year;
  final double sales;

  SalesData(this.year, this.sales);
}
