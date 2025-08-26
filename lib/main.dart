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
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: const Color.fromARGB(255, 81, 167, 131),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('New Arrival', style: TextStyle(fontSize: 25)),
        ),
        RecommendDrinks(),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Must Try', style: TextStyle(fontSize: 25)),
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
                    transitionDuration: Duration(milliseconds: 50),
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
                                                color: const Color.fromARGB(
                                                  255,
                                                  81,
                                                  167,
                                                  131,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  spacing: 5,
                                                  children: [
                                                    Text(
                                                      myMenu[index]['name'],
                                                      style: TextStyle(
                                                        fontSize: 23,
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
                                              color: const Color.fromARGB(
                                                255,
                                                255,
                                                255,
                                                255,
                                              ),
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
                                                      CrossAxisAlignment.start,
                                                  spacing: 10,
                                                  children: [
                                                    SizedBox(height: 20),
                                                    Text(
                                                      'Description',
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      myMenu[index]['description'],
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54,
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
                                                                    "300ml",
                                                                    style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color:
                                                                          Color.fromARGB(
                                                                            255,
                                                                            81,
                                                                            167,
                                                                            131,
                                                                          ),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                                                      color:
                                                                          Color.fromARGB(
                                                                            255,
                                                                            81,
                                                                            167,
                                                                            131,
                                                                          ),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                                                      color:
                                                                          Color.fromARGB(
                                                                            255,
                                                                            81,
                                                                            167,
                                                                            131,
                                                                          ),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                                        color: Colors.black54,
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
                  color: const Color.fromARGB(255, 255, 252, 252),
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
                                    padding: const EdgeInsets.only(bottom: 10),
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
                          color: const Color.fromARGB(255, 255, 255, 255),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                myMenu[index]['name']!,
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Recommended for you',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: const Color.fromARGB(
                                    255,
                                    148,
                                    146,
                                    146,
                                  ),
                                ),
                              ),
                              Text(
                                myMenu[index]['price'].toString() + '฿',
                                style: TextStyle(fontSize: 24),
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
    );
  }
}

class QuantitySelector extends StatefulWidget {
  final int price;
  final Function(int, int)? onCartUpdate;

  const QuantitySelector({super.key, required this.price, this.onCartUpdate});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              quantity += 1;
              widget.onCartUpdate!(1, widget.price);
              print('quantity: $quantity');
              print('ราคาต่อชิ้น: ${widget.price}');
              print('ราคารวม: ${widget.price * quantity}');

              // Use a logging framework in production if needed
            });
          },
          child: Text('+', style: TextStyle(fontSize: 20, color: Colors.grey)),
        ),

        Center(
          child: Text(
            'x$quantity',
            style: TextStyle(
              fontSize: 15,
              color: const Color.fromARGB(255, 133, 133, 133),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (quantity > 0) {
              setState(() {
                quantity -= 1;
                widget.onCartUpdate!(-1, -widget.price);
                print('quantity: $quantity');
                print('ราคาต่อชิ้น: ${widget.price}');
                print('ราคารวม: ${widget.price * quantity}');
              });
            }
          },
          child: Opacity(
            opacity: quantity > 0 ? 1.0 : 0.3,
            child: Text(
              '-',
              style: TextStyle(fontSize: 30, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

class DrinksCart extends StatefulWidget {
  final int totalQuantity;
  final int totalPrice;
  const DrinksCart({super.key, this.totalQuantity = 0, this.totalPrice = 0});

  @override
  State<DrinksCart> createState() => _DrinksCartState();
}

class _DrinksCartState extends State<DrinksCart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 109, 185, 46),
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        width: double.infinity,

        child: Container(
          child: Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Total ',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Text(
                  '฿ ',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  '${widget.totalPrice}',
                  style: TextStyle(
                    fontSize: 28,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 19,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendDrinks extends StatelessWidget {
  const RecommendDrinks({super.key});
  final List<Map<String, dynamic>> drinks = const [
    {
      'name': 'Iced Cappuccino',
      'color': Color.fromARGB(255, 171, 179, 125),
      'Image':
          'https://www.starbucksathome.com/au/sites/default/files/2022-12/Iced%20Cappuccino%20KV_Long%20Shadow.png',
    },
    {
      'name': 'Iced Coconut Coffee',
      'color': Color.fromARGB(255, 171, 179, 125),
      'Image':
          'https://www.starbucksathome.com/au/sites/default/files/2022-12/Iced%20Coconut%20KV_Short%20Shadow.png',
    },
    {
      'name': 'Iced Mocha',
      'color': Color.fromARGB(255, 171, 179, 125),
      'Image':
          'https://www.starbucksathome.com/au/sites/default/files/2022-12/Iced%20Mocha%20KV_Short%20Shadow.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 250, 253, 255),
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: drinks[index]['color'],
            ),
            margin: EdgeInsets.all(10.0),
            width: 180,

            child: Column(
              children: [
                Image.network(
                  drinks[index]['Image']!,
                  width: 120,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Text(
                  drinks[index]['name']!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
