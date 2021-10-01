import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  String _textLabel = 'label';
  late List<String> _textList;

  DropDownList(
      {Key? key, required String textLabel, required List<String> textList})
      : super(key: key) {
    _textLabel = textLabel;
    _textList = textList;
  }

  @override
  State<DropDownList> createState() => _DropDownListState(_textList.first);
}

class _DropDownListState extends State<DropDownList> {
  String? dropdownValue;
  _DropDownListState(this.dropdownValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget._textLabel),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.blue),
            underline: Container(
              height: 2,
              color: Colors.amber,
            ),
            onChanged: (String? valueInput) {
              setState(() {
                dropdownValue = valueInput!;
              });
            },
            items: widget._textList
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
