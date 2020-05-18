class SetterGetter
{
 //accessToken
  static String accessToken;

  String getAccessToken() {
    print("Access Token from login=======>${accessToken}");
    return accessToken;
  }

  void setAccessToken(String token) {
    accessToken = token;
  }

  //name
  static String name;

  String getName() {
    print(name);
    return name;
  }

  void setName(String nme) {
    name = nme;
  }

  //email
  static String email;

  String getEmail() {
    print(email);
    return email;
  }

  void setEmail(String mail) {
    email = mail;
  }

  //userId
  static int userId;

  int getUserId() {
    print(userId);
    return userId;
  }

  void setUserId(int id) {
    userId = id;
  }

  //mobileNo
  static String mobileNo;

  String getMobile() {
    print(mobileNo);
    return mobileNo;
  }

  void setMobile(String mobile) {
    mobileNo = mobile;
  }

  //countryCode
  static String countryCode;

  String getCountryCode() {
    print(countryCode);
    return countryCode;
  }

  void setCountryCode(String ccp) {
    countryCode = ccp;
  }

  //push notifiaction token
  static String pushNotToken;

  String getPushToken() {
    return pushNotToken;
  }

  void setPushToken(String token) {
    pushNotToken = token;
  }

  //is_subscribed
  static int isSubscribed;

  int getIsSubscribed() {
    print(isSubscribed);
    return isSubscribed;
  }

  void setIsSubscribed(int is_Subscribed) {
    isSubscribed = is_Subscribed;
  }
}