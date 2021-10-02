import 'package:flutter/material.dart';
import 'package:sun_time/widgets/dropdown_list.dart';
import 'package:sun_time/widgets/select_list_view.dart';
import '../../styles.dart';

enum listEnum {
  ALLSKY_SFC_SW_DWN,
  CLRSKY_SFC_SW_DWN,
  ALLSKY_KT,
  ALLSKY_NKT,
  ALLSKY_SFC_LW_DWN,
  ALLSKY_SFC_PAR_TOT,
  CLRSKY_SFC_PAR_TOT,
  ALLSKY_SFC_UVA,
  ALLSKY_SFC_UVB,
  ALLSKY_SFC_UV_INDEX,
  T2M,
  T2MDEW,
  T2MWET,
  TS,
  T2M_RANGE,
  T2M_MAX,
  T2M_MIN,
  QV2M,
  RH2M,
  PRECTOTCORR,
  PS,
  WS2M,
  WS10M,
  WS10M_MAX,
  WS10M_MIN,
  WS10M_RANGE,
  WS50M,
  WS50M_MAX,
  WS50M_MIN,
  WS50M_RANGE
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static String EnumToString(String value) {
    switch (value) {
      case 'All Sky Surface Shortwave Downward Irradiance':
        return listEnum.ALLSKY_SFC_SW_DWN.toString();
      case 'Clear Sky Surface Shortwave':
        return listEnum.CLRSKY_SFC_SW_DWN.toString();
      case 'All Sky Insolation Clearness Index':
        return listEnum.ALLSKY_KT.toString();
      case 'All Sky Normalized Insolation Clearness Index':
        return listEnum.ALLSKY_NKT.toString();
      case 'All Sky Surface Longwave Downward Irradiance (Thermal Infrarred)':
        return listEnum.ALLSKY_SFC_LW_DWN.toString();
      case 'All Sky Surface Photosynthetically Active Radiation (PAR) Total':
        return listEnum.ALLSKY_SFC_PAR_TOT.toString();
      case 'Clear Sky Surface Photosynthetically Active Radiation (PAR) Total':
        return listEnum.CLRSKY_SFC_PAR_TOT.toString();
      case 'All Sky Surface UVA Irradiance':
        return listEnum.ALLSKY_SFC_UVA.toString();
      case 'All Sky Surface UVB Irradiance':
        return listEnum.ALLSKY_SFC_UVB.toString();
      case 'All Sky Surface UV Index':
        return listEnum.ALLSKY_SFC_UV_INDEX.toString();

      case 'Temperature at 2 Meters':
        return listEnum.T2M.toString();
      case 'Dew/Frost Point at 2 Meters':
        return listEnum.T2MDEW.toString();
      case 'Earth Skin Temperature':
        return listEnum.T2MWET.toString();
      case 'Temperature at 2 Meters Range':
        return listEnum.TS.toString();

      case 'Temperature at 2 Meters Maximum':
        return listEnum.T2M_RANGE.toString();
      case 'Temperature at 2 Meters Maximum':
        return listEnum.T2MWET.toString();

      default:
        return 'Error 404';
    }
  }

  @override
  _HomeState createState() => _HomeState();

  static _HomeState? of(BuildContext context) =>
      context.findAncestorStateOfType<_HomeState>();
}

class _HomeState extends State<Home> {
  late List<String> _parameters = [];

  late List<listEnum> _enumParameters = listEnum.values;

  List<String> _list = [];

  Color checkBoxColor = Colors.amber;

  void setList(String value) {
    setState(() {
      if (_parameters == 20) {
        checkBoxColor = Colors.red;
      }

      if (_parameters.contains(Home.EnumToString(value).split('.').last)) {
        _parameters.remove(Home.EnumToString(value).split('.').last);
        //_enumParameters.add(_parameters.)
      } else {
        _parameters.add(Home.EnumToString(value).split('.').last);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_parameters);

    //print(_enumParameters);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                right: MediaQuery.of(context).size.height * 0.01,
              ),
              decoration: BoxDecoration(
                  color: checkBoxColor,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.14,
              alignment: Alignment.center,
              child: Text(_parameters.length.toString()),
            ),
            Container(
              alignment: Alignment.topCenter,
              child:
                  ElevatedButton(onPressed: () {}, child: Text('Send request')),
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
                    'Temperature at 2 Meters Minimum'
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
