class ApiConstant{
  //urls
    static final String BASE_URL = "http://3.17.203.133/api/";

  //apis

  static String UPDATE_USER_URL=BASE_URL + "UpdateUser";

  static final String REGISTER = "register";
  static final String LOGIN = "login";
  static final String FORGET_PASSWORD = "forgot_password";
  static final String GET_NEWS = "get_all_news";
  static final String CHANGE_PASSWORD = "change_password";
  static final String GET_NEWS_DETAILS="get_news_detail";
  static final String DASHBOARD="dashboard";
  static final String MARKET_VIEW="market_view";
  static final String VERIFY_OTP="verify_otp";
  static final String FEED_BACK="feedback";
  static final String RESEND_OTP="send_otp";
  static final String SUBSCRIPTION="add_subscription";
  static final String NOTIFICATION="notifications";
  static final String LOGOUT="logout";
  static final String SUBSCRIPTION_DETAIL="subscription_detail";
  static final String LOGIN_USING_FACE="login_using_face";





    static String getBaseURL(String api)
  {
    return BASE_URL+api.toString();
  }
}