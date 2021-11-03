import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          bottom: height / 2.4,
          child: Image.network(
            'https://i.ibb.co/TcYwbGn/kabir-van-wegen-vl-Tihequ9yo-unsplash.jpg',
            height: height,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: height / 2.4,
            width: width,
            color: Color(0xFF2D2C35),
          ),
        ),
        Foreground()
      ],
    );
  }
}

class Foreground extends StatelessWidget {
  const Foreground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    var inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.ibb.co/YRfh7pk/IMG-3130.jpg',
              ),
              backgroundColor: Colors.black26,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: DefaultTextStyle(
              style: GoogleFonts.raleway(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Hello Sahil',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Check the weather by the city',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      border: inputBorder,
                      enabledBorder: inputBorder,
                      focusedBorder: inputBorder,
                      hintText: 'Search city',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      suffixIcon: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 150),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My locations',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        OutlinedButton(
                          child: Icon(Icons.more_horiz),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(width: 1, color: Colors.white),
                            shape: CircleBorder(),
                          ),
                          onPressed: () {},
                        )
                      ]),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var location in locations)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors.black45,
                                  BlendMode.darken,
                                ),
                                child: Image.network(
                                  location.imageUrl,
                                  height: height * 0.35,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    location.text,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(location.timing),
                                  SizedBox(height: 40),
                                  Text(
                                    location.temperature.toString() + '°',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 50),
                                  Text(location.weather),
                                ],
                              )
                            ],
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Location {
  final String text;
  final String timing;
  final int temperature;
  final String weather;
  final String imageUrl;

  Location({
    this.text,
    this.timing,
    this.temperature,
    this.weather,
    this.imageUrl,
  });
}

final locations = [
  Location(
    text: 'Baramulla',
    timing: '10:44 am',
    temperature: 20,
    weather: 'Cloudy',
    imageUrl: 'https://i.ibb.co/j6Z3p0r/36f214092523119fced27e799efa36fb.jpg',
  ),
  Location(
    text: 'Srinagar',
    timing: '10:44 am',
    temperature: 22,
    weather: 'Cloudy',
    imageUrl: 'https://i.ibb.co/Nx2W1fx/f1b4c20ba0458c79d890d321b49ec6db.jpg',
  ),
];
