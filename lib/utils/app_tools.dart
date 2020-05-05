import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterlivingapp/styles/color.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/images.dart';
import 'package:flutterlivingapp/styles/text_style.dart';
import 'package:flutterlivingapp/utils/progressdialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget appTextField(
    {IconData textIcon,
    String textHint,
    bool isPassword,
    double sidePadding,
    TextInputType textType,
    TextEditingController controller}) {
  sidePadding == null ? sidePadding = 0.0 : sidePadding;
  textHint == null ? textHint = "" : textHint;
  //textType == null ? textType == TextInputType.text : textType;

  return Padding(
    padding: new EdgeInsets.only(left: sidePadding, right: sidePadding),
    child: new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
      ),
      child: new TextField(
        controller: controller,
        obscureText: isPassword == null ? false : isPassword,
        keyboardType: textType == null ? TextInputType.text : textType,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: textHint,
          prefixIcon: textIcon == null ? new Container() : new Icon(textIcon),
        ),
      ),
    ),
  );
}

Widget appButton(
    {String btnTxt,
    double btnPadding,
    Color btnColor,
    VoidCallback onBtnclicked}) {
  btnTxt == null ? btnTxt == "" : btnTxt;
  btnPadding == null ? btnPadding = d_0 : btnPadding;
  btnColor == null ? btnColor = Colors.black : btnColor;

  return Padding(
    padding: new EdgeInsets.all(btnPadding),
    child: new RaisedButton(
      color: buttonColor,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.all(new Radius.circular(d_8))),
      onPressed: onBtnclicked,
      child: Container(
        height: d_48,
        child: new Center(
          child: new Text(
            btnTxt,
            style: new TextStyle(
                color: btnColor, fontSize: d_16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ),
  );
}

Widget headerTitle({String textTitle}) {
  textTitle == null ? textTitle = "" : textTitle;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        alignment: Alignment.topLeft,
        child: Text(
          textTitle,
          style: headerStyle,
        ),
      ),
    ],
  );
}

Widget textTitle({String title}) {
  title == null ? title = "" : title;
  return Container(
    child: Text(
      title,
      style: TextStyle(fontSize: d_14, color: greyishThree),
    ),
  );
}

Widget productTextField(
    {String textTitle,
    String textHint,
    double height,
    TextEditingController controller,
    TextInputType textType}) {
  textTitle == null ? textTitle = "Enter Title" : textTitle;
  textHint == null ? textHint = "Enter Hint" : textHint;
  height == null ? height = 50.0 : height;
  //height !=null

  return Column(
    //mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          textTitle,
          style:
              new TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      new Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: new Container(
          height: height,
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Colors.white),
              borderRadius: new BorderRadius.all(new Radius.circular(4.0))),
          child: new Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new TextField(
              controller: controller,
              keyboardType: textType == null ? TextInputType.text : textType,
              decoration: new InputDecoration(
                  border: InputBorder.none, hintText: textHint),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget productDropDown(
    {String textTitle,
    String selectedItem,
    List<DropdownMenuItem<String>> dropDownItems,
    ValueChanged<String> changedDropDownItems}) {
  textTitle == null ? textTitle = "Enter Title" : textTitle;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          textTitle,
          style:
              new TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Colors.white),
              borderRadius: new BorderRadius.all(new Radius.circular(4.0))),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: new DropdownButtonHideUnderline(
                child: new DropdownButton(
              value: selectedItem,
              items: dropDownItems,
              onChanged: changedDropDownItems,
            )),
          ),
        ),
      ),
    ],
  );
}

Widget MultiImagePickerMap(
    {Map<int, File> imageList,
    VoidCallback addNewImage(int position),
    VoidCallback removeNewImage(int position)}) {
  int imageLength = imageList.isEmpty ? 1 : imageList.length + 1;
  bool isNull = imageList.isEmpty ? true : false;

  print("Image length is $imageLength");

  return new Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: new SizedBox(
      height: 150.0,
      child: new ListView.builder(
          itemCount: imageLength,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return imageList.isEmpty || imageList[index] == null
                ? new Padding(
                    padding: new EdgeInsets.only(left: 3.0, right: 3.0),
                    child: new GestureDetector(
                      onTap: () {
                        addNewImage(index);
                      },
                      child: new Container(
                        width: 150.0,
                        height: 150.0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            new Icon(
                              Icons.image,
                              size: 150.0,
                              color: Theme.of(context).primaryColor,
                            ),
                            new Icon(
                              Icons.add_circle,
                              size: 25.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                        ),
                      ),
                    ),
                  )
                : new Padding(
                    padding: new EdgeInsets.only(left: 3.0, right: 3.0),
                    child: new Stack(
                      children: <Widget>[
                        new Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: new BoxDecoration(
                              color: Colors.grey.withAlpha(100),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(15.0)),
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: new FileImage(imageList[index]))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: new CircleAvatar(
                            backgroundColor: Colors.red[600],
                            child: new IconButton(
                                icon: new Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  removeNewImage(index);
                                }),
                          ),
                        )
                      ],
                    ),
                  );
          }),
    ),
  );
}

Widget MultiImagePickerList(
    {List<File> imageList, VoidCallback removeNewImage(int position)}) {
  return new Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: imageList == null || imageList.length == 0
        ? new Container()
        : new SizedBox(
            height: 150.0,
            child: new ListView.builder(
                itemCount: imageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return new Padding(
                    padding: new EdgeInsets.only(left: 3.0, right: 3.0),
                    child: new Stack(
                      children: <Widget>[
                        new Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: new BoxDecoration(
                              color: Colors.grey.withAlpha(100),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(15.0)),
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: new FileImage(imageList[index]))),
                        ),
                        new Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: new CircleAvatar(
                            backgroundColor: Colors.red[600],
                            child: new IconButton(
                                icon: new Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  removeNewImage(index);
                                }),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
  );
}

Widget buildImages({int index, Map imagesMap}) {
  return imagesMap.isEmpty
      ? new Container(
          width: 150.0,
          height: 150.0,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new Icon(
                Icons.image,
                size: 100.0,
                color: Colors.white,
              ),
              new Icon(
                Icons.add_circle,
                color: Colors.grey,
              ),
            ],
          ),
          decoration: new BoxDecoration(
            color: Colors.grey.withAlpha(100),
          ),
        )
      : imagesMap[index] != null
          ? new Container(
              width: 150.0,
              height: 150.0,
              decoration: new BoxDecoration(
                  color: Colors.grey.withAlpha(100),
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new FileImage(imagesMap[index]))),
            )
          : new Container(
              width: 150.0,
              height: 150.0,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.image,
                    size: 100.0,
                    color: Colors.white,
                  ),
                  new Icon(
                    Icons.add_circle,
                    color: Colors.grey,
                  ),
                ],
              ),
              decoration: new BoxDecoration(
                color: Colors.grey.withAlpha(100),
              ),
            );
}

List<DropdownMenuItem<String>> buildAndGetDropDownItems(List size) {
  List<DropdownMenuItem<String>> items = new List();
  for (String size in size) {
    items.add(new DropdownMenuItem(value: size, child: new Text(size)));
  }
  return items;
}

showSnackBar(String message, final scaffoldKey) {
  scaffoldKey.currentState.showSnackBar(new SnackBar(
    backgroundColor: Colors.red[600],
    content: new Text(
      message,
      style: new TextStyle(color: Colors.white),
    ),
  ));
}
showFluutterToast(String msg)
{
  Fluttertoast.showToast(msg: msg,gravity:ToastGravity.BOTTOM ,timeInSecForIos: 10,toastLength: Toast.LENGTH_LONG,fontSize: 20.0);
}

displayProgressDialog(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      pageBuilder: (BuildContext context, _, __) {
        return new ProgressDialog();
      }));
}
displayProgressDialogDetail(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      pageBuilder: (BuildContext context, _, __) {
        return new ProgressDialogDetailPage();
      }));
}

closeProgressDialog(BuildContext context) {
  Navigator.of(context).pop();
}

writeDataLocally({String key, String value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

writeBoolDataLocally({String key, bool value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setBool(key, value);
}

getBoolDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getBool(key) == null ? false : localData.getBool(key);
}

Future<String> getDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

setSharedPreferenceUserName({String key, String value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

Future<String> getSharedPreferenceUserName({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

setSharedPreferenceUserMobileNo({String key, String value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

getSharedPreferenceMobileNo({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

setSharedPreferenceCountryCode({String key, String value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

getSharedPreferenceCountryCode({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

clearDataLocally() async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.clear();
}

Widget divider() {
  return Divider(
    height: d_1,
    color: whiteTwo,
  );
}

Widget listContent(String text) {
  return Container(
    height: 30.0,
    padding: pd_20_0_0_0,
    child: Center(
      child: Align(
        alignment: Alignment.centerLeft,
        child:
            Text(text, style: TextStyle(fontSize: d_18, color: greyishBrown)),
      ),
    ),
  );
}

Widget appbar(String text) {
  return AppBar(
    elevation: d_2,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(
      text,
      style: TextStyle(fontSize: d_20, fontWeight: FontWeight.w700),
    ),
    actions: <Widget>[
      Align(
        alignment: Alignment.centerRight,
        child: Container(
            //width: d_40,
            child: sailLogo
        ),
      ),
      Container(
        width: d_10,
      ),
    ],
  );
}

Widget subscriptionDetail(
    BuildContext context, String subsPlan, String subsMonth, String cost,bool checkBox,bool first,bool second,bool third) {
  return Padding(
    padding: pd_5,
    child: Column(
      children: <Widget>[
        // buildCircularCheckBox(),

        Row(
          children: <Widget>[
            Text(
              subsPlan,
              style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.width > 400 ? d_24 : d_18,
                  color: Colors.black),
            ),
            Text(
              subsMonth,
              style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.width > 400 ? d_18 : d_14,
                  color: Colors.black),
            )
          ],
        ),
        SizedBox(
          height: d_10,
        ),
        Container(
          child: Text(
            "Get all details of ${subsPlan} Subscription",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width > 400 ? d_14 : d_14,
                color: greyishBrown),
          ),
        ),
        SizedBox(
          height: d_10,
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(bottom: d_0),
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Cost-",
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width > 400 ? d_14 : d_14,
                      color: brownishGreyTwo,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: Text(
                  "\u0024${cost}",
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width > 400 ? d_14 : d_14,
                      fontWeight: FontWeight.w500,
                      color: brownishGreyTwo),
                ),
              ),
              Spacer(),
              CheckBoxSubscription(first,second,third),
            ],
          ),
        ),
      ],
    ),
  );
}

class CheckBoxSubscription extends StatefulWidget {

  bool first,second,third;

  CheckBoxSubscription(this.first, this.second, this.third);

  @override
  _CheckBoxSubscriptionState createState() => _CheckBoxSubscriptionState(first,second,third);
}

class _CheckBoxSubscriptionState extends State<CheckBoxSubscription> {

  bool first,second,third;
bool value;
  _CheckBoxSubscriptionState(this.first, this.second, this.third);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(first==true && second==false && third ==false){

        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: d_5),
        decoration: BoxDecoration(shape: BoxShape.circle, color: trueGreen),
        child: Padding(
          padding: const EdgeInsets.all(d_4),
          child: first
              ? checkboxImage:Container(),
        ),
      ),
    );
  }
}
