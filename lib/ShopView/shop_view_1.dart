import 'package:bookelu_app/Bookings/user_bookings.dart';
import 'package:bookelu_app/HomeScreen/bookings_screen.dart';
import 'package:bookelu_app/HomeScreen/home_screen.dart';
import 'package:bookelu_app/Message/chat_screen.dart';
import 'package:bookelu_app/Profile/UserProfile.dart';
import 'package:bookelu_app/ShopView/Services/service_details.dart';
import 'package:bookelu_app/ShopView/Services/service_details_appointment.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShopViewScreen1 extends StatefulWidget {
  const ShopViewScreen1({super.key});

  @override
  State<ShopViewScreen1> createState() => _ShopViewScreen1State();
}

class _ShopViewScreen1State extends State<ShopViewScreen1> {

  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/shop1.png"),
                                fit: BoxFit.cover
                                )
                              )

                            ),
                          Container(
                            height: 250,
                            decoration: BoxDecoration(

                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black],
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: (){
                                            Navigator.of(context).pop();
                                          },
                                          child: Icon(Icons.arrow_back, size: 35, color: Colors.white,)),
                                      Image.asset("assets/icons/message.png", height: 25, color: Colors.white,)

                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Beauty Oasis", style: TextStyle(color: Colors.white,fontSize: 48, fontWeight: FontWeight.w500, fontFamily: "Fontspring"),),


                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.location_on_outlined, size: 20, color: Colors.white,),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(child: Text("8/101 Nicholson St, Camp Hill EC1A 1AE", style: TextStyle(color: Colors.white,fontSize: 14,),)),

                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                  padding: EdgeInsets.all(2),
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  child: Center(child: Text("Open", style: TextStyle(color: Colors.white,fontSize: 10,),))),

                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.star_rounded, color: Colors.yellow, size: 40,),
                                          Text("4.5", style: TextStyle(color: Colors.white,fontSize: 20,),),

                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Container(
                            margin: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildNavItem("Services", 0),
                                    buildNavItem("Gallery", 1),
                                    buildNavItem("Saloon Staff", 2),
                                    buildNavItem("Packages", 3),
                                  ],
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
                                     _services_page(),
                                      _gallery_page(),
                                      _staff_page()

                                      // Add more pages as needed
                                    ],
                                  ),
                                )
                              ],
                            ),
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BookingsScreen()));


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

  Widget _services_page(){
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 140,
            //color: Colors.red,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 89,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/hair_cut.png", height: 35,),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Haircut",
                        style: TextStyle(fontSize: 10,),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 89,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/styilng.png", height: 35,),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Styling",
                        style: TextStyle(fontSize: 10,),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 89,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/dryer.png", height: 35,),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Hair Dryer",
                        style: TextStyle(fontSize: 10,),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 89,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/massage.png", height: 35,),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Massage",
                        style: TextStyle(fontSize: 10,),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return  InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ServiceDetails()));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        child: Stack(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                //color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/shop_g.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 70,
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Hair Re-Touch",
                                          style: TextStyle(fontSize: 16,),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.star, color: Colors.yellow, size: 15,),
                                            Icon(Icons.star, color: Colors.yellow, size: 15,),
                                            Icon(Icons.star, color: Colors.yellow, size: 15,),
                                            Icon(Icons.star, color: Colors.yellow, size: 15,),
                                            Icon(Icons.star, color: Colors.yellow, size: 15,),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Text(
                                        "\$70",
                                        style: TextStyle(fontSize: 16, color: Colors.white),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget _gallery_page(){
    return Expanded(
      child: Column(
        children: [



          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: 10, // Replace with the actual number of items you want to display
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  //height: 150,
                  decoration: BoxDecoration(
                    //color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/images/shop_g.png"),
                      fit: BoxFit.cover

                    )

                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _staff_page(){
    return Expanded(
      child: Column(
        children: [

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
                      labelText: "Search staff here",

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

          SizedBox(height: 10,),

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: 10, // Replace with the actual number of items you want to display
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),


                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          //height: 70,
                          decoration: BoxDecoration(
                            //color: Colors.red,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/shop_g.png"),
                                  fit: BoxFit.cover

                              )

                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Marvin McKinney", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                      Text("Hair stylist", style: TextStyle(fontSize: 10,),),
                      Row(
                        children: [
                          Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                          Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                          Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                          Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                          Icon(Icons.star_rounded, size: 15, color: Colors.yellow,)
                        ],
                      )

                    ],
                  ),
                );
              },
            ),
          ),
        ],
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
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.withOpacity(0.3) : null,
          borderRadius: BorderRadius.circular(5),
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
