import 'package:bookelu_app/Authentication/Login/login_screen.dart';
import 'package:bookelu_app/Onboarding/onboarding.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bookback.png"),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/bookelu_logo.png"),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset("assets/images/bookelu_text_logo.png", height: 55,),
                   ],
                  ),
                ),
                InkWell(
                  onTap: () {

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen())
                    );

                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: bookDark,
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Text(
                        "Let’s Get Started",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
