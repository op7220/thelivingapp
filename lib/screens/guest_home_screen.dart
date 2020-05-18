import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterlivingapp/api_services/home_screen_api.dart';
import 'package:flutterlivingapp/model/home_respo.dart';
import 'package:flutterlivingapp/screens/bottomNavigationBar.dart';
import 'package:flutterlivingapp/screens/splash_screen.dart';
import 'package:flutterlivingapp/styles/color.dart';
import 'package:flutterlivingapp/styles/color.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/images.dart';
import 'package:flutterlivingapp/styles/size_config.dart';
import 'package:flutterlivingapp/styles/strings.dart';
import 'package:flutterlivingapp/styles/text_style.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  bool isLogin=false;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0,
          backgroundColor: bg_color,
          leading: Icon(Icons.settings),
          title: isLogin?Text(userName,
              style: AppStyle.appBarTextStyle
          ):Text("Hello Guest",style: AppStyle.appBarTextStyle,),
          centerTitle: true,
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: d_5),
                child: Icon(Icons.search))
          ],
        ),
        preferredSize: Size.fromHeight(d_48),
      ),
      bottomNavigationBar: BottomNav(),
      body: data==null?Center(child: progressDialog()): WillPopScope(
        onWillPop: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SplashScreen()));
        },
        child:  Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(bottom: d_10),
                width: MediaQuery.of(context).size.width,
                child: top_banner_img,
              ),
            ),
            Expanded(
              flex: SizeConfig.widthMultiplier>400?6:5,
              child: GridView(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,mainAxisSpacing: d_4,crossAxisSpacing: d_4),
                children:data.data.map((userData) {
                  return Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Card(
                            elevation: d_3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(d_10),
                            ),
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width > 400 ? d_5 : d_3),

                            child: getCardByTitle(userData),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            Spacer(),
            bottomDesign()
          ],
        ),
      ),
    );
  }

  getCardByTitle(Data data) {
    /* String img = "";
    if (title == "Resturants")
      img = "image/resturant.png";
    else if (title == "NightLife")
      img = "image/nightlife.png";
    else if (title == "Fashion & Retails")
      img = "image/fashion.png";
    else if (title == "Beauty & Spa")
      img = "image/fitness.png";
    else if (title == "Leisure & Fitness")
      img = "image/beauty.png";
    else
      img = "image/vaccation.png";*/

    return  Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FittedBox(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.19,
            width: MediaQuery.of(context).size.width * 0.34,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(data.imagefile))),
          ),
        ),
      ],
    );
  }

  bottomDesign() {
    return Expanded(
      flex:MediaQuery.of(context).size.width>400?5:6,
      child: Column(
        children: <Widget>[
          Expanded(
            flex:MediaQuery.of(context).size.width>400?2:2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: banner,
            ),
          ),
          Expanded(
            flex:MediaQuery.of(context).size.width>400?4:4,
            child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: d_5, top: d_5),
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    shape: BoxShape.rectangle,
                    //  border: Border.all(color: Colors.black, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(d_10)),
                child: CarouselSlider.builder(
                  itemCount: 3,
                  autoPlay: true,

                  itemBuilder: (BuildContext context, int itemIndex) => Container(
                    child: banner_img,
                  ),
                )

            ),
          ),
          // Expanded(child: SizedBox(height: d_10,),),
          Opacity(
            opacity: widget.guest?1.0:0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: d_48,
              margin:widget.guest?EdgeInsets.only(top: d_2):EdgeInsets.only(top: d_40),

              decoration: BoxDecoration(
                color:bg_registerbtn,
                //border: Border.all(color: Colors.black, style: BorderStyle.solid),
              ),
              alignment: Alignment.center,
              child: Text(
                "Register Now",
                textAlign: TextAlign.center,
                style: AppStyle.subHeaderStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget progressDialog() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(backgroundColor: Colors.black,),
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

  void callSharedPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin =prefs.getBool('isLogin') ?? false;
    userName =prefs.getString('name') ?? "Not found";
  }
}
