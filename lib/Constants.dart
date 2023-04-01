import 'package:flutter/material.dart';

// -------------------------------  API ROUTES -------------------------------------------------//

const BASE_URL = "https://house-rental-backend.vercel.app";
const SIGNUP_REQUEST = "/api/users";
const LOGIN_REQUEST = "/api/users/login";
const GET_ALL_PROPERTIES_REQUEST = "/api/properties";
const GET_PROPERTIES_NEAR_YOU_REQUEST = "/api/properties/getPropertyByLocation";
const GET_TOP_RATED_PROPERTIES = "/api/properties/getTopRatedProperties";
const UPLOAD_PROPERTY = "/api/properties/";
const SAVE_PROPERTY = "/api/users/addtofav";
const UNSAVE_PROPERTY = "/api/users/removefromfav";
const CREATE_REQUEST = "/api/requests";

//----------------------------------COLORS/GRADIENT--------------------------------------------//

Gradient buttonLinearGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment(0.701, 0.714),
  colors: [Color(0xff917AFD), Color(0xff6246EA)],
);

LinearGradient primaryGradient =
    const LinearGradient(colors: [secondaryblue, primaryBlue]);

final Shader textLinearGradient = LinearGradient(
  colors: <Color>[Color(0xff917AFD), Color(0xff6246EA)],
).createShader(Rect.fromLTWH(0.0, 0.0, 0.701, 0.714));
//----------------------------------FONT------------------------------------------------//

double font_xs = 12;
double font_s = 14;
double font_m = 16.0;
double font_xm = 18;
double font_xxm = 20;
double font_l = 22;
double font_xl = 24;
double font_xxl = 28;

//-------------------------------PADDING---------------------------------------------//

double padding_xxxs = 8;
double padding_xxs = 10;
double padding_xs = 12;
double padding_m = 16;
double padding_xm = 18;
double padding_s = 14;
double padding_xxm = 20;
double padding_l = 22;
double padding_xl = 24;
double padding_xxl = 28;
double padding_4xl = 36;

//----------------------------COLOR------------------------------------------------//
const Color grey_text_color = Color(0xff7D7F88);
const Color foundation_white = Color(0xffFDFDFD);
const Color foundation_dark = Color(0xff1A1E25);
const Color grey_bg_color = Color(0xffF2F2F3);
const Color grey_border_color = Color(0xffE3E3E7);
const Color app_bg_color = Color(0xffE5E5E5);
const Color box_shadow_color = Color(0xff43434300);
const primaryBlue = Color(0xff6246EA);
const secondaryblue = Color(0xff937CFF);
