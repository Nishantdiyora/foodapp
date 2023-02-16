import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';

class AddIcon extends StatefulWidget {
  const AddIcon({Key? key}) : super(key: key);

  @override
  State<AddIcon> createState() => _AddIconState();
}

class _AddIconState extends State<AddIcon> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  var item = ["Foods", "Drinks", "Snacks", "Sauces"];
  String? selectedvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    radius: 50,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter Name"),
              ),
              SizedBox(
                height: 20,
              ),
              CustomDropdownButton2(
                hint: 'Category',
                buttonWidth: 350,
                buttonHeight: 60,
                dropdownWidth: 100,
                buttonDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black38),
                ),
                dropdownItems: item,
                value: selectedvalue,
                onChanged: (value) {
                  setState(() {
                    selectedvalue = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pricecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter Price"),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
