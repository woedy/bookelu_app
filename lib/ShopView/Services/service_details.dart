import 'dart:convert';
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
  final shop_id;
  final open;
  final service_price;
  final service_id;
  final service_photo;
  final staffs;

  const ServiceDetails({super.key,
    required this.service_name,
    required this.service_rating,
    required this.shop_location,
    required this.open,
    required this.service_price,
    required this.service_id,
    required this.service_photo,
    required this.staffs,
    required this.shop_id,
  });

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  DateTime _focusedDay = DateTime.now(); // Today's date as the initial focused day
  DateTime? _selectedDay;
  bool _showMonthPicker = false; // Flag to control month picker visibility
  bool home_service = false; // Flag to control month picker visibility
  DateTime? _selectedTime;
  String the_day = "";
  String the_day_no = "";

  String _selectedStaffId = "";
  String _selectedStaffPhoto = "";
  String _selectedStaffName = "";
  String _selectedStaffRole = "";


  @override
  void initState() {
    super.initState();
    _selectedDay = null; // Set _selectedDay to null initially
    _focusedDay = DateTime.now(); // Today's date for initial focus
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
                                  _buildDaysOfMonth(_focusedDay),


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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Available Slots", style: TextStyle(fontSize: 10,),),
                              ],
                            ),
                            SizedBox(height: 15,),
                            if (_selectedDay != null) ...[
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(14, (index) {
                                    int startHour = 7 + index;
                                    int endHour = startHour + 1;
                                    String startTime = '${startHour % 12 == 0 ? 12 : startHour % 12}:00 ${startHour < 12 ? 'AM' : 'PM'}';
                                    String endTime = '${endHour % 12 == 0 ? 12 : endHour % 12}:00 ${endHour < 12 ? 'AM' : 'PM'}';

                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedTime = DateTime(_selectedDay!.year, _selectedDay!.month, _selectedDay!.day, startHour);
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.all(10),
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: _selectedTime != null &&
                                              _selectedTime!.year == _selectedDay!.year &&
                                              _selectedTime!.month == _selectedDay!.month &&
                                              _selectedTime!.day == _selectedDay!.day &&
                                              _selectedTime!.hour == startHour
                                              ? Colors.grey.shade700
                                              : Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text("$startTime - $endTime", style: TextStyle(fontSize: 14),),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ]
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
                          CupertinoSwitch(
                              value: home_service,

                              onChanged: (value) {
                                setState(() {
                                  home_service = value;
                                });
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
                      child: Text("Hair Re-Touch Specialist", style: TextStyle(fontSize: 10,)),
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: widget.staffs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedStaffId = widget.staffs[index].staffId;
                                _selectedStaffName = widget.staffs[index].staffName;
                                _selectedStaffPhoto = widget.staffs[index].photo;
                                _selectedStaffRole = widget.staffs[index].role;
                              });
                            },
                            child: Container(
                              width: 200,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: _selectedStaffId == widget.staffs[index].staffId ? Colors.blue.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                                border: _selectedStaffId == widget.staffs[index].staffId ? Border.all(color: Colors.blue, width: 2) : null, // Add border when selected
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: NetworkImage(hostNameMedia + widget.staffs[index].photo),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(widget.staffs[index].staffName, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
                                  Text(widget.staffs[index].role, style: TextStyle(fontSize: 10,),),
                                  Row(
                                    children: [
                                      Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                      Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                      Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                      Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                      Icon(Icons.star_rounded, size: 15, color: Colors.yellow,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {




                    if (_selectedDay == null){

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please select a day to book",),
                            backgroundColor: Colors.red,
                          ),
                        );
                    }
                    else if (_selectedTime == null){

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please select a time to book",),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    else if (_selectedStaffId == ""){

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please select a prefared staff",),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }else {


                      Map<String, dynamic> appointmentData = {
                        "service_id": widget.service_id,
                        "date": DateFormat('yyyy-MM-dd').format(_selectedDay!),
                        "time": "${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}:${_selectedTime!.second.toString().padLeft(2, '0')}",
                        "home_service": home_service,
                        "staff_id": _selectedStaffId,
                      };
                      String jsonData = jsonEncode(appointmentData);

                      print(appointmentData);
                      print(the_day);
                      print(the_day_no);

                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceDetailsAppointment(

                        data: appointmentData,
                      service_name:widget.service_name,
                      service_rating: widget.service_rating,
                      shop_location: widget.shop_location,
                      shop_id: widget.shop_id,
                      open:widget.open,
                      service_price:widget.service_price,
                      service_id: widget.service_id,
                      service_photo: widget.service_photo,

                      the_day: the_day,
                      the_day_no: the_day_no,
                      staffs: widget.staffs,
                      staff_name: _selectedStaffName,
                      staff_photo: _selectedStaffPhoto,
                      staff_role: _selectedStaffRole,





                    )));

                    }
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

  Widget _buildDaysOfMonth(DateTime month) {
    List<Widget> dayWidgets = [];
    int daysInMonth = DateTime(month.year, month.month + 1, 0).day; // Get the number of days in the selected month
    DateTime today = DateTime.now(); // Get the current date


    // Check if current date falls in the same month or previous month
    bool isCurrentMonth = today.year == month.year && today.month == month.month;
    int startingDay = isCurrentMonth ? today.day : 1; // Start from today if in the same month

    for (int day = startingDay; day <= daysInMonth; day++) {
      bool isCurrentDay = today.year == month.year && today.month == month.month && today.day == day;
      DateTime currentDate = DateTime(month.year, month.month, day);



      // Highlight days from today onwards
      if (currentDate.isAtSameMomentAs(today) || currentDate.isAfter(today)) {
        //the_day = DateFormat('EEE').format(DateTime(month.year, month.month, day)).toUpperCase();
        //the_day_no = _selectedDay!.day.toString();

        dayWidgets.add(
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = DateTime(month.year, month.month, day);

                the_day = DateFormat('EEE').format(DateTime(month.year, month.month, day)).toUpperCase();
                the_day_no = _selectedDay!.day.toString();
                print("###########");
                print(the_day);
                print(the_day_no);
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(6),
              width: 45,
              decoration: BoxDecoration(
                color: isCurrentDay ? Colors.grey.withOpacity(0.2) : (_selectedDay != null && _selectedDay!.year == month.year && _selectedDay!.month == month.month && _selectedDay!.day == day) ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                children: [
                  Text(
                    DateFormat('EEE').format(DateTime(month.year, month.month, day)).toUpperCase(),
                    style: TextStyle(color: isCurrentDay ? Colors.white : (_selectedDay != null && _selectedDay!.year == month.year && _selectedDay!.month == month.month && _selectedDay!.day == day) ? Colors.black : Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Text(
                    day.toString(),
                    style: TextStyle(color: isCurrentDay ? Colors.white : (_selectedDay != null && _selectedDay!.year == month.year && _selectedDay!.month == month.month && _selectedDay!.day == day) ? Colors.black : Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: dayWidgets,
      ),
    );
  }

}
