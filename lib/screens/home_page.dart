import 'package:flutter/material.dart';
import 'package:weather_app/data/image_path.dart';
import 'package:weather_app/units/apptext.dart';
import 'package:weather_app/units/customdevide.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Container(
        padding:const EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(background[0]))
        ),
        child: Stack(
          children: [
            Container(
              height: 60,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child:const Row(
                      children: [
                        Icon(Icons.location_pin,color: Colors.red,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Apptext(data: "Eranakulam",color: Colors.white,size: 10,fw: FontWeight.bold,),
                           SizedBox(width: 10),
                           Apptext(data: "Good Morning",color: Colors.white,size: 14,fw: FontWeight.w400,)
                          ],
                        )
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon:const Icon(Icons.search,size: 32,color: Colors.white,))
                ],
              ),
            ),
            Positioned(
              top: 60,
              left: 20,
              right: 20,
              child:Container(
                height: 45,
                child: TextFormField(
  decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white.withOpacity(0.5),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide:const BorderSide(color: Colors.white, width: 1.0), 
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0), 
      borderSide:const BorderSide(color: Colors.white, width: 1.0), 
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0), 
      borderSide:const BorderSide(color: Colors.white, width: 1.0), 
    ),
  ),
  // Other properties like onChanged, validator, etc.
)

              )
            ),
            Align(
              alignment:const Alignment(0,-0.55),
              child: Image.asset(imagePaths[0],height: 180,),

            ),
            Align(
              alignment:const Alignment(0, 0),
              child: Container(
                height: 130,
                width: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10,),
                    const Apptext(data:"21 C",color: Colors.white,fw: FontWeight.bold,size: 32,),
                    const Apptext(data:"Snow",color: Colors.white,fw: FontWeight.w600,size: 26,),
                    const SizedBox(height: 20,),
                    Apptext(data:DateTime.now().toString(),color: Colors.white,fw: FontWeight.w500,)
                  ],
                ),
              ),
            ),
            Align(
              alignment:const Alignment(0.0, 0.9),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: Colors.black.withOpacity(0.5)
                ),
                padding:const EdgeInsets.only(left: 20),
              height: 180,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Row(
              children: [
                Image.asset(tempsymbols[0], height: 80, width:80,),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Apptext(data: "Max temp", color: Colors.white, size: 14, fw: FontWeight.w600,),
                    Apptext(data: "21 C", color: Colors.white, size: 14, fw: FontWeight.w600,),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(tempsymbols[1], height: 70, width: 70,),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Apptext(data: "Low temp", color: Colors.white, size: 14, fw: FontWeight.w600,),
                    Apptext(data: "21 C", color: Colors.white, size: 14, fw: FontWeight.w600,),
                  ],
                ),
              ],
            ),
          ],
        ),
        const CustomDivider(thickness: 3,color: Colors.white,),
        Row(
          children: [
            Row(
              children: [
                Image.asset(tempsymbols[2], height: 70, width:70,),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Apptext(data: "Sun Rise", color: Colors.white, size: 14, fw: FontWeight.w600,),
                    Apptext(data: "21 C", color: Colors.white, size: 14, fw: FontWeight.w600,),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(tempsymbols[3], height: 70, width: 70,),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Apptext(data: "Sun Set", color: Colors.white, size: 14, fw: FontWeight.w600,),
                    Apptext(data: "21 C", color: Colors.white, size: 14, fw: FontWeight.w600,),
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