import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterlivingapp/api_services/home_screen_api.dart';
import 'package:flutterlivingapp/model/banner_respo.dart';
import 'package:flutterlivingapp/model/home_respo.dart';
import 'package:flutterlivingapp/model/listclass.dart';
import 'package:flutterlivingapp/screens/bottomNavigationBar.dart';
import 'package:flutterlivingapp/screens/signup_screen.dart';
import 'package:flutterlivingapp/screens/sub_category.dart';
import 'package:flutterlivingapp/screens/splash_screen.dart';
import 'package:flutterlivingapp/styles/color.dart';
import 'package:flutterlivingapp/styles/color.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/images.dart';
import 'package:flutterlivingapp/styles/size_config.dart';
import 'package:flutterlivingapp/styles/strings.dart';
import 'package:flutterlivingapp/styles/text_style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuestHomeScreen extends StatefulWidget {
  bool guest;

  GuestHomeScreen({this.guest});

  @override
  _GuestHomeScreenState createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen> {
  bool connectionResult = false;
  HomeRespo data;
  BannerRespo bannerRespo;
  bool isLogin = false;
  var userName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callSharedPref();
    checkConnectivity();
  }

  checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      print(connectivityResult);
      homeApi();
    } else {
      Fluttertoast.showToast(msg: noConnection);
    }
  }

  //api calling
  homeApi() {
    HomeScreenApi().getHomeApiData(context).then((resp) {
      if (!mounted) return;
      if (resp != null) {
        data = resp;
        setState(() {});
      }
    });

    HomeScreenApi().getBannerData(context).then((respo) {
      if (!mounted) return;
      if (respo != null) {
        bannerRespo = respo;
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
          leading: Icon(Icons.settings),
          title: isLogin
              ? Text(userName, style: AppStyle.appBarTextStyle)
              : Text(
                  "Hello Guest",
                  style: AppStyle.appBarTextStyle,
                ),
          centerTitle: true,
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: d_5), child: Icon(Icons.search))
          ],
        ),
        preferredSize: Size.fromHeight(d_48),
      ),
      //  bottomNavigationBar: BottomNav(),
      body: data == null
          ? Center(child: progressDialog())
          : WillPopScope(
              onWillPop: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SplashScreen()));
              },
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: d_10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width > 400
                            ? d_220
                            : d_182,
                        child: top_banner_img,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.width > 400
                            ? 89.5
                            : 73,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SplashScreen()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width > 400
                                ? d_52
                                : d_44,
                            margin: EdgeInsets.only(top: d_0),
                            decoration: BoxDecoration(
                              color: bg_registerbtn,
                              //border: Border.all(color: Colors.black, style: BorderStyle.solid),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "REGISTER NOW",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(fontSize: d_15,color: Colors.white,fontWeight: FontWeight.w400)/*TextStyle(
                                  fontSize: d_15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),*/
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: getCardByTitle(data),
                  ),
                  /*Expanded(
              child:   bottomDesign(),
            )*/
                  bottomDesign()
                ],
              ),
            ),
    );
  }

  getCardByTitle(HomeRespo data) {

    return Padding(
      padding: MediaQuery.of(context).size.width > 400 ? pd_2 : pd_10,
      child: GridView.builder(
        itemCount: data.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 3,
            crossAxisSpacing: d_10,
            mainAxisSpacing: d_10,
            childAspectRatio: 1.1),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {

              print(data.data[index].subCategoriesList.length);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubCategory(homeData:data.data[index], guestLogin: widget.guest)));
            },
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  // padding: pd_2,
                  margin: EdgeInsets.only(left: d_2, right: d_2),
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          data.data[index].imagefile,
                        ),
                        fit: BoxFit.fill),
                    // borderRadius: BorderRadius.circular(d_10)
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            MediaQuery.of(context).size.width > 600 ? 25 : 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bottomDesign() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: banner,
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width>400?d_120:d_90,
            margin:
                EdgeInsets.only(bottom: d_5, top: d_5, left: d_2, right: d_2),
            padding: pd_2,
            decoration: BoxDecoration(

                // border: Border.all(color: Colors.black, style: BorderStyle.solid),
                // borderRadius: BorderRadius.circular(d_10)
                ),
            child: bannerRespo == null
                ? Container()
                : CarouselSlider.builder(
                    itemCount: bannerRespo.data.length,
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1.0,
                    ),
                    itemBuilder: (BuildContext context, int itemIndex) =>
                        Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  bannerRespo.data[itemIndex].imageUrl),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(d_10)),
                    ),
                  )),
      ],
    );
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

  void callSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool('isLogin') ?? false;
    userName = prefs.getString('name') ?? "Not found";
  }
}
