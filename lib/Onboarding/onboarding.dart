
import 'package:bookelu_app/Authentication/Login/login_screen.dart';
import 'package:bookelu_app/Authentication/Registration/registration_1.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingSCREENState();
}

class _OnboardingSCREENState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          //margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Image.asset("assets/images/bookelu_text_logo.png",),
                          SizedBox(
                            height: 30,
                          ),
                          Text("Welcome to Bookelu", style: TextStyle(fontSize: 60, fontFamily: "Fontspring", height: 1),),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text("Let's get started.", style: TextStyle(fontSize: 32,),),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset("assets/images/arrow-side-up.png", height: 40,),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                        child:  Stack(
                          children: [
                            Container(
                             // width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/chick.png",),
                                      fit: BoxFit.contain,
                                  )
                              ),
                            ),

                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {

                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => Registration1())
                                      );

                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                      height: 59,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: bookPrimary,
                                          borderRadius: BorderRadius.circular(7)),
                                      child: Center(
                                        child: Text(
                                          "Begin Registration",
                                          style: TextStyle(color: bookDark),
                                        ),
                                      ),
                                    ),
                                  ),
                              /*    InkWell(
                                    onTap: () {

                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => LoginScreen())
                                      );

                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      height: 59,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: bookDark,
                                          borderRadius: BorderRadius.circular(7)),
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                          ],
                        ),),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
