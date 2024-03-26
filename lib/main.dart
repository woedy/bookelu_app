import 'package:bookelu_app/Authentication/Registration/password.dart';
import 'package:bookelu_app/HomeScreen/home_screen.dart';
import 'package:bookelu_app/ShopView/Services/service_details.dart';
import 'package:bookelu_app/ShopView/Services/service_details_appointment.dart';
import 'package:bookelu_app/ShopView/Staff/staff_details.dart';
import 'package:bookelu_app/SplashScreen/spalsh_screen.dart';
import 'package:bookelu_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => {runApp(MyApp())});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Hide the keyboard when tapping outside the text field
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bookelu',
        theme: theme(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? api_key = "";
  Future? _user_api;

  @override
  void initState() {
    super.initState();
    _user_api = apiKey();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _user_api,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          return api_key == null ? SplashScreen() : HomeScreen();
          //return ServiceDetails(service_id: 'SER-2342',service_name: "Welo Bello", service_rating: "4.8", shop_location: "Accra", open: true, service_price: "\$ 2,345", service_photo: "null",);

        });
  }

  Future apiKey() async {
    api_key = await getApiPref();
  }
}
