class ListUserBookingsModel {
  String? message;
  Data? data;

  ListUserBookingsModel({this.message, this.data});

  ListUserBookingsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Upcoming>? upcoming;
  List<Upcoming>? history;
  List<Upcoming>? allBookings;

  Data({this.upcoming, this.history, this.allBookings});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['upcoming'] != null) {
      upcoming = <Upcoming>[];
      json['upcoming'].forEach((v) {
        upcoming!.add(new Upcoming.fromJson(v));
      });
    }
    if (json['history'] != null) {
      history = <Upcoming>[];
      json['history'].forEach((v) {
        history!.add(new Upcoming.fromJson(v));
      });
    }
    if (json['all_bookings'] != null) {
      allBookings = <Upcoming>[];
      json['all_bookings'].forEach((v) {
        allBookings!.add(new Upcoming.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.upcoming != null) {
      data['upcoming'] = this.upcoming!.map((v) => v.toJson()).toList();
    }
    if (this.history != null) {
      data['history'] = this.history!.map((v) => v.toJson()).toList();
    }
    if (this.allBookings != null) {
      data['all_bookings'] = this.allBookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Upcoming {
  String? bookingId;
  Client? client;
  Null? serviceType;
  Service? service;
  Shop? shop;
  String? bookingDate;
  String? bookingTime;
  String? status;
  BookingPayments? bookingPayments;

  Upcoming(
      {this.bookingId,
        this.client,
        this.serviceType,
        this.service,
        this.shop,
        this.bookingDate,
        this.bookingTime,
        this.status,
        this.bookingPayments});

  Upcoming.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    serviceType = json['service_type'];
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    bookingDate = json['booking_date'];
    bookingTime = json['booking_time'];
    status = json['status'];
    bookingPayments = json['booking_payments'] != null
        ? new BookingPayments.fromJson(json['booking_payments'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    data['service_type'] = this.serviceType;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    data['booking_date'] = this.bookingDate;
    data['booking_time'] = this.bookingTime;
    data['status'] = this.status;
    if (this.bookingPayments != null) {
      data['booking_payments'] = this.bookingPayments!.toJson();
    }
    return data;
  }
}

class Client {
  String? userId;
  String? email;
  String? fullName;
  PersonalInfo? personalInfo;

  Client({this.userId, this.email, this.fullName, this.personalInfo});

  Client.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    fullName = json['full_name'];
    personalInfo = json['personal_info'] != null
        ? new PersonalInfo.fromJson(json['personal_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['full_name'] = this.fullName;
    if (this.personalInfo != null) {
      data['personal_info'] = this.personalInfo!.toJson();
    }
    return data;
  }
}

class PersonalInfo {
  String? photo;
  String? phone;

  PersonalInfo({this.photo, this.phone});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['phone'] = this.phone;
    return data;
  }
}

class Service {
  String? serviceId;
  String? serviceType;
  String? price;

  Service({this.serviceId, this.serviceType, this.price});

  Service.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceType = json['service_type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['service_type'] = this.serviceType;
    data['price'] = this.price;
    return data;
  }
}

class Shop {
  String? shopName;
  String? photo;

  Shop({this.shopName, this.photo});

  Shop.fromJson(Map<String, dynamic> json) {
    shopName = json['shop_name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_name'] = this.shopName;
    data['photo'] = this.photo;
    return data;
  }
}

class BookingPayments {
  Null? paymentMethod;
  Null? amount;

  BookingPayments({this.paymentMethod, this.amount});

  BookingPayments.fromJson(Map<String, dynamic> json) {
    paymentMethod = json['payment_method'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_method'] = this.paymentMethod;
    data['amount'] = this.amount;
    return data;
  }
}
