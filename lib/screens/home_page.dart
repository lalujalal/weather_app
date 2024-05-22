import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/image_path.dart';
import 'package:weather_app/services/location_provider.dart';
import 'package:weather_app/services/weather_service_provider.dart';
import 'package:weather_app/units/apptext.dart';
import 'package:weather_app/units/customdevide.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
   
    final locationProvider =Provider.of<LocationProvider>(context,listen: false);
    locationProvider.determinePosition().then((value) {
      if(locationProvider.currentLocationName!=null){
        var city=locationProvider.currentLocationName?.locality;
        if(city!=null){
          Provider.of<WeatherServiceProvider>(context,listen: false).fetchWeatherDataByCity(city);
        }
      }
     });
    //Provider.of<LocationProvider>(context, listen: false).determinePosition();

    //Provider.of<WeatherServiceProvider>(context,listen: false).fetchWeatherDataByCity("Dubai");
    super.initState();
  }

  TextEditingController  _cityController=TextEditingController();
  var city;
  @override

  void dispose(){
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;

    final locationProvider = Provider.of<LocationProvider>(context);
    final weatherProvider=Provider.of<WeatherServiceProvider>(context);

    int sunriseTimestamp= weatherProvider.weather?.sys?.sunrise??0;
    int sunsetTimestamp= weatherProvider.weather?.sys?.sunrise??0;

  // Convert the timestamp to a DateTime object
    DateTime sunriseDateTime = DateTime.fromMillisecondsSinceEpoch(sunriseTimestamp * 1000);
    DateTime sunsetDateTime = DateTime.fromMillisecondsSinceEpoch(sunsetTimestamp * 1000);

// Format the sunrise time as a string
    String formattedSunrise = DateFormat('Hm').format(sunriseDateTime);
    String formattedSunset = DateFormat('Hm').format(sunsetDateTime);

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Container(
        padding:
            const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(background[weatherProvider.weather?.weather?[0].main??'N/A']??"assets/img/rain.jpg"))),
        child: Stack(
          children: [
            Container(
              height: 60,
              child: Consumer<LocationProvider>(
                  builder: (context, LocationProvider, child) {
              
   
                final locationCity = locationProvider.currentLocationName?.locality ??"Unknown location";
                return Container(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Apptext(
                            data: locationCity,
                            color: Colors.white,
                            size: 16,
                            fw: FontWeight.bold,
                          ),
                          const SizedBox(width: 10),
                          const Apptext(
                            data: "Good Morning",
                            color: Colors.white,
                            size: 14,
                            fw: FontWeight.w600,
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
            ),
            Positioned(
                top: 60,
                left: 20,
                right: 20,
                child: Container(
                    height: 45,
                    child: Row(
                      children:[ Expanded(
                        child: TextFormField(
                          controller:_cityController,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Search by City",
                            fillColor: Colors.white.withOpacity(0.5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  const BorderSide(color: Colors.white, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  const BorderSide(color: Colors.white, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  const BorderSide(color: Colors.white, width: 1.0),
                            ),
                          ),
                          // Other properties like onChanged, validator, etc.
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print(_cityController.text);
                          weatherProvider.fetchWeatherDataByCity(_cityController.text);
                        },
                        icon:const Icon(Icons.search,color: Colors.white,size: 30,),),
                      ]
                    ))),
            Align(
              alignment: const Alignment(0, -0.55),
              child: Image.asset(
                imagePaths[weatherProvider.weather?.weather?[0].main??'N/A']??"assets/img/default.png",
                height: 145,
              ),
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: Container(
                height: 130,
                width: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Apptext(
                      data: "${weatherProvider.weather?.main?.temp?.toStringAsFixed(0)??"N/A"}\u00b0 C",
                      color: Colors.white,
                      fw: FontWeight.bold,
                      size: 32,
                    ),
                    Apptext(
                      data:weatherProvider.weather?.name??"N/A",
                      color: Colors.white,
                      fw: FontWeight.bold,
                      size: 16,
                    ),
                    Apptext(
                      data: weatherProvider.weather?.weather?[0].main??"N/A",
                      color: Colors.white,
                      fw: FontWeight.w600,
                      size: 22,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Apptext(
                      data: DateFormat("hh:mm a").format(DateTime.now()),
                      color: Colors.white,
                      fw: FontWeight.w700,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.9),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: Colors.black.withOpacity(0.5)),
                padding: const EdgeInsets.only(left: 20),
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              tempsymbols[0],
                              height: 80,
                              width: 80,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Apptext(
                                  data: "Temp Max",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                                Apptext(
                                  data: "${weatherProvider.weather?.main?.tempMax?.toStringAsFixed(0)??"N/A"}\u00b0 C",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              tempsymbols[1],
                              height: 70,
                              width: 70,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               const Apptext(
                                  data: "Temp Min",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                                Apptext(
                                  data: "${weatherProvider.weather?.main?.tempMin?.toStringAsFixed(0)??"N/A"}\u00b0 C",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const CustomDivider(
                      thickness: 3,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              tempsymbols[2],
                              height: 70,
                              width: 70,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               const Apptext(
                                  data:"Sunrise",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                                Apptext(
                                  data:formattedSunrise,
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 40,),
                        Row(
                          children: [
                            Image.asset(
                              tempsymbols[3],
                              height: 70,
                              width: 70,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               const Apptext(
                                  data: "Sun Set",
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                                Apptext(
                                  data: formattedSunset,
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
