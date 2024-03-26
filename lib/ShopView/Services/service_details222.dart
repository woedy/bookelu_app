import 'dart:core';

import 'package:bookelu_app/ShopView/Services/service_details_appointment.dart';
import 'package:bookelu_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class ServiceDetails extends StatefulWidget {
  final service_name;
  final service_rating;
  final shop_location;
  final open;
  final service_price;
  final service_photo;

  const ServiceDetails({super.key,
    required this.service_name,
    required this.service_rating,
    required this.shop_location,
    required this.open,
    required this.service_price,
    required this.service_photo,
  });

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool _showMonthPicker = false; // Flag to control month picker visibility

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _showMonthPicker = false; // Hide month picker on day selection
    });
  }

  void _onPreviousMonth() {
    setState(() {
      _focusedDay = _focusedDay.subtract(Duration(days: 35)); // Adjust for smoother month transition
    });
  }

  void _onNextMonth() {
    setState(() {
      _focusedDay = _focusedDay.add(Duration(days: 35)); // Adjust for smoother month transition
    });
  }

  String _formatMonthYear(DateTime day) {
    final formatter = DateFormat('MMMM yyyy');
    return formatter.format(day);
  }

  void _toggleMonthPicker() {
    setState(() {
      _showMonthPicker = !_showMonthPicker; // Toggle month picker visibility
    });
  }

  int _getSelectedMonthIndex() {
    return _focusedDay.month - 1; // Adjust for zero-based indexing
  }

  void _onMonthSelected(int monthIndex) {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, monthIndex + 1); // Update focused day with new month
      _showMonthPicker = false; // Hide month picker on selection
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: 250,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(hostNameMedia + widget.service_photo),
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
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Text(
                                          widget.service_price,
                                          style: TextStyle(fontSize: 16, color: Colors.white),
                                        ),
                                      ),

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
                                              Text(widget.service_name.toString(), style: TextStyle(color: Colors.white,fontSize: 48, fontWeight: FontWeight.w500, fontFamily: "Fontspring"),),


                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.location_on_outlined, size: 20, color: Colors.white,),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(child: Text(widget.shop_location.toString(), style: TextStyle(color: Colors.white,fontSize: 14,),)),

                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              if(widget.open)...[
                                              Container(
                                                  padding: EdgeInsets.all(2),
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  child: Center(child: Text("Open", style: TextStyle(color: Colors.white,fontSize: 10,),))),
                                              ]else...[
                                                Container(
                                                    padding: EdgeInsets.all(2),
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius: BorderRadius.circular(5)
                                                    ),
                                                    child: Center(child: Text("Close", style: TextStyle(color: Colors.white,fontSize: 10,),))),
                                              ]

                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.star_rounded, color: Colors.yellow, size: 40,),
                                          Text(widget.service_rating.toString(), style: TextStyle(color: Colors.white,fontSize: 20,),),

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
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black
                        ),
                        padding: EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                                        onPressed: _onPreviousMonth,
                                      ),
                                      GestureDetector(
                                        onTap: _toggleMonthPicker,
                                        child: Text(
                                          _formatMonthYear(_focusedDay),
                                          style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                                        onPressed: _onNextMonth,
                                      ),
                                    ],
                                  ),

                                  _showMonthPicker
                                      ? _buildMonthPicker(context) // Display month picker when _showMonthPicker is true
                                      : Container(),
                                  SizedBox(
                                    height: 30,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text("SUN", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("15", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Column(
                                          children: [
                                            Text("MON", style: TextStyle(color: Colors.black,fontSize: 12, fontWeight: FontWeight.w600),),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text("16", style: TextStyle(color: Colors.black,fontSize: 12, fontWeight: FontWeight.w600),),

                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text("TUE", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("17", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("WED", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("18", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("THU", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("19", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("FRI", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("20", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("SAT", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("21", style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w600),),

                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),



                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Available Slots", style: TextStyle(fontSize: 10,),),

                          SizedBox(height: 15,),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),


                                    ),
                                    child: Center(
                                      child: Text("7:00 AM - 9:30 AM", style: TextStyle(fontSize: 14),),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),


                                    ),
                                    child: Center(
                                      child: Text("7:00 AM - 9:30 AM", style: TextStyle(fontSize: 14),),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),


                                    ),
                                    child: Center(
                                      child: Text("7:00 AM - 9:30 AM", style: TextStyle(fontSize: 14),),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),


                                    ),
                                    child: Center(
                                      child: Text("7:00 AM - 9:30 AM", style: TextStyle(fontSize: 14),),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),



                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          CupertinoSwitch(value: false, onChanged: (value) {
                          }),
                          SizedBox(width: 10,),

                          Text("Home Service", style: TextStyle(fontSize: 10,))
                        ],
                      )
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),

                        child: Text("Hair Re-Touch Specialist", style: TextStyle(fontSize: 10,))),

                    Container(
                      height: 200,
                      //color: Colors.red,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 200,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
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
                          ),
                          Container(
                            width: 200,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
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
                          ),

                        ],
                      ),
                    )
                  ],
                ),

                InkWell(
                  onTap: () {

                     Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailsAppointment()));

                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    height: 59,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: bookPrimary,
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Text(
                        "Book Appointment",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 45,)





              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildMonthPicker(BuildContext context) {
    final List<String> months = List.generate(12, (index) => DateFormat('MMMM').format(DateTime(2024, index + 1))); // Generate month names
    final int selectedMonthIndex = _getSelectedMonthIndex();

    return Container(
      height: 200, // Adjust height as needed
      child: ListView.builder(
        itemCount: months.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(months[index], style: TextStyle(color: Colors.white),),
            selected: index == selectedMonthIndex,
            onTap: () => _onMonthSelected(index),
          );
        },
      ),
    );
  }






}
