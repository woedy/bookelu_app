import 'dart:convert';

import 'package:bookelu_app/Bookings/cancel_booking.dart';
import 'package:bookelu_app/Bookings/models/user_bookings_model.dart';
import 'package:bookelu_app/Components/generic_loading_dialogbox.dart';
import 'package:bookelu_app/ShopView/shops_screen.dart';
import 'package:bookelu_app/HomeScreen/home_screen.dart';
import 'package:bookelu_app/Message/chat_screen.dart';
import 'package:bookelu_app/Profile/UserProfile.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;


Future<ListUserBookingsModel> get_bookings_data() async {

  var token = await getApiPref();
  var user_id = await getUserIDPref();

  final response = await http.get(
    Uri.parse(hostName + "bookings/client-bookings/?user_id=" + user_id.toString()),
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
    return ListUserBookingsModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return ListUserBookingsModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return ListUserBookingsModel.fromJson(jsonDecode(response.body));
  }   else if (response.statusCode == 400) {
    print(jsonDecode(response.body));
    return ListUserBookingsModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to load data');
  }
}


class UserBookings extends StatefulWidget {
  const UserBookings({super.key});

  @override
  State<UserBookings> createState() => _UserBookingsState();
}

class _UserBookingsState extends State<UserBookings> {

  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;


  Future<ListUserBookingsModel>? _futureBookingList;

  @override
  void initState() {
    _futureBookingList = get_bookings_data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (_futureBookingList == null) ? buildColumn() : buildFutureBuilder();
  }

  buildColumn(){
    return Scaffold(
      body: Container(),
    );
  }





  FutureBuilder<ListUserBookingsModel> buildFutureBuilder() {
    return FutureBuilder<ListUserBookingsModel>(
        future: _futureBookingList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            //var _all_bookings = data.data!.allBookings;
            //var _upcoming_booking = data.data!.upcoming;
            //var _history_booking = data.data!.history;

            var _upcoming_booking = data.data!.upcoming!;
            var _history_booking = data.data!.history!;

            print("###########################333");
            print(data.data!.history!.length);


            if(data.message == "Successful") {

              return Scaffold(
                body: Container(
                  child: SafeArea(
                    bottom: false,
                    child: Column(

                      children: [
                        Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left:15, right: 15, top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Bookings", style: TextStyle(fontSize: 46, fontWeight: FontWeight.w500),),
                                      Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Icon(Icons.calendar_today_outlined, color: Colors.white,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
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
                                              labelText: "Search shop or staff  here",

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
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: bookPrimary.withOpacity(0.5),
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              buildNavItem("Upcoming", 0),
                                              buildNavItem("History", 1),

                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: PageView(

                                            controller: _pageController,
                                            onPageChanged: (int page) {
                                              setState(() {
                                                currentPage = page;
                                              });
                                            },
                                            children: [
                                              _upcoming(_upcoming_booking),
                                              _history(_history_booking)
                                              // Add more pages as needed
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
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
                                  //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserBookings()));
                                },
                                child: Column(
                                  children: [
                                    Image.asset("assets/icons/card.png", height: 25, color: bookPrimary,)
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AllShopsScreen()));


                                },
                                child: Column(
                                  children: [
                                    Image.asset("assets/icons/add.png", height: 40,)

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

  Widget _upcoming(_upcoming_booking){
    return Container(
      child: ListView.builder(
        itemCount: _upcoming_booking.length,
        itemBuilder: (context, index){
          return  InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CancelBookings()));

            },
            child: Column(

              children: [
                SizedBox(
                  height: 20,
                ),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(hostNameMedia + _upcoming_booking[index].shop.photo),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_upcoming_booking[index].shop.shopName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: "Fontspring"),),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                    width: 120,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Center(child: Text(_upcoming_booking[index].service.price, style: TextStyle(fontSize: 16, color: Colors.white),))),

                              ],
                            ),
                          ],
                        ),
                        Text(_upcoming_booking[index].bookingDate, style: TextStyle(fontSize: 12,)),


                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(_upcoming_booking[index].service.serviceType, style: TextStyle(fontSize: 14, )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: bookPrimary.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(child: Text(_upcoming_booking[index].bookingTime, style: TextStyle(fontSize: 16,),))),
                    ),
                /*    Icon(Icons.arrow_forward_rounded),
                    Container(
                        width: 150,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: bookPrimary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: Text("7 : 50 am", style: TextStyle(fontSize: 16,),))),*/
                  ],
                ),
                SizedBox(
                  height: 25,
                ),


                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _history(_history_booking){
    return Container(
      child: ListView.builder(
        itemCount: _history_booking.length,
        itemBuilder: (context, index){
          return  InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CancelBookings()));

            },
            child: Column(

              children: [
                SizedBox(
                  height: 20,
                ),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(hostNameMedia + _history_booking[index].shop.photo),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_history_booking[index].shop.shopName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: "Fontspring"),),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                    width: 120,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Center(child: Text(_history_booking[index].service.price, style: TextStyle(fontSize: 16, color: Colors.white),))),

                              ],
                            ),
                          ],
                        ),
                        Text(_history_booking[index].bookingDate, style: TextStyle(fontSize: 12,)),


                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(_history_booking[index].service.serviceType, style: TextStyle(fontSize: 14, )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: bookPrimary.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(child: Text(_history_booking[index].bookingTime, style: TextStyle(fontSize: 16,),))),
                    ),
                    /*    Icon(Icons.arrow_forward_rounded),
                    Container(
                        width: 150,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: bookPrimary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: Text("7 : 50 am", style: TextStyle(fontSize: 16,),))),*/
                  ],
                ),
                SizedBox(
                  height: 25,
                ),


                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget buildNavItem(String title, int pageIndex) {
    bool isSelected = currentPage == pageIndex;

    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          pageIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        width: 120,
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.withOpacity(0.3) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
