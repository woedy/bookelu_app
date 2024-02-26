import 'dart:convert';

import 'package:bookelu_app/Bookings/user_bookings.dart';
import 'package:bookelu_app/Components/generic_loading_dialogbox.dart';
import 'package:bookelu_app/HomeScreen/home_screen.dart';
import 'package:bookelu_app/Message/chat_screen.dart';
import 'package:bookelu_app/Profile/UserProfile.dart';
import 'package:bookelu_app/ShopView/models/list_shops_model.dart';
import 'package:bookelu_app/ShopView/shop_view_1.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<ListShopModel> get_shop_data() async {

  var token = await getApiPref();

  final response = await http.get(
    Uri.parse(hostName + "shop/list-shops/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Token '  + token.toString()
    },
  );


  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    final result = json.decode(response.body);
    if (result != null) {


    }
    return ListShopModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return ListShopModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return ListShopModel.fromJson(jsonDecode(response.body));
  }   else if (response.statusCode == 400) {
    print(jsonDecode(response.body));
    return ListShopModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to load data');
  }
}


class AllShopsScreen extends StatefulWidget {
  const AllShopsScreen({super.key});

  @override
  State<AllShopsScreen> createState() => _AllShopsScreenState();
}

class _AllShopsScreenState extends State<AllShopsScreen> {


  Future<ListShopModel>? _futureShopList;

  @override
  void initState() {
    _futureShopList = get_shop_data();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return (_futureShopList == null) ? buildColumn() : buildFutureBuilder();
  }



  buildColumn(){
    return Scaffold(
      body: Container(),
    );
  }

  FutureBuilder<ListShopModel> buildFutureBuilder() {
    return FutureBuilder<ListShopModel>(
        future: _futureShopList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            var _shops = data.data!.shops;

            print("#########################");
            print(data.data!.shops);

            if(data.message == "Successful") {

              return Scaffold(
                body: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text("Shops", style: TextStyle(fontSize: 48, fontWeight: FontWeight.w500),),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                    Border.all(color: Colors.black.withOpacity(0.1))),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          //hintText: 'Enter Username/Email',

                                          hintStyle: TextStyle(
                                              color: Colors.black.withOpacity(0.7),
                                              fontWeight: FontWeight.normal),
                                          labelText: "Search here",

                                          labelStyle: TextStyle(fontSize: 13,
                                              color: Colors.black.withOpacity(0.5)),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white)),
                                          border: InputBorder.none,
                                        ),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(225),
                                          PasteTextInputFormatter(),
                                        ],

                                        textInputAction: TextInputAction.next,
                                        autofocus: false,
                                        onSaved: (value) {
                                          setState(() {
                                            //email = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: [

                                        Icon(Icons.search),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                  child: ListView.builder(
                                    itemCount: _shops!.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ShopViewScreen1(shop_id: _shops[index].shopId)));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(vertical: 10),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 177,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                  //color: Colors.red,
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(40.0), // Adjust the radius as needed
                                                      topRight: Radius.circular(40.0), // Adjust the radius as needed
                                                    ),
                                                    image: DecorationImage(
                                                        image: NetworkImage(hostNameMedia + _shops[index].photo!.toString()),fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(_shops[index].shopName!.toString(), style: TextStyle(fontSize: 20,fontFamily: "Fontspring", fontWeight: FontWeight.w800 ),),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Icon(Icons.location_on_outlined, size: 20,),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(child: Text(_shops[index].locationName!.toString(), style: TextStyle(fontSize: 10,),)),

                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      height: 35,
                                                      //color: Colors.blue,
                                                      child: ListView.builder(
                                                        scrollDirection: Axis.horizontal,
                                                        itemCount: _shops[index].shopServices!.length,
                                                        itemBuilder: (context, index2){
                                                          return  Container(
                                                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                              margin: EdgeInsets.all(5),
                                                              decoration: BoxDecoration(
                                                                  color: bookPrimary.withOpacity(0.3),
                                                                  borderRadius: BorderRadius.circular(5)
                                                              ),
                                                              child: Text(_shops[index].shopServices![index2].serviceType!, style: TextStyle(fontSize: 10, ),));

                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(10),
                                                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                                      height: 45,
                                                      width: MediaQuery.of(context).size.width,
                                                      decoration: BoxDecoration(
                                                          color: bookPrimary,
                                                          borderRadius: BorderRadius.circular(7)),
                                                      child: Center(
                                                        child: Text(
                                                          "Book",
                                                          style: TextStyle(color: Colors.white),
                                                        ),
                                                      ),
                                                    ),


                                                  ],
                                                ),
                                              )

                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                              )

                            ],
                          ),
                        ),
                      ),
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
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                              },
                              child: Column(
                                children: [
                                  Image.asset("assets/icons/home.png", height: 25,)
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserBookings()));
                              },
                              child: Column(
                                children: [
                                  Image.asset("assets/icons/card.png", height: 25,)
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BookingsScreen()));


                              },
                              child: Column(
                                children: [
                                  Image.asset("assets/icons/add.png", height: 40, color: bookPrimary,)

                                ],
                              ),
                            ),

                            InkWell(
                              onTap: (){

                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ChatScreen()));

                              },
                              child: Column(
                                children: [
                                  Image.asset("assets/icons/message.png", height: 25,)

                                ],
                              ),
                            ),

                            InkWell(
                              onTap: (){

                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserProfile()));

                              },
                              child: Column(
                                children: [
                                  Image.asset("assets/icons/person.png", height: 25,)
                                ],
                              ),
                            ),


                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
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
