import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'first_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController? namecontroller = TextEditingController();
  TextEditingController? passwordcontroller = TextEditingController();
  TextEditingController? phoncontroller = TextEditingController();
  TextEditingController? dateofbirthcontroller = TextEditingController();
  TextEditingController? emailcontroller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: namecontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please! Enter Your Name";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Name",
                      labelText: "Enter Your Full Name",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please! Enter Your Password";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Enter Your Password",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: phoncontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please! Enter Your Phon";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Phon Number",
                      labelText: "Enter Your Phon",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: dateofbirthcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please! Enter Your Date of Birth";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Date of Birth",
                      labelText: "Enter Your Date of Birth",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please! Enter Your Email";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Enter Your Email",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) ;
                    FirebaseSignup();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FirstScreen()));
                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "SignUp",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  FirebaseSignup() {
    try {
      FirebaseFirestore.instance.collection("Account").add({
        "Name": namecontroller!.text,
        "password": passwordcontroller!.text,
        "phon": phoncontroller!.text,
        "Dob": dateofbirthcontroller!.text,
        "Email": emailcontroller!.text
      }).then((value) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User Added on cloud firestore"))));
    } catch (e) {
      print(e);
    }
  }
}
