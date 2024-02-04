import 'dart:convert';

import 'package:bookelu_app/Authentication/Login/models/sign_in_model.dart';
import 'package:bookelu_app/Authentication/Password/forgot_password.dart';
import 'package:bookelu_app/Components/generic_error_dialog_box.dart';
import 'package:bookelu_app/Components/generic_loading_dialogbox.dart';
import 'package:bookelu_app/Components/generic_success_dialog_box.dart';
import 'package:bookelu_app/Components/keyboard_utils.dart';
import 'package:bookelu_app/HomeScreen/home_screen.dart';
import 'package:bookelu_app/Onboarding/onboarding.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



Future<SignInModel> signInUser(String email, String password) async {

  final response = await http.post(
    Uri.parse(hostName + "accounts/login-user/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode({
      "email": email,
      "password": password,
      "fcm_token": "dsfsdfdsfsdfds",
    }),
  );


  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    final result = json.decode(response.body);
    if (result != null) {
      print(result['data']['token'].toString());
      await saveIDApiKey(result['data']['token'].toString());



      await saveUserData(result['data']);




    }
    return SignInModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return SignInModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return SignInModel.fromJson(jsonDecode(response.body));
  }   else if (response.statusCode == 400) {
    print(jsonDecode(response.body));
    return SignInModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to Sign In');
  }
}

Future<bool> saveIDApiKey(String apiKey) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("API_Key", apiKey);
  return prefs.commit();
}


Future<void> saveUserData(Map<String, dynamic> userData) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('user_data', json.encode(userData));
}


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  var show_password = false;

  Future<SignInModel>? _futureSignIn;

  String? email;
  String? password;


  @override
  Widget build(BuildContext context) {
    return (_futureSignIn == null) ? buildColumn() : buildFutureBuilder();
  }




  buildColumn(){
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/book_back2.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back, size: 35,)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),


                Expanded(
                    child: ListView(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Image.asset("assets/images/bookelu_text_logo.png", height: 50,),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [
                                          Text("Email", style: TextStyle(fontSize: 12, ),),
                                          SizedBox(
                                            height: 10,
                                          ),

                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: Colors.black.withOpacity(0.1))),
                                            child: TextFormField(
                                              style: TextStyle(color: Colors.black),
                                              decoration: InputDecoration(
                                                //hintText: 'Enter Username/Email',

                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.normal),
                                                labelText: "Email",
                                                labelStyle: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black.withOpacity(0.5)),
                                                enabledBorder: UnderlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.white)),
                                                focusedBorder: UnderlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.white)),
                                                border: InputBorder.none,
                                              ),
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(225),
                                                PasteTextInputFormatter(),
                                              ],
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Email is required';
                                                }

                                                String pattern =
                                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                                    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                                    r"{0,253}[a-zA-Z0-9])?)*$";
                                                RegExp regex = RegExp(pattern);
                                                if (!regex.hasMatch(value))
                                                  return 'Enter a valid email address';

                                                return null;
                                              },
                                              textInputAction: TextInputAction.next,
                                              autofocus: false,
                                              onSaved: (value) {
                                                setState(() {
                                                  email = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Password", style: TextStyle(fontSize: 12),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(15),
                                                border:
                                                Border.all(color: Colors.black.withOpacity(0.1))),
                                            child: TextFormField(
                                              style: TextStyle(color: Colors.black),
                                              decoration: InputDecoration(
                                                //hintText: 'Enter Password',
                                                  suffixIcon: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        show_password = !show_password;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      show_password
                                                          ? Icons.remove_red_eye_outlined
                                                          : Icons.remove_red_eye,
                                                      color: Colors.black.withOpacity(0.1),
                                                    ),
                                                  ),
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.normal),
                                                  labelText: "Password",
                                                  labelStyle:
                                                  TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
                                                  enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.white)),
                                                  focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.white)),
                                                  border: InputBorder.none),
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(225),
                                                PasteTextInputFormatter(),
                                              ],
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Password is required';
                                                }
                                                if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*])')
                                                    .hasMatch(value)) {

                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text("- Password must be at least 8 characters long\n- Must include at least one uppercase letter,\n- One lowercase letter, one digit,\n- And one special character",),
                                                      backgroundColor: Colors.red,
                                                    ),
                                                  );
                                                  return '';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                setState(() {
                                                  password = value;
                                                });
                                              },
                                              textInputAction: TextInputAction.next,
                                              obscureText: show_password ? false : true,
                                              onSaved: (value) {
                                                setState(() {
                                                  password = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {

                                          if (_formKey.currentState!.validate()) {
                                            _formKey.currentState!.save();
                                            KeyboardUtil.hideKeyboard(context);

                                            _futureSignIn = signInUser(email!, password!);
                                            //_futureSignIn = signInUser(user!, password!, platformType!);


                                          }

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
                                              "Login",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ForgotPassword()));

                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Forgot password? ", style: TextStyle(fontSize: 12),),
                                            Text("Click here to recover", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,),),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 1,
                                                decoration: BoxDecoration(
                                                    color: Colors.black.withOpacity(0.3)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),


                                            Text(
                                              "or",
                                              style: TextStyle(fontSize: 15, fontFamily: "Fontspring"),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 1,
                                                decoration: BoxDecoration(
                                                    color: Colors.black.withOpacity(0.3)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => WelcomePage2()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.black.withOpacity(0.1))),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image(
                                                image:
                                                AssetImage("assets/images/gmail.png"),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                "Sign in with google",
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => WelcomePage2()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: bookDark,
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.black.withOpacity(0.1))),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    "assets/images/apple.png"),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                "Sign in with apple",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  OnboardingScreen()));
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Don't have an account? ",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              "Sign up here",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ],
                    )
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }


  FutureBuilder<SignInModel> buildFutureBuilder() {
    return FutureBuilder<SignInModel>(
        future: _futureSignIn,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);

            if(data.message == "Successful") {

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return SuccessDialogBox(text: "Login Successful");
                    }
                );
                Future.delayed(Duration(milliseconds: 500), () {
                  // Pop the dialog
                  //Navigator.of(context).pop();

                  // Navigate to the dashboard
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                });




              });


            }

            else if (data.message == "Errors") {
              String? errorKey = snapshot.data!.errors!.keys.firstWhere(
                    (key) => key == "password" || key == "email",
                orElse: () => null!,
              );
              if (errorKey != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen())
                  );

                  String customErrorMessage = snapshot.data!.errors![errorKey]![0];
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext context){
                        return ErrorDialogBox(text: customErrorMessage);
                      }
                  );

                });
              }
            }



          }

          return LoadingDialogBox(text: 'Please Wait..',);


        }
    );
  }


  void dispose() {
    super.dispose();
  }

}
