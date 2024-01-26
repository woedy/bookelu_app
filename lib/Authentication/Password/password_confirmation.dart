import 'dart:convert';

import 'package:bookelu_app/Authentication/Login/login_screen.dart';
import 'package:bookelu_app/Authentication/Password/reset_password.dart';
import 'package:bookelu_app/Authentication/Registration/models/verify_email_model.dart';
import 'package:bookelu_app/Authentication/Registration/resend_verification.dart';
import 'package:bookelu_app/Components/generic_button_dialog_box.dart';
import 'package:bookelu_app/Components/generic_error_dialog_box.dart';
import 'package:bookelu_app/Components/generic_loading_dialogbox.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:http/http.dart' as http;




Future<VerifyEmailModel> resetPasswordToken(String email, String token) async {

  final response = await http.post(
    Uri.parse(hostName + "accounts/confirm-password-otp/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    },
    body: jsonEncode({
      "email": email,
      "otp_code": token,
    }),
  );


  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    final result = json.decode(response.body);
    if (result != null) {

      print("#######################");
      print(result);


    }
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }   else if (response.statusCode == 400) {
    print(jsonDecode(response.body));
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to Reset token');
  }
}

class PasswordConfirm extends StatefulWidget {
  final email;
  const PasswordConfirm({super.key, required this.email});

  @override
  State<PasswordConfirm> createState() => _PasswordConfirmState();
}

class _PasswordConfirmState extends State<PasswordConfirm> {

  bool hasError = false;
  String email_token = "";
  TextEditingController controller = TextEditingController(text: "");

  Future<VerifyEmailModel>? _futureResetToken;


  @override
  Widget build(BuildContext context) {
    return (_futureResetToken == null) ? buildColumn() : buildFutureBuilder();
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
                                Text("Verify Email", style: TextStyle(fontSize: 60, fontFamily: "Fontspring", height: 1),),
                                SizedBox(
                                  height: 15,
                                ),

                                Text("Enter the OTP sent to your email.", style: TextStyle(fontSize: 32, ),),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("We've sent a code to ${widget.email}. Enter it below to verify your email address.", style: TextStyle(fontSize: 15, ),),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                              //key: _formKey,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                //color: Colors.red,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [
                                          PinCodeTextField(
                                            autofocus: true,
                                            controller: controller,
                                            hideCharacter: false,
                                            highlight: true,
                                            highlightColor: bookDark,
                                            defaultBorderColor:
                                            Colors.grey.withOpacity(0.3),
                                            hasTextBorderColor:
                                            Colors.grey.withOpacity(0.2),
                                            highlightPinBoxColor: Colors.white.withOpacity(0.3),
                                            pinBoxColor: Colors.white.withOpacity(0.3),
                                            pinBoxRadius: 10,
                                            keyboardType: TextInputType.text,
                                            maxLength: 4,
                                            //maskCharacter: "😎",
                                            onTextChanged: (text) {
                                              setState(() {
                                                hasError = false;
                                              });
                                            },
                                            onDone: (text) {
                                              print("DONE $text");
                                              print("DONE CONTROLLER ${controller.text}");
                                              email_token=text.toString();
                                            },
                                            pinBoxWidth: 60,
                                            pinBoxHeight: 80,
                                            //hasUnderline: true,
                                            wrapAlignment: WrapAlignment.spaceAround,
                                            pinBoxDecoration: ProvidedPinBoxDecoration
                                                .defaultPinBoxDecoration,
                                            pinTextStyle: TextStyle(fontSize: 35.0),
                                            pinTextAnimatedSwitcherTransition:
                                            ProvidedPinBoxTextAnimation
                                                .scalingTransition,
                                            pinTextAnimatedSwitcherDuration:
                                            Duration(milliseconds: 300),
                                            highlightAnimationBeginColor: Colors.black,
                                            highlightAnimationEndColor: Colors.white12,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 170,
                          ),

                          InkWell(
                            onTap: () {
                              setState(() {
                                _futureResetToken = resetPasswordToken(widget.email, email_token);

                              });


                             /* showDialog(
                                  context: context,
                                  builder: (_) => VerifyDialogBox(
                                    loadingText: 'Your Account setup',
                                    onTapFunction: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginScreen()));
                                    },
                                  )
                              );*/


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
                                  "Verify",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ResendVerifyEmail(email: widget.email)));

                            },
                            child: Container(
                              padding: EdgeInsets.all(20),

                              height: 59,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Text(
                                  "Resend Code",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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

  FutureBuilder<VerifyEmailModel> buildFutureBuilder() {
    return FutureBuilder<VerifyEmailModel>(
        future: _futureResetToken,
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPassword(email: widget.email,)),
                );



              });


            }

            else if (data.message == "Errors") {
              WidgetsBinding.instance.addPostFrameCallback((_) {

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PasswordConfirm(email: widget.email,))
                );

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context){
                      return ErrorDialogBox(text: 'Invalid Code.',);
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
