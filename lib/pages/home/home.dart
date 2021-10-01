import 'package:flutter/material.dart';
import 'package:sun_time/widgets/dropdown_list.dart';
import 'package:sun_time/widgets/select_list_view.dart';
import '../../styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          //physics: ScrollPhysics(),
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
              SelectListView(
                  listLabel: 'Parameters For Solar Cooking',
                  list: const [
                    'All Sky Surface Shortwave Downward Irradiance',
                    'Clear Sky Surface Shortwave Downward Irradiance',
                    'Wind Speed at 2 Meters'
                  ]),
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
        ));
  }
}
