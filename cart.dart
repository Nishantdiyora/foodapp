import 'package:flutter/material.dart';
import 'package:food_app/third_screen.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context, ThirdScreen());
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    )),
                Center(
                  child: Text(
                    'Cart',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
