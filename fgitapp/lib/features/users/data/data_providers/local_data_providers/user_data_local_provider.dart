import 'dart:convert';
import 'package:fgitapp/core/utils/pref_utils.dart';

import '../../../../../common/constants/string_constants.dart';

class UserDataLocalProvider {
  UserDataLocalProvider();

  Future getUserLocalData() async {
    var saveddata =
        await SharedPref.getStringValue(ResString.dashboardSavedData);
    List dashboardData = jsonDecode(saveddata);
    return dashboardData;
  }
}
