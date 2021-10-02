import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sun_time/pages/home/home.dart';
import '../styles.dart';

class SelectListView extends StatefulWidget {
  late String _listLabel;
  late List<String> _list;

  late final IntCallback onSonChanged;

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
  List<bool> _selectedBoxes = List.filled(10, false);

  int itensSelected = 0;

  @override
  Widget build(BuildContext context) {
    //print(_selectedItems);
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
                    if (_selectedBoxes[index] == true) {
                      _selectedBoxes[index] = false;

                      Home.of(context)!.setList(widget._list[index]);
                    } else {
                      _selectedBoxes[index] = true;

                      Home.of(context)!.setList(widget._list[index]);
                    }
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
