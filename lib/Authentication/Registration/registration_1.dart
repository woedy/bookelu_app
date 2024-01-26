import 'package:bookelu_app/Authentication/Registration/photo_upload.dart';
import 'package:bookelu_app/Components/keyboard_utils.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Registration1 extends StatefulWidget {
  const Registration1({super.key});

  @override
  State<Registration1> createState() => _Registration1State();
}

class _Registration1State extends State<Registration1> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNode = FocusNode();

  String? full_name;
  String? phone;
  String? email;
  String? _code;
  String? _number;
  String? country;

  @override
  Widget build(BuildContext context) {
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
                              children: [
                                Text("Account Setup", style: TextStyle(fontSize: 60, fontFamily: "Fontspring", height: 1),),
                                SizedBox(
                                  height: 15,
                                ),

                                Text("Hey, it's time to tell us about yourself!", style: TextStyle(fontSize: 32, ),),
                              ],
                            ),
                          ),
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
                                      Text("Full name", style: TextStyle(fontSize: 12, ),),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black.withOpacity(0.1))),
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            //hintText: 'Enter Username/Email',

                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.normal),
                                            labelText: "Full name",
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
                                              return 'Full name is required';
                                            }
                                            if (value.length < 3) {
                                              return 'Full name too short';
                                            }
                                          },
                                          textInputAction: TextInputAction.next,
                                          autofocus: false,
                                          onSaved: (value) {
                                            setState(() {
                                              full_name = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text("Contact Number", style: TextStyle(fontSize: 12),),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    IntlPhoneField(
                                      focusNode: focusNode,
                                      style: TextStyle(color: Colors.black),
                                      dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.grey,),
                                      decoration: InputDecoration(
                                        // labelText: 'Phone Number',
                                          border: OutlineInputBorder(

                                            borderSide: BorderSide(
                                                color: Colors.transparent,
                                            ),
                                          ),
                                          enabledBorder:  new OutlineInputBorder(
                                            borderSide:  BorderSide(color: Colors.black.withOpacity(0.1)),

                                          ),
                                          focusedBorder:  new OutlineInputBorder(
                                            borderSide:  BorderSide(color: Colors.black.withOpacity(0.1)),
                                          )
                                      ),
                                      languageCode: "en",
                                      initialCountryCode: "GH",
                                      validator: (e){
                                        if(e == null){
                                          return 'Phone Number required';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        _code = value.countryCode.toString();
                                        _number = value.number.toString();
                                        country = value.countryISOCode.toString();
                                      },
                                      onCountryChanged: (country) {

                                      },

                                      onSaved: (value) {
                                        //_onSaveForm(value.toString());
                                        setState(() {
                                          _code = value!.countryCode.toString();
                                          _number = value.number.toString();
                                          country = value.countryISOCode.toString();
                                        });

                                      },

                                    ),
                                  ],
                                ),
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
                                ],
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {


                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                KeyboardUtil.hideKeyboard(context);

                                phone = _code.toString() + _number.toString();

                                print("##################");
                                print(full_name);
                                print(phone);
                                print(email);
                                print(_code);
                                print(_number);
                                print(country);

                                var data = {
                                  "full_name": full_name,
                                  "phone": phone,
                                  "email": email,
                                  "country": country,
                                };



                                Navigator.push(context, MaterialPageRoute(builder: (context) => UploadPhotoReg(
                                  data: data,
                                )));

                              }




                              //Navigator.push(context, MaterialPageRoute(builder: (context) => UploadPhotoReg()));

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
}
