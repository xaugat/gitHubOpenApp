
import 'package:fgitapp/common/constants/app_colors_constant.dart';
import 'package:flutter/material.dart';

class AppIcons {
  // Icons used inside app will be registered here
  static const passwordIcon = Icon(Icons.lock);

  static const emailIcon = Icon(Icons.email);

  static const dashboard = Icon(Icons.home);

  static const menu = Icon(
    Icons.menu,
  );

  static const messenger =
      Icon(Icons.messenger_sharp, size: 35, color: AppColors.whiteColor);

  static const notification = Icon(
    Icons.notifications,
  );

  static const checkBox = Icon(
    Icons.check_box,
    color: AppColors.whiteColor,
  );
  static const copy = Icon(
    Icons.copy_sharp,
    color: AppColors.whiteColor,
  );

  static const contactUs = Icon(Icons.phone);

  static var backButton = const Icon(
    Icons.arrow_back_ios_new,
    color: AppColors.whiteColor,
    size: 24,
  );

  static const add = Icon(
    Icons.add,
    size: 28,
    color: AppColors.whiteColor,
  );

  static const profile = Icon(Icons.person);

  static const search = Icon(Icons.search);

  static const gallery = Icons.photo_size_select_actual_rounded;
  static const edit = Icons.edit;
}
