import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/second_screen.dart';

import 'cart.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int numOfItems = 1;
  bool _isFavorited = true;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Color(0xff213139),
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context, SecondScreen());
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Color(0xffADB3B6),
                                size: 20,
                              ),
                            ),
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(0),
                            alignment: Alignment.center,
                            icon: (_isFavorited
                                ? const Icon(
                                    Icons.favorite_outlined,
                                    size: 35,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                    size: 35,
                                  )),
                            color: Color(0xffFD0807),
                            // onPressed: () {},
                            onPressed: _toggleFavorite,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Italian Pasta",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "With an oven rack in the middle position, preheat oven to 375 degrees Fahrenhet Pour cup of the olive oil into a large, rimmed baking sheet and tum until the pan is evenly coated",
                      style: TextStyle(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 270),
                      child: Text(
                        "\$30",
                        style:
                            TextStyle(fontSize: 45, color: Color(0xffFD0807)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 320),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50)),
                        child: Container(
                          height: 430,
                          width: 400,
                          color: Color(0xffEBEBEB),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 225),
                        child: Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT27CKHNsaXf8W42b6XDFYKzJ6kKPZHRjPOSg&usqp=CAU"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 180),
                        child: Container(
                          height: 110,
                          width: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(4, 4),
                                blurRadius: 10,
                                spreadRadius: 2.0,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      numOfItems++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 23,
                                  )),
                              Text(
                                numOfItems.toString().padLeft(1, ""),
                                style: TextStyle(fontSize: 12),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (numOfItems > 1) {
                                      setState(() {
                                        numOfItems--;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    size: 23,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        color: Color(0xffFD0807),
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Tomato",
                        style: TextStyle(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.fiber_manual_record,
                        color: Color(0xffFD0807),
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Raw and onion",
                        style: TextStyle(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.fiber_manual_record,
                        color: Color(0xffFD0807),
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Fish",
                        style: TextStyle(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.fiber_manual_record,
                        color: Color(0xffFD0807),
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Pitted",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Add Ext'ra Topping",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected1 = !isSelected1;
                          });
                        },
                        child: isSelected1
                            ? custom_category(text: "Paper")
                            : Container(
                                height: 32,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Color(0xffFD0807)),
                                ),
                                child: Center(
                                  child: Text('Paper',
                                      style: TextStyle(
                                        color: Color(0xffFD0807),
                                      )),
                                ),
                              ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected2 = !isSelected2;
                            });
                          },
                          child: isSelected2
                              ? custom_category(text: "Salt")
                              : Container(
                                  height: 32,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border:
                                        Border.all(color: Color(0xffFD0807)),
                                  ),
                                  child: Center(
                                    child: Text('Salt',
                                        style: TextStyle(
                                          color: Color(0xffFD0807),
                                        )),
                                  ),
                                )),
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected3 = !isSelected3;
                            });
                          },
                          child: isSelected3
                              ? custom_category(text: "Souce")
                              : Container(
                                  height: 32,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border:
                                        Border.all(color: Color(0xffFD0807)),
                                  ),
                                  child: Center(
                                    child: Text('Souce',
                                        style: TextStyle(
                                          color: Color(0xffFD0807),
                                        )),
                                  ),
                                )),
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected4 = !isSelected4;
                            });
                          },
                          child: isSelected4
                              ? custom_category(text: "Tomato")
                              : Container(
                                  height: 32,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border:
                                        Border.all(color: Color(0xffFD0807)),
                                  ),
                                  child: Center(
                                    child: Text('Tomato',
                                        style: TextStyle(
                                          color: Color(0xffFD0807),
                                        )),
                                  ),
                                )),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        ignoreGestures: true,
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemSize: 20,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color(0xffF7BE3B),
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 90),
                        child: Text(
                          "5.0",
                          style: TextStyle(color: Color(0xff7D868B)),
                        ),
                      ),
                      Icon(
                        Icons.access_time_rounded,
                        color: Color(0xff7D868B),
                      ),
                      Text(
                        "10-15 mins",
                        style: TextStyle(color: Color(0xff7D868B)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      height: 55,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color(0xffFD0807),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cart()));
                          },
                          child: Text(
                            "Add to cart",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container custom_category({required String text}) {
    return Container(
      height: 32,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Color(0xffFD0807)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
