import 'package:flutter/material.dart';
import 'package:food_app/bottom_bar.dart';
import 'package:food_app/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabcontroller;
  PageController? pagecontroller = PageController(initialPage: 0);
  @override
  void initState() {
    tabcontroller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                child: Container(
                  height: 500,
                  width: 400,
                  color: Color(0xffEBEBEB),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.menu,
                            size: 25,
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxhFJtXrm3RGpElraGPqYDTam5LYSrvVw0Gw&usqp=CAU"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Let's Find",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Something Delicious!",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 45,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                size: 20,
                                color: Color(0xffCECECE),
                              ),
                              suffixIcon: Icon(
                                Icons.tune,
                                size: 20,
                                color: Color(0xffCECECE),
                              ),
                              hintText: ' Search Categories..',
                              hintStyle: TextStyle(
                                  fontSize: 15, color: Color(0xffD9D9D9)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TabBar(
                      onTap: (value) {
                        pagecontroller!.jumpToPage(value);
                      },
                      labelColor: Color(0xffFD0807),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Color(0xffFD0807),
                      controller: tabcontroller,
                      unselectedLabelColor: Color(0xffBABABC),
                      indicatorWeight: 2,
                      tabs: const [
                        Tab(
                          text: 'Foods',
                        ),
                        Tab(
                          text: 'Drinks',
                        ),
                        Tab(
                          text: 'Snacks',
                        ),
                        Tab(
                          text: 'Sauce',
                        ),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     Expanded(
                    //       child: TabBarView(
                    //         children: [
                    //           FoodPage(),
                    //           DrinkPage(),
                    //           SnackPage(),
                    //           SaucePage(),
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xffFD0807),
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                              ),
                            ))
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      height: 350,

                      // color: Colors.blue,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: FoodList.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(4, 4),
                                          blurRadius: 10,
                                          spreadRadius: 2.0,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Text(
                                          FoodList[index].name ?? "",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 40),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "\$30.00",
                                          style: TextStyle(
                                              color: Color(0xffFD0807),
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ThirdScreen()));
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: CircleAvatar(
                                        radius: 70,
                                        backgroundImage: NetworkImage(
                                            FoodList[index].image!),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 25,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Bottombar(),
      ),
    );
  }
}

// class FoodPage extends StatefulWidget {
//   const FoodPage({Key? key}) : super(key: key);
//
//   @override
//   State<FoodPage> createState() => _FoodPageState();
// }
//
// class _FoodPageState extends State<FoodPage> {
//   @override
//   Widget build(BuildContext context) {
//     return;
//   }
// }

// class DrinkPage extends StatefulWidget {
//   const DrinkPage({Key? key}) : super(key: key);
//
//   @override
//   State<DrinkPage> createState() => _DrinkPageState();
// }
//
// class _DrinkPageState extends State<DrinkPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 20),
//       height: 350,
//
//       // color: Colors.blue,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: DrinkList.length,
//         itemBuilder: (context, index) {
//           return Stack(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     height: 250,
//                     width: 200,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           offset: Offset(4, 4),
//                           blurRadius: 10,
//                           spreadRadius: 2.0,
//                         )
//                       ],
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Text(
//                           DrinkList[index].name ?? "",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 40),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           DrinkList[index].price!,
//                           style:
//                               TextStyle(color: Color(0xffFD0807), fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               GestureDetector(
//                 onTap: () {
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => ThirdScreen()));
//                 },
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 30),
//                       child: CircleAvatar(
//                         radius: 70,
//                         backgroundImage: NetworkImage(DrinkList[index].image!),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//         separatorBuilder: (context, index) {
//           return SizedBox(
//             width: 25,
//           );
//         },
//       ),
//     );
//   }
// }
//
// class SnackPage extends StatefulWidget {
//   const SnackPage({Key? key}) : super(key: key);
//
//   @override
//   State<SnackPage> createState() => _SnackPageState();
// }
//
// class _SnackPageState extends State<SnackPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 20),
//       height: 350,
//
//       // color: Colors.blue,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: SnackList.length,
//         itemBuilder: (context, index) {
//           return Stack(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     height: 250,
//                     width: 200,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           offset: Offset(4, 4),
//                           blurRadius: 10,
//                           spreadRadius: 2.0,
//                         )
//                       ],
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Text(
//                           SnackList[index].name ?? "",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 40),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           SnackList[index].price!,
//                           style:
//                               TextStyle(color: Color(0xffFD0807), fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               GestureDetector(
//                 onTap: () {
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => ThirdScreen()));
//                 },
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 30),
//                       child: CircleAvatar(
//                         radius: 70,
//                         backgroundImage: NetworkImage(SnackList[index].image!),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//         separatorBuilder: (context, index) {
//           return SizedBox(
//             width: 25,
//           );
//         },
//       ),
//     );
//   }
// }
//
// class SaucePage extends StatefulWidget {
//   const SaucePage({Key? key}) : super(key: key);
//
//   @override
//   State<SaucePage> createState() => _SaucePageState();
// }
//
// class _SaucePageState extends State<SaucePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 20),
//       height: 350,
//
//       // color: Colors.blue,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: SauceList.length,
//         itemBuilder: (context, index) {
//           return Stack(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     height: 250,
//                     width: 200,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           offset: Offset(4, 4),
//                           blurRadius: 10,
//                           spreadRadius: 2.0,
//                         )
//                       ],
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Text(
//                           SauceList[index].name ?? "",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 40),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           SauceList[index].price!,
//                           style:
//                               TextStyle(color: Color(0xffFD0807), fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               GestureDetector(
//                 onTap: () {
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => ThirdScreen()));
//                 },
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 30),
//                       child: CircleAvatar(
//                         radius: 70,
//                         backgroundImage: NetworkImage(SauceList[index].image!),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//         separatorBuilder: (context, index) {
//           return SizedBox(
//             width: 25,
//           );
//         },
//       ),
//     );
//   }
// }

class FoodModel {
  String? image;
  String? name;
  String? price;
  FoodModel({this.image, this.name, this.price});
}

List<FoodModel> FoodList = [
  FoodModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT27CKHNsaXf8W42b6XDFYKzJ6kKPZHRjPOSg&usqp=CAU",
      name: "Italian Pasta",
      price: "\$30"),
  FoodModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgit7QNzbYin0IdnegnpFjsaQ84G3Ra96zNrWl8kmZ-DJWiGJaSrmo02t7eiAECSbP7Yk&usqp=CAU",
      name: "Baked falafel",
      price: "\$45"),
  FoodModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTzgnXQYkFxZhpHIbeVkOewwB1OSzCPgtkkQ&usqp=CAU",
      name: "White pasta",
      price: "\$80"),
  FoodModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2UZyjKQizwU_ots5dzXhodOeRcDyHuVj-cg&usqp=CAU",
      name: "Pasta",
      price: "\$50"),
  FoodModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxBrlZikS3ovfmu9Nv4GIZvtN6v5AWwH_6RA&usqp=CAU",
      name: "Noodle",
      price: "\$40"),
];

// class DrinkModel {
//   String? image;
//   String? name;
//   String? price;
//   DrinkModel({this.image, this.name, this.price});
// }
//
// List<DrinkModel> DrinkList = [
//   DrinkModel(
//       image:
//           "https://images.immediate.co.uk/production/volatile/sites/30/2013/05/Singapore-sling-7ddad3e.jpg?quality=90&resize=556,505",
//       name: "Cocktail",
//       price: "\$25"),
//   DrinkModel(
//       image:
//           "https://images.immediate.co.uk/production/volatile/sites/30/2020/04/mocktail-3b9ab7d.jpg",
//       name: "Mocktail",
//       price: "\$30"),
//   DrinkModel(
//       image: "https://m.media-amazon.com/images/I/61I1Xf162WS._SL1500_.jpg",
//       name: "Frappuccino",
//       price: "\$99"),
//   DrinkModel(
//       image:
//           "https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Smirnoff_Red_Label_8213.jpg/1200px-Smirnoff_Red_Label_8213.jpg",
//       name: "Vodaka",
//       price: "\$39"),
//   DrinkModel(
//       image: "https://m.media-amazon.com/images/I/61DwjIi-mbL._SX522_.jpg",
//       name: "Pepsi",
//       price: "\$69"),
// ];
//
// class SanckModel {
//   String? image;
//   String? name;
//   String? price;
//   SanckModel({this.image, this.name, this.price});
// }
//
// List<SanckModel> SnackList = [
//   SanckModel(
//       image:
//           "https://bhavnasfoodjourneys.files.wordpress.com/2020/10/chakri-e1604191947902.jpg",
//       name: "Chakri",
//       price: "\$25"),
//   SanckModel(
//       image:
//           "https://thumbs.dreamstime.com/b/indian-traditional-dessert-bhakarwadi-isolated-white-bhakharwadi-105494938.jpg",
//       name: "Bhakherwadi",
//       price: "\$30"),
//   SanckModel(
//       image:
//           "https://static.toiimg.com/thumb/83740315.cms?imgsize=361903&width=800&height=800",
//       name: "Sandwich",
//       price: "\$99"),
//   SanckModel(
//       image:
//           "https://www.sipandfeast.com/wp-content/uploads/2022/07/garlic-bread-recipe-snippet.jpg",
//       name: "Garlic Bread",
//       price: "\$39"),
//   SanckModel(
//       image:
//           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTV6j0aX15h9tGY61oX63qBVnXPTXiPMxn0MJCwRqAvan84WMxLNk_KyfebmPN85bkxN8&usqp=CAU",
//       name: "Toast",
//       price: "\$69"),
// ];
//
// class SauceModel {
//   String? image;
//   String? name;
//   String? price;
//   SauceModel({this.image, this.name, this.price});
// }
//
// List<SauceModel> SauceList = [
//   SauceModel(
//       image:
//           "https://www.jiomart.com/images/product/600x600/491696519/hellmann-s-real-mayonnaise-250-g-product-images-o491696519-p590126508-0-202301231306.jpg",
//       name: "Mayonnaise",
//       price: "\$30"),
//   SauceModel(
//       image: "https://m.media-amazon.com/images/I/61Ru9+U4X7L._SY606_.jpg",
//       name: "Tanduri sauce",
//       price: "\$45"),
//   SauceModel(
//       image:
//           "https://5.imimg.com/data5/SJ/OG/MY-7435813/red-chilli-sauce-chings-500x500.jpg",
//       name: "Red chili sauce",
//       price: "\$80"),
//   SauceModel(
//       image:
//           "https://5.imimg.com/data5/SELLER/Default/2020/8/VY/AZ/IY/43007222/soya-sauce-500x500.JPG",
//       name: "Soya souce",
//       price: "\$50"),
//   SauceModel(
//       image:
//           "https://www.jiomart.com/images/product/600x600/491696519/hellmann-s-real-mayonnaise-250-g-product-images-o491696519-p590126508-0-202301231306.jpg",
//       name: "Mayonnaise",
//       price: "\$40"),
// ];
