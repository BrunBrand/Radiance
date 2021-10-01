import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../styles.dart';

class SelectListView extends StatefulWidget {
  late String _listLabel;
  late List<String> _list;

  SelectListView(
      {Key? key, required String listLabel, required List<String> list})
      : super(key: key) {
    _listLabel = listLabel;
    _list = list;
  }

  @override
  _SelectListViewState createState() => _SelectListViewState();
}

class _SelectListViewState extends State<SelectListView> {
  List<String> _selectedItems = [];
  List<bool> _selectedBoxes = List.filled(10, false);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget._listLabel),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget._list.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.blue,
                onTap: () {
                  setState(() {
                    _selectedBoxes[index] == true
                        ? _selectedBoxes[index] = false
                        : _selectedBoxes[index] = true;
                  });
                },
                leading: Checkbox(
                    activeColor: brandColor1,
                    value: _selectedBoxes[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedBoxes[index] = value!;
                      });
                    }),
                title: Text(widget._list[index],
                    style: TextStyle(color: Colors.white)),
              );
            },
          )
        ],
      ),
    );
  }
}
