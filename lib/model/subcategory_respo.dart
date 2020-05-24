class SubCategoryRespo {
  String status;
  String message;
  List<Data> data;

  SubCategoryRespo({this.status, this.message, this.data});

  SubCategoryRespo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String catid;
  String subcatid;
  String subcategory;
  String vendorid;
  String vendorname;
  String location;
  String city;
  String country;
  String latitude;
  String longitude;
  Null distance;
  String logofile;
  String cuisinesStr;
  String amenitiesStr;
  List<String> cuisines;
  List<String> amenities;

  Data(
      {this.catid,
        this.subcatid,
        this.subcategory,
        this.vendorid,
        this.vendorname,
        this.location,
        this.city,
        this.country,
        this.latitude,
        this.longitude,
        this.distance,
        this.logofile,
        this.cuisinesStr,
        this.amenitiesStr,
        this.cuisines,
        this.amenities});

  Data.fromJson(Map<String, dynamic> json) {
    catid = json['catid'];
    subcatid = json['subcatid'];
    subcategory = json['subcategory'];
    vendorid = json['vendorid'];
    vendorname = json['vendorname'];
    location = json['location'];
    city = json['city'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    distance = json['distance'];
    logofile = json['logofile'];
    cuisinesStr = json['cuisinesStr'];
    amenitiesStr = json['amenitiesStr'];
    cuisines = json['cuisines'].cast<String>();
    amenities = json['amenities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catid'] = this.catid;
    data['subcatid'] = this.subcatid;
    data['subcategory'] = this.subcategory;
    data['vendorid'] = this.vendorid;
    data['vendorname'] = this.vendorname;
    data['location'] = this.location;
    data['city'] = this.city;
    data['country'] = this.country;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['distance'] = this.distance;
    data['logofile'] = this.logofile;
    data['cuisinesStr'] = this.cuisinesStr;
    data['amenitiesStr'] = this.amenitiesStr;
    data['cuisines'] = this.cuisines;
    data['amenities'] = this.amenities;
    return data;
  }
}