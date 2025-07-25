import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Flutter Demo Home Page')),
        body: Column(children: [DrinkMenu()]),
      ),
    );
  }
}

class DrinkMenu extends StatelessWidget {
  const DrinkMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'ต้องลอง',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),

        Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          height: 150,
          padding: EdgeInsets.fromLTRB(0, 10, 10, 10),

          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: 90,
                          height: 90,
                          color: const Color.fromARGB(255, 81, 167, 131),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Image.asset(
                              'images/drinks/Iced_Macchiato.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child: Container(
                  //เช็คก่อนเดี๋ยวลบ
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Iced Macchiato", style: TextStyle(fontSize: 20)),
                      Text(
                        'Recommended for you',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: const Color.fromARGB(255, 133, 133, 133),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text("฿65", style: TextStyle(fontSize: 24)),
                ),
              ),
            ],
          ),
        ),

        Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          height: 150,
          padding: EdgeInsets.fromLTRB(0, 10, 10, 10),

          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: 90,
                          height: 90,
                          color: const Color.fromARGB(255, 81, 167, 131),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Image.asset(
                              'images/drinks/Refresh_SparklingMint.png',

                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sparkling espresso with mint ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Recommended for you',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: const Color.fromARGB(255, 133, 133, 133),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text("฿75", style: TextStyle(fontSize: 24)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
