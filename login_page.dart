import 'package:flutter/material.dart';
import 'package:food_app/signup_page.dart';

import 'first_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailcontroller = TextEditingController();
  TextEditingController? passwordcontroller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          width: 400,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://previews.123rf.com/images/foontntd/foontntd1705/foontntd170500070/77824901-menu-food-drawing-graphic-design-illustrate-objects-template-.jpg"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please! enter your email";
                        }
                      },
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please! enter your password";
                        }
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        hintText: 'Enter your Password',
                        labelText: "Password",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate()) ;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => FirstScreen()));
                    },
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Text("Login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Row(
                      children: [
                        Center(
                            child: Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 17),
                        )),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignupPage()));
                            },
                            child: Text(
                              "Signup",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ))
                      ],
                    ),
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
