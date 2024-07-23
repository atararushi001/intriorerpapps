import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_font.dart';

class AppDefaults {

  static TextStyle textStyleBold30 ({Color? fontColor})  => TextStyle(
      fontSize: 30.0,
      fontFamily: AppFonts.poppinsBold,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleSemiBold20 ({Color? fontColor})  => TextStyle(
      fontSize: 20.0,
      fontFamily: AppFonts.poppinsSemiBold,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleBold20 ({Color? fontColor})  => TextStyle(
      fontSize: 20.0,
      fontFamily: AppFonts.poppinsBold,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleSemiBold24 ({Color? fontColor})  => TextStyle(
      fontSize: 24.0,
      fontFamily: AppFonts.poppinsSemiBold,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleSemiBold18 ({Color? fontColor})  => TextStyle(
      fontSize: 18.0,
      fontFamily: AppFonts.poppinsSemiBold,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleSemiBold14 ({Color? fontColor})  => TextStyle(
      fontSize: 14.0,
      fontFamily: AppFonts.poppinsSemiBold,
      color: fontColor ?? AppColors.textBlack
  );   static TextStyle textStyleSemiBold10 ({Color? fontColor})  => TextStyle(
      fontSize: 10.0,
      fontFamily: AppFonts.poppinsSemiBold,
      color: fontColor ?? AppColors.textBlack
  ); static TextStyle textStyleBold14 ({Color? fontColor})  => TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
      fontFamily: AppFonts.poppinsBold,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleBold16 ({Color? fontColor})  => TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
      fontFamily: AppFonts.poppinsBold,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleMedium12 ({Color? fontColor})  => TextStyle(
      fontSize: 12.0,
      fontFamily: AppFonts.poppinsMedium,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleMediumT14 ({Color? fontColor})  => TextStyle(
      fontSize: 14.0,
      fontFamily: AppFonts.poppinsMedium,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleMedium16 ({Color? fontColor})  => TextStyle(
      fontSize: 16.0,
      fontFamily: AppFonts.poppinsMedium,
      color: fontColor ?? AppColors.textBlack
  ); static TextStyle textStyleSemiBold16 ({Color? fontColor})  => TextStyle(
      fontSize: 16.0,
      fontFamily: AppFonts.poppinsSemiBold,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleMedium20 ({Color? fontColor})  => TextStyle(
      fontSize: 20.0,
      fontFamily: AppFonts.poppinsMedium,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleRegular14 ({Color? fontColor})  => TextStyle(
      fontSize: 14.0,
      fontFamily: AppFonts.poppinsRegular,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleRegular12 ({Color? fontColor})  => TextStyle(
      fontSize: 12.0,
      fontFamily: AppFonts.poppinsRegular,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleBoldT12 ({Color? fontColor})  => TextStyle(
      fontSize: 12.0,
      fontFamily: AppFonts.poppinsBold,
      color: fontColor ?? AppColors.textBlack
  );
  static TextStyle textStyleBold12 = const TextStyle(
      fontSize: 12.0,
      fontFamily: AppFonts.poppinsBold,
      color: Colors.white
  );
  static TextStyle textStyleMedium14 = const TextStyle(
      fontSize: 14.0,
      fontFamily: AppFonts.poppinsMedium,
      color: AppColors.textBlack
  );
  static TextStyle hintTextMedium12 = TextStyle(
      fontSize: 12.0,
      fontFamily: AppFonts.poppinsRegular,
      color: AppColors.textHint.withOpacity(0.5)
  );
  static TextStyle textFieldSemiBold14 = const TextStyle(
      fontSize: 14.0,
      fontFamily: AppFonts.poppinsSemiBold,
      color: AppColors.textHint
  );
  static TextStyle textFieldRegular14 = const TextStyle(
      fontSize: 14.0,
      fontFamily: AppFonts.poppinsRegular,
      color: AppColors.textHint
  );
  static TextStyle textFieldBold16 = const TextStyle(
      fontSize: 16.0,
      fontFamily: AppFonts.poppinsRegular,
      decoration: TextDecoration.underline,
      color: AppColors.textHint
  );
  static TextStyle textRegular10 = const TextStyle(
      fontSize: 10.0,
      fontFamily: AppFonts.poppinsRegular,
      color: AppColors.textGrey
  );
}