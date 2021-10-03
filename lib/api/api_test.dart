import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ApiTest extends StatelessWidget
{
  const ApiTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container( child: _ChartApp() );
  }
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {

  // Cria uma lista com os objetos chave/valor sendo a chave o nome do dado e o valor o valor no gráfico
  List<_SalesData> data =
  [
    _SalesData(2000, 35),
    _SalesData(2001, 28),
    _SalesData(2002, 34),
    _SalesData(2003, 32),
    _SalesData(2024, 40),
    _SalesData(2025, 78),
    _SalesData(2026, 16),
    _SalesData(2027, 47),
    _SalesData(2028, 100)

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test Line Chart'),
        ),
        body:
          //Initialize the chart widget
          SfCartesianChart( series: <ChartSeries>[
            LineSeries<_SalesData, int>(dataSource: data,
            xValueMapper: (_SalesData sales, _) => sales.year,
            yValueMapper: (_SalesData sales, _) => sales.sales),

          ],),
        );
  }
}

// Classe com o dado a ser plotado
class _SalesData {
  _SalesData(this.year, this.sales);

  final int year;
  final double sales;
}


