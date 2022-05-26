import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hotels/calendartPage.dart';

void main() {
  runApp(const MyApp());
}

Color dgreen = Color(0xFF54D3C2);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HotelsWoop',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchSection(),
            HotelSection(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<StatefulWidget> createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  IconData favIcon = Icons.favorite_outline_rounded;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 25,
        ),
        onPressed: () {},
      ),
      title: const Text('Explore'),
      actions: [
        IconButton(
          icon: Icon(
            favIcon,
          ),
          onPressed: () {
            setState(() {
              if (favIcon == Icons.favorite_outline_rounded) {
                favIcon = Icons.favorite_sharp;
              } else {
                favIcon = Icons.favorite_outline_rounded;
              }
            });
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.place,
          ),
          onPressed: () {},
        ),
      ],
      backgroundColor: dgreen,
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Douala',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      color: const Color(0XFFffffff),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ]),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ], borderRadius: BorderRadius.all(Radius.circular(25))),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TableBasicsExample();
                    }));
                  },
                  child: const Icon(Icons.search),
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      primary: const Color(0XFF54D3C2)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Choose Date'),
                    Text(
                      '26 Jul - 30 Jul',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Number of Rooms'),
                    Text(
                      '1 Room - 2 Adults',
                      style: GoogleFonts.nunito(
                        color: Colors.black54,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class HotelSection extends StatelessWidget {
  final List hotelList = [
    {
      'title': 'Hotel Royal',
      'place': 'Bonanjo, Douala',
      'distance': 2,
      'review': 36,
      'picture': 'assets/images/hotel_1.png',
      'price': '17000',
    },
    {
      'title': 'La Valley',
      'place': 'Akwa, Douala',
      'distance': 2,
      'review': 36,
      'picture': 'assets/images/hotel_2.png',
      'price': '18000',
    },
    {
      'title': 'Djeuga Palace',
      'place': 'Bonanjo, Douala',
      'distance': 2,
      'review': 36,
      'picture': 'assets/images/hotel_3.png',
      'price': '110000',
    },
    {
      'title': 'Cristal Hotel',
      'place': 'Bonanjo, Douala',
      'distance': 2,
      'review': 36,
      'picture': 'assets/images/hotel_4.png',
      'price': '30000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('25 Hotels founds',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 15,
                    )),
                Row(
                  children: [
                    Text('Filter'),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_list_outlined,
                          color: dgreen,
                        ))
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: hotelList.map((hotel) {
              return HotelCard(hotel);
            }).toList(),
          )
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map hotelData;

  HotelCard(this.hotelData);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 4),
            )
          ]),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                image: DecorationImage(
                  image: AssetImage(hotelData['picture']),
                  fit: BoxFit.cover,
                )),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: -15,
                  child: MaterialButton(
                    color: Colors.white,
                    shape: CircleBorder(),
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      size: 20,
                      color: dgreen,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['title'],
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  hotelData['price'] + ' F',
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hotelData['place'],
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.place,
                        color: dgreen,
                        size: 14.0,
                      ),
                      Text(
                        hotelData['distance'].toString() + 'km to city',
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  Text('Per night',
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.grey[600]))
                ],
              )),
          Container(
            margin: EdgeInsets.fromLTRB(13, 4, 10, 0),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_rate,
                      color: dgreen,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: dgreen,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: dgreen,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: dgreen,
                      size: 14,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: dgreen,
                      size: 14,
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Text(
                  hotelData['review'].toString() + ' reviews',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
