import 'package:fgitapp/common/constants/app_colors_constant.dart';

import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    color: AppColors.labelDark,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle appBarTitleStyle = TextStyle(
    fontSize: 20,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle successText = AppTextStyle.labelTextStyle
      .copyWith(color: AppColors.successColor, fontWeight: FontWeight.w500);

  static TextStyle errorTextStyle = AppTextStyle.labelTextStyle.copyWith(
      color: AppColors.errorColor, fontWeight: FontWeight.w500, fontSize: 14);

  static const TextStyle title = TextStyle(
    fontSize: 18,
    color: AppColors.appThemeColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: AppColors.appThemeColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle kycStatus = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle dialogTitle = TextStyle(
    fontSize: 18,
    color: AppColors.appThemeColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.primaryColor,
  );

  static const TextStyle notificationCounterTextStyle = TextStyle(
    fontSize: 12,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle buttonTextStyle =
      TextStyle(fontSize: 16, color: AppColors.bgColor);

  static const TextStyle urlTextStyle = TextStyle(
    fontSize: 14,
    color: AppColors.labelLight,
  );

  static const TextStyle normalBodyTextStyle = TextStyle(
    color: AppColors.normalBodyTextColor,
    fontSize: 16,
  );

  static TextStyle labelTextStyle = const TextStyle(
    color: AppColors.labelDark,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle requiredTextStyle =
      const TextStyle(color: AppColors.redLightColor, fontSize: 14);

  static TextStyle errorTextStyleLabel = const TextStyle(
    color: AppColors.errorColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle accountNumberTextStyle = const TextStyle(
    color: AppColors.primaryColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static TextStyle labelCardTextStyle = const TextStyle(
    fontSize: 13,
  );

  static TextStyle labelCardHeader =
      const TextStyle(fontSize: 22, color: AppColors.labelDark);
  static TextStyle messageTextStyle =
      const TextStyle(fontSize: 14, color: AppColors.unselectedColor);

  static TextStyle listTileTitleTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.normalBodyTextColor);
  static TextStyle listTileSubTitleTextStyle =
      const TextStyle(fontSize: 16, color: AppColors.unselectedColor);

  static TextStyle greyTextStyle = const TextStyle(
      fontSize: 14,
      color: AppColors.darkGreyColor,
      fontWeight: FontWeight.w400);

  static TextStyle textLableStyle = const TextStyle(
      fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500);
  static TextStyle dynamicTitleStyle = const TextStyle(
      fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500);
}
