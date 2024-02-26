import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

const bookPrimary = Color(0xffC9C4BE);
const bookDark = Color(0xff2E2826);
const bookDark2 = Color(0xff8E8E8E);
const bookBlack = Color(0xff000000);
const bookWhite = Color(0xffF8F7FC);

const bodyText1 = Color(0xffffffff);
const bodyText2 = Color(0xffffffff);
const clay = Color(0xffa499b3);


//const hostName = "http://143.42.21.193:4040/api/";
//const hostNameMedia = "http://143.42.21.193:4040";

//const hostName = "http://192.168.43.235:4040/api/";
//const hostNameMedia = "http://192.168.43.235:4040";


const hostName = "http://192.168.43.223:8000/api/";
const hostNameMedia = "http://192.168.43.223:8000";


Future<String?> getApiPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("API_Key");
}



Future<String?> getUserIDPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("USER_ID");
}









class PasteTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow pasting of text by returning the new value unchanged
    return newValue;
  }
}




