import 'package:flutter/material.dart';

class RecommendDrinks extends StatelessWidget {
  RecommendDrinks({super.key});
  final List<Map<String, dynamic>> drinks = const [
    {
      'name': 'Iced Cappuccino',
      'color': Color.fromARGB(255, 171, 179, 125),
      'image':
          'https://www.starbucksathome.com/au/sites/default/files/2022-12/Iced%20Cappuccino%20KV_Long%20Shadow.png',
      'price': 120,
      'description': 'A delicious iced cappuccino with a rich coffee flavor.',
      'ingredients': ['Espresso', 'Milk', 'Ice', 'Cocoa Powder'],
      'DrinkTypeOption': 'Iced',
    },
    {
      'name': 'Iced Coconut Coffee',
      'color': Color.fromARGB(255, 171, 179, 125),
      'image':
          'https://www.starbucksathome.com/au/sites/default/files/2022-12/Iced%20Coconut%20KV_Short%20Shadow.png',
      'price': 130,
      'description': 'A refreshing iced coconut coffee with a tropical twist.',
      'ingredients': ['Espresso', 'Coconut Milk', 'Ice'],
      'DrinkTypeOption': 'Iced',
    },
    {
      'name': 'Iced Mocha',
      'color': Color.fromARGB(255, 171, 179, 125),
      'image':
          'https://www.starbucksathome.com/au/sites/default/files/2022-12/Iced%20Mocha%20KV_Short%20Shadow.png',
      'price': 140,
      'description': 'A rich and creamy iced mocha with a hint of chocolate.',
      'ingredients': ['Espresso', 'Milk', 'Ice', 'Chocolate Syrup'],
      'DrinkTypeOption': 'Iced',
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
                                color: Color.fromARGB(255, 171, 179, 125),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            color: Color.fromARGB(
                                              255,
                                              171,
                                              179,
                                              125,
                                            ),
                                            child: Column(
                                              spacing: 5,
                                              children: [
                                                Text(
                                                  drinks[index]['name'],
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  '${drinks[index]['price']}฿',
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
                                              (drinks[index]['image']
                                                      .startsWith('http')
                                                  ? Image.network(
                                                    drinks[index]['image'],
                                                    fit: BoxFit.cover,
                                                    height: 200,
                                                  )
                                                  : Image.asset(
                                                    drinks[index]['image'],
                                                    fit: BoxFit.cover,
                                                    height: 200,
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
                                            padding: const EdgeInsets.fromLTRB(
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
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  drinks[index]['description'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: const Color(
                                                      0x89000000,
                                                    ),
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
                                                                Icons.coffee,
                                                                color:
                                                                    const Color(
                                                                      0xFF51A783,
                                                                    ),
                                                              ),
                                                              SizedBox(
                                                                height: 4,
                                                              ), // เว้นระยะระหว่าง Icon กับ Text
                                                              Text(
                                                                "300ml",
                                                                style: TextStyle(
                                                                  fontSize: 12,
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
                                                                drinks[index]['DrinkTypeOption'] ==
                                                                        'Hot'
                                                                    ? Icons
                                                                        .local_cafe
                                                                    : drinks[index]['DrinkTypeOption'] ==
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
                                                                drinks[index]['DrinkTypeOption'] ==
                                                                        'Hot'
                                                                    ? "Hot"
                                                                    : drinks[index]['DrinkTypeOption'] ==
                                                                        'Iced'
                                                                    ? "Iced"
                                                                    : "Blended",
                                                                style: TextStyle(
                                                                  fontSize: 12,
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
                                                                  fontSize: 12,
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
                                                  'Ingredients: ${drinks[index]['ingredients'].join(', ')}',
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: drinks[index]['color'],
              ),
              margin: EdgeInsets.all(10.0),
              width: 180,

              child: Column(
                children: [
                  Image.network(
                    drinks[index]['image']!,
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
            ),
          );
        },
      ),
    );
  }
}
