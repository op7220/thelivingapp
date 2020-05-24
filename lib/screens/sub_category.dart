import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterlivingapp/api_services/subcategory_api.dart';
import 'package:flutterlivingapp/model/home_respo.dart';
import 'package:flutterlivingapp/model/home_respo.dart' as prefix0;
import 'package:flutterlivingapp/model/home_sub_cat.dart';
import 'package:flutterlivingapp/model/listclass.dart';
import 'package:flutterlivingapp/model/subcategory_respo.dart';
import 'package:flutterlivingapp/model/subcategory_respo.dart' as prefix1;
import 'package:flutterlivingapp/styles/color.dart';
import 'package:flutterlivingapp/styles/color.dart' as prefix2;
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/listbean.dart';
import 'package:flutterlivingapp/styles/strings.dart';
import 'package:flutterlivingapp/styles/text_style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' show cos, sqrt, asin;


class SubCategory extends StatefulWidget {
  var subCatId;
  prefix0.Data homeData;
  bool guestLogin;

  SubCategory({this.homeData, this.guestLogin});

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  SubCategoryRespo data;
  HomeSubCategory homeSubCategory;
  bool isLike = false;
  List<ListItem<String>> list;
  double lat,long;
  var index;
  //Position _currentPosition;
  //final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnectivity();
   // _getCurrentLocation();
  }
  /*_getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

    }).catchError((e) {
      print(e);
    });
  }*/
  checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      print(connectivityResult);
      //print(widget.subCatId);
      mainSubCAtegoryApi();
      Future.delayed(Duration(seconds: 1)).then((value) {
        subCategoryApi();
      });

    } else {
      Fluttertoast.showToast(msg: noConnection);
    }
  }
  //mainsubapi calling
  mainSubCAtegoryApi() {
    SubCategoryApi().getMainSubCatApi(context, widget.homeData.id).then((resp) {
      if (!mounted) return;
      if (resp != null) {
        homeSubCategory = resp;
        print(widget.homeData.id);
        print("==>${homeSubCategory.data.length}");
        setState(() {});
      }
    });
  }

  //api calling
  subCategoryApi() {
    SubCategoryApi().getSubCatApiData(context, widget.homeData.subCategoriesList[0].id).then((resp) {
      if (!mounted) return;
      if (resp != null) {
        data = resp;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0,
          backgroundColor: bg_color,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.homeData.name == null ? "" : widget.homeData.name,
              style: AppStyle.appBarTextStyle),
          centerTitle: true,
          actions: <Widget>[
            Container(
                height: d_20,
                width: d_20,
                margin: EdgeInsets.only(right: d_10),
                child: Image.asset("image/filter.png")),
            Container(
                margin: EdgeInsets.only(right: d_8), child: Icon(Icons.search)),
          ],
        ),
        preferredSize: Size.fromHeight(d_48),
      ),
      body: homeSubCategory == null
          ? Center(child: progressDialog())
          : WillPopScope(
              onWillPop: () {
                Navigator.pop(context);
              },
              child:Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width > 400
                              ? d_100
                              : d_80,
                          padding: pd_10,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("image/sub_cat_banner.jpg"),
                                  fit: BoxFit.fill)),
                          child: ListView.builder(
                            itemCount:homeSubCategory.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, position) {
                              return FittedBox(
                                child: Container(
                                    height:
                                        MediaQuery.of(context).size.width > 400
                                            ? d_52
                                            : d_45,
                                    width:
                                        MediaQuery.of(context).size.width > 400
                                            ? d_60
                                            : d_48,
                                    margin: EdgeInsets.only(
                                        left: d_10, right: d_10),
                                    padding: pd_8,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "image/circle_gap.png"))),
                                    alignment: Alignment.centerLeft,
                                    child: Center(
                                      child: Text(
                                          widget.homeData.subCategoriesList[position].name,
                                          style: GoogleFonts.montserrat(
                                              fontSize: MediaQuery.of(context).size.width > 400? d_8
                                                  : d_8,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center),
                                    )),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: d_10,
                        ),
                       data==null? Center(child: progressDialog()):
                           data.data.length==0?Container(
                               margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
                               child: Center(child: Text("No Data Found",style: GoogleFonts.quando(fontSize: d_20,color: Colors.black,fontWeight: FontWeight.w400),),)): Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.data.length,
                              itemBuilder: (context, position) {
                                populateData(data.data);
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: d_10, vertical: d_2),
                                  // margin: EdgeInsets.only(top: d_5),
                                  decoration: new BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.transparent,
                                      )
                                    ],
                                  ),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(d_15)),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: d_10, vertical: d_10),
                                        child: Stack(
                                          children: <Widget>[
                                            ListTile(
                                              leading: Container(
                                                width: d_52,
                                                height: d_52,
                                                child: CircleAvatar(
                                                  foregroundColor: Colors.green,
                                                  child: Image.network(
                                                    data.data[position]
                                                        .logofile,
                                                    scale: 1.0,
                                                  ),
                                                ),
                                              ),
                                              title: Text(
                                                  data.data[position]
                                                      .vendorname,
                                                  style: GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width >
                                                                  400
                                                              ? d_18
                                                              : d_16)),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: <Widget>[
                                                  Container(
                                                    //width: MediaQuery.of(context).size.width/2,
                                                    padding: EdgeInsets.only(
                                                        top: d_2),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                            height: d_18,
                                                            width: d_18,
                                                            child: Image.asset(
                                                              "image/location.png",
                                                              scale: 1,
                                                            )),
                                                        Expanded(
                                                            child: Text(
                                                          data.data[position]
                                                              .city,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black87,
                                                              fontSize: MediaQuery.of(context).size.width > 400
                                                                  ? d_14
                                                                  : d_12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ))
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: d_15,
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: d_4),
                                                      child: Text(
                                                        data.data[position]
                                                            .country,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: d_14),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              right: d_4,
                                              child: GestureDetector(
                                                onTap: () {
                                                  index = position;
                                                  setState(() {});
                                                },
                                                child:
                                                    /*index==position?Container(height: d_30,width: d_30,
                                   child:Image.asset("image/filled_heart.png",scale: 1,)):*/
                                                    Container(
                                                        height: d_30,
                                                        width: d_30,
                                                        child: Image.asset(
                                                          "image/blank_heart.png",
                                                          scale: 1,
                                                        )),
                                              ),
                                            ),
                                            Positioned(
                                              right: d_0,
                                              bottom: d_0,
                                              child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: d_10),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                          height: d_15,
                                                          width: d_15,
                                                          child: Image.asset(
                                                            "image/navigation.png",
                                                            scale: 1,
                                                          )),
                                                      SizedBox(
                                                        width: d_5,
                                                      ),

                                                      Text(
                                                        double.parse(data.data[position].longitude.replaceAll("-", "")).toStringAsFixed(2)+" KM",
                                                        style: TextStyle(
                                                            color: Colors.amber,
                                                            fontSize: d_13),
                                                      )
                                                    ],
                                                  )),
                                            )
                                          ],
                                        )),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
            ),
    );
  }
  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }
  Widget progressDialog() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.black,
          ),
        ),
        SizedBox(
          height: d_15,
        ),
        Text(
          "please wait...",
          style: new TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  void populateData(List<prefix1.Data> data) {
    list = [];
    for (int i = 0; i < data.length; i++) list.add(ListItem<String>("$i"));
  }
}
