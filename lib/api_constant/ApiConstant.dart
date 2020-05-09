class ApiConstant{
  //urls
    static final String BASE_URL = "http://living.indo3dworld.com/api/";

  //apis

  static String UPDATE_USER_URL=BASE_URL + "UpdateUser";

  static final String REGISTER = "register";
  static final String LOGIN = "loginService";
  static final String FORGET_PASSWORD = "forgot_password";
  static final String GET_NEWS = "get_all_news";




    static String getBaseURL(String api)
  {
    return BASE_URL+api.toString();
  }
}