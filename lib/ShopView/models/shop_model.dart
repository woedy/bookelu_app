class ShopModel {
  String? message;
  Data? data;

  ShopModel({this.message, this.data});

  ShopModel.fromJson(Map<String, dynamic> json) {
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
  String? shopId;
  String? shopName;
  String? email;
  String? businessType;
  String? country;
  String? phone;
  String? description;
  String? businessDays;
  String? businessHoursOpen;
  String? businessHoursClose;
  String? specialFeatures;
  String? photo;
  String? streetAddress1;
  String? streetAddress2;
  String? city;
  String? state;
  String? zipcode;
  String? locationName;
  String? lat;
  String? lng;
  String? rating;
  bool? open;
  List<ShopServices>? shopServices;
  List<ShopInterior>? shopInterior;
  List<ShopInterior>? shopExterior;
  List<ShopInterior>? shopWork;
  List<ShopStaffs>? shopStaffs;
  List<ShopPackages>? shopPackages;

  Data(
      {this.shopId,
        this.shopName,
        this.email,
        this.businessType,
        this.country,
        this.phone,
        this.description,
        this.businessDays,
        this.businessHoursOpen,
        this.businessHoursClose,
        this.specialFeatures,
        this.photo,
        this.streetAddress1,
        this.streetAddress2,
        this.city,
        this.state,
        this.zipcode,
        this.locationName,
        this.lat,
        this.lng,
        this.rating,
        this.open,
        this.shopServices,
        this.shopInterior,
        this.shopExterior,
        this.shopWork,
        this.shopStaffs,
        this.shopPackages});

  Data.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    email = json['email'];
    businessType = json['business_type'];
    country = json['country'];
    phone = json['phone'];
    description = json['description'];
    businessDays = json['business_days'];
    businessHoursOpen = json['business_hours_open'];
    businessHoursClose = json['business_hours_close'];
    specialFeatures = json['special_features'];
    photo = json['photo'];
    streetAddress1 = json['street_address1'];
    streetAddress2 = json['street_address2'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    locationName = json['location_name'];
    lat = json['lat'];
    lng = json['lng'];
    rating = json['rating'];
    open = json['open'];
    if (json['shop_services'] != null) {
      shopServices = <ShopServices>[];
      json['shop_services'].forEach((v) {
        shopServices!.add(new ShopServices.fromJson(v));
      });
    }
    if (json['shop_interior'] != null) {
      shopInterior = <ShopInterior>[];
      json['shop_interior'].forEach((v) {
        shopInterior!.add(new ShopInterior.fromJson(v));
      });
    }
    if (json['shop_exterior'] != null) {
      shopExterior = <ShopInterior>[];
      json['shop_exterior'].forEach((v) {
        shopExterior!.add(new ShopInterior.fromJson(v));
      });
    }
    if (json['shop_work'] != null) {
      shopWork = <ShopInterior>[];
      json['shop_work'].forEach((v) {
        shopWork!.add(new ShopInterior.fromJson(v));
      });
    }
    if (json['shop_staffs'] != null) {
      shopStaffs = <ShopStaffs>[];
      json['shop_staffs'].forEach((v) {
        shopStaffs!.add(new ShopStaffs.fromJson(v));
      });
    }
    if (json['shop_packages'] != null) {
      shopPackages = <ShopPackages>[];
      json['shop_packages'].forEach((v) {
        shopPackages!.add(new ShopPackages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['email'] = this.email;
    data['business_type'] = this.businessType;
    data['country'] = this.country;
    data['phone'] = this.phone;
    data['description'] = this.description;
    data['business_days'] = this.businessDays;
    data['business_hours_open'] = this.businessHoursOpen;
    data['business_hours_close'] = this.businessHoursClose;
    data['special_features'] = this.specialFeatures;
    data['photo'] = this.photo;
    data['street_address1'] = this.streetAddress1;
    data['street_address2'] = this.streetAddress2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['location_name'] = this.locationName;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['rating'] = this.rating;
    data['open'] = this.open;
    if (this.shopServices != null) {
      data['shop_services'] =
          this.shopServices!.map((v) => v.toJson()).toList();
    }
    if (this.shopInterior != null) {
      data['shop_interior'] =
          this.shopInterior!.map((v) => v.toJson()).toList();
    }
    if (this.shopExterior != null) {
      data['shop_exterior'] =
          this.shopExterior!.map((v) => v.toJson()).toList();
    }
    if (this.shopWork != null) {
      data['shop_work'] = this.shopWork!.map((v) => v.toJson()).toList();
    }
    if (this.shopStaffs != null) {
      data['shop_staffs'] = this.shopStaffs!.map((v) => v.toJson()).toList();
    }
    if (this.shopPackages != null) {
      data['shop_packages'] =
          this.shopPackages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShopServices {
  String? serviceType;

  ShopServices({this.serviceType});

  ShopServices.fromJson(Map<String, dynamic> json) {
    serviceType = json['service_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_type'] = this.serviceType;
    return data;
  }
}

class ShopInterior {
  String? photo;

  ShopInterior({this.photo});

  ShopInterior.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    return data;
  }
}

class ShopStaffs {
  String? staffName;
  String? photo;
  String? role;
  int? rating;

  ShopStaffs({this.staffName, this.photo, this.role, this.rating});

  ShopStaffs.fromJson(Map<String, dynamic> json) {
    staffName = json['staff_name'];
    photo = json['photo'];
    role = json['role'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staff_name'] = this.staffName;
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['rating'] = this.rating;
    return data;
  }
}

class ShopPackages {
  String? packageName;
  String? price;
  String? photo;
  int? rating;

  ShopPackages({this.packageName, this.price, this.photo, this.rating});

  ShopPackages.fromJson(Map<String, dynamic> json) {
    packageName = json['package_name'];
    price = json['price'];
    photo = json['photo'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_name'] = this.packageName;
    data['price'] = this.price;
    data['photo'] = this.photo;
    data['rating'] = this.rating;
    return data;
  }
}
