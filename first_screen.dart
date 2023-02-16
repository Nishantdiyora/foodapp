import 'package:flutter/material.dart';
import 'package:food_app/second_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0Ph95M0MshK34rfqIMkXDUkAw42Lb4zBncuhwzImDNzmBY4KzVqHJSNLqy9CvEKaJAGo&usqp=CAU',
          width: 400,
          height: 1000,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 75),
          child: Column(
            children: [
              Center(
                child: Text("Food go!",
                    style: GoogleFonts.caveat(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Get your favorite food from here",
                style: GoogleFonts.exo2(
                    wordSpacing: 4,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 450,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 500),
          child: Center(
            child: Container(
              height: 85,
              width: 85,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xffFD0807), width: 2)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 500),
            child: Center(
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color(0xffFD0807),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
