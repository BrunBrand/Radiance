import 'package:flutter/material.dart';
import 'package:sun_time/widgets/dropdown_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1)),
          DropDownList(),
          TextFormField(),
          TextFormField(),
          TextFormField()
        ],
      ),
    ));
  }
}
