import 'package:flutter/material.dart';
import 'package:sun_time/widgets/dropdown_list.dart';
import 'package:sun_time/widgets/select_list_view.dart';
import '../../styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

  static _HomeState? of(BuildContext context) =>
      context.findAncestorStateOfType<_HomeState>();
}

class _HomeState extends State<Home> {
  int _nOfSelectedItems = 0;
  String selected = '0';

  final textController = TextEditingController();

  late List<String> _list = [];

  void setList(String value) {
    setState(() {
      _list.contains(value) ? _list.remove(value) : _list.add(value);
    });
  }

/*
  String _string = '0';

  set string(String value) => setState(() {
        if (_list.contains(value)) {
          _list.remove(value);
        } else
          _list.add(value);
      });
*/
  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      selected = _list.length.toString();
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_list);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.1,
              alignment: Alignment.center,
              child: Text(_list.length.toString()),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1)),
                  SelectListView(
                    listLabel: 'Solar Fluxes and Related',
                    list: const [
                      'All Sky Surface Shortwave Downward Irradiance',
                      'Clear Sky Surface Shortwave',
                      'All Sky Insolation Clearness Index',
                      'All Sky Normalized Insolation Clearness Index',
                      'All Sky Surface Longwave Downward Irradiance (Thermal Infrarred)',
                      'All Sky Surface Photosynthetically Active Radiation (PAR) Total',
                      'Clear Sky Surface Photosynthetically Active Radiation (PAR) Total',
                      'All Sky Surface UVA Irradiance',
                      'All Sky Surface UVB Irradiance',
                      'All Sky Surface UV Index'
                    ],
                  ),
                  SelectListView(listLabel: 'Temperatures', list: const [
                    'Temperature at 2 Meters',
                    'Dew/Frost Point at 2 Meters',
                    'Earth Skin Temperature',
                    'Temperature at 2 Meters Range',
                    'Temperature at 2 Meters Maximum',
                    'Temperature at 2 Meters Maximum'
                  ]),
                  SelectListView(listLabel: 'Humidity', list: const [
                    'Specific Humidity at 2 Meters',
                    'Relative Humidity at 2 Meters',
                    'Precipitation'
                  ]),
                  SelectListView(listLabel: 'Wind/Pressure', list: const [
                    'Surface Pressure',
                    'Wind Speed at 2 Meters',
                    'Wind Speed at 10 Meters',
                    'Wind Speed at 10 Meters Maximum',
                    'Wind Speed at 10 Meters Minimum',
                    'Wind Speed at 10 Meters Range',
                    'Wind Speed at 50 Meters',
                    'Wind Speed at 50 Meters Maximum',
                    'Wind Speed at 50 Meters Minimum',
                    'Wind Speed at 50 Meters Range'
                  ]),
                ],
              ),
            )
          ],
          //physics: ScrollPhysics(),
        ));
  }
}

typedef void IntCallback(int id);

class Son extends StatelessWidget {
  final IntCallback onSonChanged;
  Son({required this.onSonChanged});

  int elementId = 3;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onSonChanged(5);
      },
      child: Text('Click me the callback! ' + elementId.toString()),
    );
  }
}
