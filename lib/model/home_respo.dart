
class  HomeRespo{
  String status;
  String message;
  List<Data> data;

  HomeRespo({this.status, this.message, this.data});

  HomeRespo.fromJson(Map<String, dynamic> json) {
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
  int id;
  String name;
  String imagefile;
  int codestart;
  List<SubCategoriesList> subCategoriesList;

  Data(
      {this.id,
        this.name,
        this.imagefile,
        this.codestart,
        this.subCategoriesList});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagefile = json['imagefile'];
    codestart = json['codestart'];
    if (json['subCategoriesList'] != null) {
      subCategoriesList = new List<SubCategoriesList>();
      json['subCategoriesList'].forEach((v) {
        subCategoriesList.add(new SubCategoriesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imagefile'] = this.imagefile;
    data['codestart'] = this.codestart;
    if (this.subCategoriesList != null) {
      data['subCategoriesList'] =
          this.subCategoriesList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategoriesList {
  int id;
  String name;
  String imagefile;

  SubCategoriesList({this.id, this.name, this.imagefile});

  SubCategoriesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagefile = json['imagefile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imagefile'] = this.imagefile;
    return data;
  }
}