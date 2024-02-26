import 'dart:convert';

import 'package:bookelu_app/Authentication/Login/login_screen.dart';
import 'package:bookelu_app/Bookings/user_bookings.dart';
import 'package:bookelu_app/Profile/edit_profile.dart';
import 'package:bookelu_app/ShopView/shops_screen.dart';
import 'package:bookelu_app/HomeScreen/home_screen.dart';
import 'package:bookelu_app/Message/chat_screen.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    // Retrieve data from SharedPreferences
    getUserData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                                    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 215.0,
                        height: 215.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: bookDark2, // First stroke color
                            width: 10.0, // First stroke width
                          ),

                        ),
                        child: Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: bookPrimary, // First stroke color
                              width: 10.0, // First stroke width
                            ),

                          ),
                          child: ClipOval(
                            child: Image.network(
                              hostNameMedia + userData['photo'].toString(),
                              width: 130.0,
                              height: 130.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10
                      ),
                      Text(
                        userData['full_name'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Fontspring"),
                      ),
                      Text(
                        "130",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Bookings Made",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                 Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => EditProfile(userData: userData))
                                                  );
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                //margin: EdgeInsets.all(10),
                                height: 59,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: bookPrimary.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    "Edit Profile",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                clearApiKey();

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                  (route) => false,
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                //margin: EdgeInsets.all(10),
                                height: 59,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: bookPrimary,
                                    borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    "Log out",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        AssetImage("assets/images/shop_g.png"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Beauty Oasis",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Fontspring"),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Container(
                                          width: 120,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                              child: Text(
                                            "\$70.00",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ))),
                                    ],
                                  ),
                                ],
                              ),
                              Text("23rd March 2022",
                                  style: TextStyle(
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Hair Re Touch",
                              style: TextStyle(
                                fontSize: 14,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 150,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: bookPrimary.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    "7 : 00 am",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ))),
                              Icon(Icons.arrow_forward_rounded),
                              Container(
                                  width: 150,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: bookPrimary.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    "7 : 50 am",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ))),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Divider(),
                        ],
                      ),
                    ],
                                    ),
                                  ),
                  )),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => HomeScreen()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/icons/home.png",
                            height: 25,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => UserBookings()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/icons/card.png",
                            height: 25,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AllShopsScreen()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/icons/add.png",
                            height: 40,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => ChatScreen()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/icons/message.png",
                            height: 25,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserProfile()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/icons/person.png",
                            height: 25,
                            color: bookPrimary,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> clearApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("API_Key");
    await prefs.remove("user_data");
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataString = prefs.getString('user_data') ?? '';
    setState(() {
      userData = json.decode(userDataString);
    });
  }
}
