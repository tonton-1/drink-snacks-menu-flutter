import 'package:flutter/material.dart';
import 'recommend.dart';
import 'drinkcarts.dart';
import 'quantityselector.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

Future<void> saveThemePreference(bool isDarkMode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final result = prefs.setBool('isDarkMode', isDarkMode);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: Colors.white,
  primaryTextTheme: TextTheme(
    bodyLarge: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
    bodyMedium: TextStyle(color: const Color.fromARGB(255, 50, 50, 50)),
    bodySmall: TextStyle(color: const Color.fromARGB(255, 100, 100, 100)),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green,
    titleTextStyle: TextStyle(color: Colors.grey),
  ),

  drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: const Color.fromARGB(255, 54, 54, 54),
  primaryTextTheme: TextTheme(
    bodyLarge: TextStyle(color: const Color.fromARGB(255, 230, 230, 230)),
    bodyMedium: TextStyle(color: const Color.fromARGB(255, 200, 200, 200)),
    bodySmall: TextStyle(color: const Color.fromARGB(255, 160, 160, 160)),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green,
    titleTextStyle: TextStyle(color: Colors.white),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: const Color.fromARGB(255, 54, 54, 54),
  ),
);
bool isDarkMode = false;

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    _loadThemePreference(); //
  }

  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: isDarkMode ? darkTheme : lightTheme,
      home: Scaffold(
        backgroundColor:
            isDarkMode
                ? darkTheme.scaffoldBackgroundColor
                : lightTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(''),
          backgroundColor: const Color.fromARGB(255, 81, 167, 131),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(
                  Icons.bedtime,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                title: SwitchListTile(
                  value: isDarkMode,
                  onChanged: (value) async {
                    setState(() {
                      isDarkMode = value;
                      print(isDarkMode);
                    });
                    await saveThemePreference(isDarkMode);
                  },
                ),
              ),
            ],
          ),
        ),
        body: Column(children: [DrinkMenu()]),
      ),
    );
  }
}

class DrinkMenu extends StatefulWidget {
  const DrinkMenu({super.key});

  @override
  State<DrinkMenu> createState() => _DrinkMenuState();
}

class _DrinkMenuState extends State<DrinkMenu> {
  int totalQuantity = 0;
  int totalPrice = 0;
  void updateCart(int quantity, int price) {
    setState(() {
      totalQuantity += quantity;
      totalPrice += price;
    });
  }

  final List<Map<String, dynamic>> myMenu = const [
    {
      'name': 'Iced Macchiato',
      'color': Color.fromARGB(255, 81, 167, 131),
      'image': 'images/drinks/Iced_Macchiato.png',
      'price': 95,
      'description': 'A refreshing iced coffee drink with a hint of vanilla.',
      'ingredients': ['Espresso', 'Ice', 'Milk', 'Vanilla Syrup'],
      'DrinkTypeOption': 'Iced',
    },
    {
      'name': 'Sparkling espresso',
      'color': Color.fromARGB(255, 81, 167, 131),
      'image': 'images/drinks/Refresh_SparklingMint.png',
      'price': 85,
      'description': 'A fizzy and refreshing drink with a hint of mint.',
      'ingredients': ['Sparkling Water', 'Espresso', 'Mint Syrup'],
      'DrinkTypeOption': 'Iced',
    },
    {
      'name': 'Vanilla Latte',
      'color': Color.fromARGB(255, 81, 167, 131),
      'image':
          'https://www.starbucksathome.com/au/sites/default/files/2021-06/Vanilla%20Latte_LongShadow_Cream_0.png',
      'price': 90,
      'description': 'A creamy and sweet vanilla latte.',
      'ingredients': [
        'Espresso',
        'Steamed Milk',
        'Vanilla Syrup',
        'Whipped Cream',
      ],
      'DrinkTypeOption': 'Hot',
    },
    {
      'name': 'Caffé Americano',
      'color': Color.fromARGB(255, 81, 167, 131),
      'image':
          'https://www.starbucksathome.com/au/sites/default/files/2021-06/3-CaffeAmericano_LongShadow_Cream.png',
      'price': 70,
      'description': 'A rich and bold coffee with hot water.',
      'ingredients': ['Espresso', 'Hot Water'],
      'DrinkTypeOption': 'Hot',
    },
    {
      'name': 'Caffé Mocha',
      'color': Color.fromARGB(255, 81, 167, 131),
      'image':
          'https://www.starbucksathome.com/au/sites/default/files/2021-06/10032021_CafeMocha_LS-min.png',
      'price': 100,
      'description': 'A rich and chocolatey coffee drink.',
      'ingredients': [
        'Espresso',
        'Steamed Milk',
        'Chocolate Syrup',
        'Whipped Cream',
      ],
      'DrinkTypeOption': 'blended',
    },
    {
      'name': 'Spiced Flat White',
      'color': Color.fromARGB(255, 81, 167, 131),
      'image':
          'https://www.starbucksathome.com/au/sites/default/files/2021-06/10032021_SpicedExpresso_LS-min.png',
      'price': 80,
      'description': 'A warm and cozy coffee with a hint of spice.',
      'ingredients': ['Espresso', 'Steamed Milk', 'Cinnamon', 'Nutmeg'],
      'DrinkTypeOption': 'Hot',
    },
    {
      'name': 'Freddo Espresso',
      'color': Color.fromARGB(255, 81, 167, 131),
      'image':
          'https://www.starbucksathome.com/au/sites/default/files/2024-01/Freddo%20Espresso%20KV_Transp_Straw_Contact%20Shadow_0.png',
      'price': 65,
      'description': 'A chilled espresso drink served over ice.',
      'ingredients': ['Espresso', 'Ice'],
      'DrinkTypeOption': 'Iced',
    },
    {
      'name': 'White Chocolate Mocha',
      'color': Color.fromARGB(255, 81, 167, 131),
      'image':
          'https://www.starbucksathome.com/au/sites/default/files/2024-08/Starbucks%20SBU_EvergreenRecipes2023_Website_Recipes_Still_WhiteChocolateMocha_1842x1542_Long%20Shadow.png',
      'price': 110,
      'description': 'A rich and creamy white chocolate mocha.',
      'ingredients': [
        'Espresso',
        'Steamed Milk',
        'White Chocolate Sauce',
        'Whipped Cream',
      ],
      'DrinkTypeOption': 'blended',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          isDarkMode
              ? darkTheme.scaffoldBackgroundColor
              : lightTheme.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'New Arrival',
              style: TextStyle(
                fontSize: 25,
                color:
                    isDarkMode
                        ? darkTheme.primaryTextTheme.bodyLarge?.color
                        : lightTheme.primaryTextTheme.bodyLarge?.color,
              ),
            ),
          ),
          RecommendDrinks(toggleMode: isDarkMode),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Must Try',
              style: TextStyle(
                fontSize: 25,
                color:
                    isDarkMode
                        ? darkTheme.primaryTextTheme.bodyLarge?.color
                        : lightTheme.primaryTextTheme.bodyLarge?.color,
              ),
            ),
          ),

          Container(
            height: 450,
            child: ListView.builder(
              itemCount: myMenu.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: '',
                      transitionBuilder: (_, anim, __, child) {
                        final offset = Tween<Offset>(
                          begin: const Offset(0, 1), // เริ่มจากล่างจอ
                          end: Offset.zero,
                        ).animate(anim);
                        return SlideTransition(position: offset, child: child);
                      },

                      pageBuilder: (context, animation1, animation2) {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: Material(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: Stack(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Color.fromARGB(255, 81, 167, 131),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  color: Color.fromARGB(
                                                    255,
                                                    81,
                                                    167,
                                                    131,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    spacing: 5,
                                                    children: [
                                                      Text(
                                                        myMenu[index]['name'],
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${myMenu[index]['price']}฿',
                                                        style: TextStyle(
                                                          fontSize: 35,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    (myMenu[index]['image']
                                                            .startsWith('http')
                                                        ? Image.network(
                                                          myMenu[index]['image'],
                                                          fit: BoxFit.cover,
                                                          height: 220,
                                                        )
                                                        : Image.asset(
                                                          myMenu[index]['image'],
                                                          fit: BoxFit.cover,
                                                          height: 220,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30),
                                              ),
                                              child: Container(
                                                height: 300,
                                                width: double.infinity,
                                                color:
                                                    isDarkMode
                                                        ? darkTheme
                                                            .scaffoldBackgroundColor
                                                        : lightTheme
                                                            .scaffoldBackgroundColor,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                        30.0,
                                                        10.0,
                                                        10.0,
                                                        10.0,
                                                      ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    spacing: 10,
                                                    children: [
                                                      SizedBox(height: 20),
                                                      Text(
                                                        'Description',
                                                        style: TextStyle(
                                                          color:
                                                              isDarkMode
                                                                  ? darkTheme
                                                                      .primaryTextTheme
                                                                      .bodyLarge
                                                                      ?.color
                                                                  : lightTheme
                                                                      .primaryTextTheme
                                                                      .bodyLarge
                                                                      ?.color,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        myMenu[index]['description'],
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              isDarkMode
                                                                  ? darkTheme
                                                                      .primaryTextTheme
                                                                      .bodyLarge
                                                                      ?.color
                                                                  : lightTheme
                                                                      .primaryTextTheme
                                                                      .bodySmall
                                                                      ?.color,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  10.0,
                                                                ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    10.0,
                                                                  ),
                                                              child: Container(
                                                                color:
                                                                    const Color.fromARGB(
                                                                      76,
                                                                      81,
                                                                      167,
                                                                      131,
                                                                    ),
                                                                width: 70,
                                                                height: 70,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .coffee,
                                                                      color: const Color(
                                                                        0xFF51A783,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 4,
                                                                    ), // เว้นระยะระหว่าง Icon กับ Text
                                                                    Text(
                                                                      "300ml",
                                                                      style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Color.fromARGB(
                                                                          255,
                                                                          81,
                                                                          167,
                                                                          131,
                                                                        ),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  10.0,
                                                                ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    10.0,
                                                                  ),
                                                              child: Container(
                                                                color:
                                                                    const Color.fromARGB(
                                                                      76,
                                                                      81,
                                                                      167,
                                                                      131,
                                                                    ),
                                                                width: 70,
                                                                height: 70,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      myMenu[index]['DrinkTypeOption'] ==
                                                                              'Hot'
                                                                          ? Icons
                                                                              .local_cafe
                                                                          : myMenu[index]['DrinkTypeOption'] ==
                                                                              'Iced'
                                                                          ? Icons
                                                                              .ac_unit
                                                                          : Icons
                                                                              .local_drink,
                                                                      color:
                                                                          const Color.fromARGB(
                                                                            255,
                                                                            81,
                                                                            167,
                                                                            131,
                                                                          ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 4,
                                                                    ), // เว้นระยะระหว่าง Icon กับ Text
                                                                    Text(
                                                                      myMenu[index]['DrinkTypeOption'] ==
                                                                              'Hot'
                                                                          ? "Hot"
                                                                          : myMenu[index]['DrinkTypeOption'] ==
                                                                              'Iced'
                                                                          ? "Iced"
                                                                          : "Blended",
                                                                      style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Color.fromARGB(
                                                                          255,
                                                                          81,
                                                                          167,
                                                                          131,
                                                                        ),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  10.0,
                                                                ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    10.0,
                                                                  ),
                                                              child: Container(
                                                                color:
                                                                    const Color.fromARGB(
                                                                      76,
                                                                      81,
                                                                      167,
                                                                      131,
                                                                    ),
                                                                width: 70,
                                                                height: 70,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .do_not_disturb_alt,
                                                                      color:
                                                                          const Color.fromARGB(
                                                                            255,
                                                                            81,
                                                                            167,
                                                                            131,
                                                                          ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 4,
                                                                    ), // เว้นระยะระหว่าง Icon กับ Text
                                                                    Text(
                                                                      "No sugar",
                                                                      style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Color.fromARGB(
                                                                          255,
                                                                          81,
                                                                          167,
                                                                          131,
                                                                        ),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        'Ingredients: ${myMenu[index]['ingredients'].join(', ')}',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              isDarkMode
                                                                  ? darkTheme
                                                                      .primaryTextTheme
                                                                      .bodyLarge
                                                                      ?.color
                                                                  : lightTheme
                                                                      .primaryTextTheme
                                                                      .bodySmall
                                                                      ?.color,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    //must try items
                    color:
                        isDarkMode
                            ? darkTheme.scaffoldBackgroundColor
                            : lightTheme.scaffoldBackgroundColor,
                    height: 150,
                    padding: EdgeInsets.fromLTRB(0, 5, 10, 10),

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
                                    color: myMenu[index]['color'],
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10,
                                      ),
                                      child:
                                          (myMenu[index]['image'].startsWith(
                                                'http',
                                              )
                                              ? Image.network(
                                                myMenu[index]['image'],
                                                fit: BoxFit.cover,
                                              )
                                              : Image.asset(
                                                myMenu[index]['image'],
                                                fit: BoxFit.cover,
                                              )),
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
                            color:
                                isDarkMode
                                    ? darkTheme.scaffoldBackgroundColor
                                    : lightTheme.scaffoldBackgroundColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  myMenu[index]['name']!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        isDarkMode
                                            ? darkTheme
                                                .primaryTextTheme
                                                .bodyLarge!
                                                .color
                                            : lightTheme
                                                .primaryTextTheme
                                                .bodyLarge!
                                                .color,
                                  ),
                                ),
                                Text(
                                  'Recommended for you',
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    color:
                                        isDarkMode
                                            ? darkTheme
                                                .primaryTextTheme
                                                .bodyMedium!
                                                .color
                                            : lightTheme
                                                .primaryTextTheme
                                                .bodySmall!
                                                .color,
                                  ),
                                ),
                                Text(
                                  myMenu[index]['price'].toString() + '฿',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color:
                                        isDarkMode
                                            ? darkTheme
                                                .primaryTextTheme
                                                .bodyMedium!
                                                .color
                                            : lightTheme
                                                .primaryTextTheme
                                                .bodyMedium!
                                                .color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: QuantitySelector(
                            price: myMenu[index]['price'],
                            onCartUpdate: updateCart,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          DrinksCart(totalQuantity: totalQuantity, totalPrice: totalPrice),
        ],
      ),
    );
  }
}
