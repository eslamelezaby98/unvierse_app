import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:universe_ui_app/data/dummy_data/planet_dummy_data.dart';
import 'package:universe_ui_app/data/model/planet_info.dart';
import 'package:universe_ui_app/helper/route_manager.dart';

import '../../helper/constants_manager.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      bottomNavigationBar: const CustomNavBottom(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              gradientStartColor,
              gradientEndColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.7],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! header
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const Text(
                      'Explore',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton<String>(
                      items: const [
                        DropdownMenuItem(
                          child: Text(
                            'Solar System',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 24,
                              color: Color(0x7cdbf1ff),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Image.asset('assets/drop_down_icon.png'),
                      ),
                      underline: const SizedBox(),
                    ),
                  ],
                ),
              ),

              //! swiper cards
              Container(
                height: 500,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: const SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          RouteManager.plantScreen,
                          arguments: planets[index],
                        );
                      },
                      child: Stack(
                        children: [
                          PlanetNameWidget(
                            planets: planets[index],
                          ),
                          Hero(
                            tag: planets[index].position,
                            child: Image.asset(planets[index].iconImage),
                          ),
                          Positioned(
                            right: 24,
                            bottom: 60,
                            child: Text(
                              planets[index].position.toString(),
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 200,
                                color: primaryTextColor.withOpacity(0.08),
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanetNameWidget extends StatelessWidget {
  const PlanetNameWidget({
    Key? key,
    required this.planets,
  }) : super(key: key);
  final PlanetInfo planets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Card(
          color: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Text(
                  planets.name,
                  style: const TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 44,
                    color: Color(0xff47455f),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Solar System',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 23,
                    color: primaryTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Text(
                      'Know more',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 18,
                        color: secondaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: secondaryTextColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomNavBottom extends StatelessWidget {
  const CustomNavBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(36.0),
        ),
        color: navigationColor,
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Image.asset('assets/menu_icon.png'),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/search_icon.png'),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/profile_icon.png'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
