import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({Key? key}) : super(key: key);

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String dropDownValue = 'All Sky Surface Shortwave Downward Irradiance';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Solar Fluxes and Related'),
          DropdownButton<String>(
            value: dropDownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.blue),
            underline: Container(
              height: 2,
              color: Colors.amber,
            ),
            onChanged: (String? value) {
              setState(() {
                dropDownValue = value!;
              });
            },
            items: <String>[
              'All Sky Surface Shortwave Downward Irradiance',
              'Clear Sky Surface Shortwave Downward'
            ]
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                .toList(),
          )
        ],
      ),
    );
  }
}
