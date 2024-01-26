import 'dart:convert';

import 'package:bookelu_app/Authentication/Password/models/forgot_password_model.dart';
import 'package:bookelu_app/Authentication/Password/password_confirmation.dart';
import 'package:bookelu_app/Authentication/Registration/models/sign_up_model.dart';
import 'package:bookelu_app/Authentication/Registration/registration_1.dart';
import 'package:bookelu_app/Authentication/Registration/verify_email.dart';
import 'package:bookelu_app/Authentication/Registration/resend_verification.dart';
import 'package:bookelu_app/Components/generic_error_dialog_box.dart';
import 'package:bookelu_app/Components/generic_loading_dialogbox.dart';
import 'package:bookelu_app/Components/generic_success_dialog_box.dart';
import 'package:bookelu_app/Components/keyboard_utils.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


Future<ForgotPasswordModel> forgotPassword(String email) async {

  final response = await http.post(
    Uri.parse(hostName + "accounts/forgot-user-password/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode({
      "email": email,
    }),
  );


  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    final result = json.decode(response.body);
    if (result != null) {
      //print(result['data']['token'].toString());


    }
    return ForgotPasswordModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return ForgotPasswordModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return ForgotPasswordModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 400) {
    print(jsonDecode(response.body));
    return ForgotPasswordModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to load');
  }
}


class ForgotPassword extends StatefulWidget {

  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  String? email;

  Future<ForgotPasswordModel>? _futureForgotPassword;

  @override
  Widget build(BuildContext context) {
    return (_futureForgotPassword == null) ? buildColumn() : buildFutureBuilder();
  }


  buildColumn(){
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                  Expanded(child: Image.asset("assets/images/bookelu_text_logo.png", height: 30,))
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
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Password", style: TextStyle(fontSize: 60, fontFamily: "Fontspring", height: 1),),
                                SizedBox(
                                  height: 15,
                                ),

                                Text("Forgot your password?", style: TextStyle(fontSize: 32, ),),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
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
                                    height: 40,
                                  ),


                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 180,
                          ),
                          InkWell(
                            onTap: () {


                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                KeyboardUtil.hideKeyboard(context);



                                _futureForgotPassword = forgotPassword(email!);
                                //_futureSignIn = signInUser(user!, password!, platformType!);



                              }



                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.all(15),
                              height: 59,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: bookPrimary,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(color: Colors.white),
                                ),
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
      ),
    );
  }

  FutureBuilder<ForgotPasswordModel> buildFutureBuilder() {
    return FutureBuilder<ForgotPasswordModel>(
        future: _futureForgotPassword,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Wait as a code is being sent to your email',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);

            if(data.message == "Successful") {

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PasswordConfirm(email: email,)),
                );

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return SuccessDialogBox(text: "OTP code sent to your email.");

                    }
                );




              });


            }

            else if (data.message == "Error") {
              WidgetsBinding.instance.addPostFrameCallback((_) {

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ForgotPassword())
                );

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context){
                      return ErrorDialogBox(text: 'Email does not exist.',);
                    }
                );




              });

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
