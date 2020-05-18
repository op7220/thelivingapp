class BannerRespo {
  String status;
  String message;
  List<Data> data;

  BannerRespo({this.status, this.message, this.data});

  BannerRespo.fromJson(Map<String, dynamic> json) {
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
  String imageUrl;
  String linkUrl;

  Data({this.imageUrl, this.linkUrl});

  Data.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    linkUrl = json['linkUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['linkUrl'] = this.linkUrl;
    return data;
  }
}