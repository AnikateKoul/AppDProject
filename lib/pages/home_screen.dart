import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_in_with_google/pages/navigation_drawer.dart';
import 'package:sign_in_with_google/pages/datashare.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DataShare data;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as DataShare;
    return Scaffold(
      drawer: NavigationDrawerWidget(data: data,),
      appBar: buildAppBar(),
      body: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green.shade500.withOpacity(0.03),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Wrap(
          runSpacing: 14,
          spacing: 7,
          children: const [
            InfoCard(title: 'Weather', num: '21°C\n', iconColor: Colors.blue, iconPath: 'assets/icons/icons8-cloud-64.png', weatherTerm: "Cloudy", gifPath: 'assets/icons/icons8-partly-cloudy-day-unscreen.gif', infoCardColor: Colors.blue,),
            InfoCard(title: 'Rain?', num: '76%\n', iconColor: Colors.yellow, iconPath: 'assets/icons/icons8-umbrella-64.png', weatherTerm: "It's rain!", gifPath: 'assets/icons/icons8-rain-cloud-unscreen.gif', infoCardColor: Colors.yellow,),
            InfoCard(title: 'Wind?', num: '12 km/h\n', iconColor: Colors.pink, iconPath: 'assets/icons/icons8-wind-64.png', weatherTerm: "Hold on!", gifPath: 'assets/icons/icons8-windy-weather-unscreen.gif', infoCardColor: Colors.pink,),
            InfoCard(title: 'Soil?', num: 'Fertile\n', iconColor: Colors.green, iconPath: 'assets/icons/icons8-soil-64.png', weatherTerm: "Grow Something!", gifPath: 'assets/icons/icons8-plant-unscreen.gif', infoCardColor: Colors.green,),
          ],
        ),
      ),
    );
  }
}


  AppBar buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: const Text(
        'AGRI TECH',
        style: TextStyle(
          color: Colors.black,
          letterSpacing: 2.0,
        ),
      ),
      elevation: 0,
      // leading: IconButton(
      //   icon: Image.asset('assets/icons/icons8-menu-48.png'),
      //   onPressed: () {},
      // ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/icons8-customer-48.png'),
        )
      ],
    );
  }


class InfoCard extends StatelessWidget {
  final String title;
  final String num;
  final Color iconColor;
  final String iconPath;
  final String weatherTerm;
  final String gifPath;
  final Color infoCardColor;
  const InfoCard({
    Key? key, required this.title, required this.num, required this.iconColor, required this.iconPath, required this.weatherTerm, required this.gifPath, required this.infoCardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.only(left: 10, top: 10,),
          width: constraints.maxWidth / 2 - 20,
          decoration: BoxDecoration(
            color: infoCardColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        iconPath,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.3,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RichText(
                        text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: num,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text: weatherTerm,
                          style: const TextStyle(
                            fontSize: 12,
                            height: 2,
                            // letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    )),
                  ),
                  Expanded(
                    child: Image.asset(
                        gifPath, width: 60, height: 60,),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
