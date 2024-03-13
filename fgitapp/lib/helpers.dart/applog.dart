import 'dart:developer';

import 'package:flutter/foundation.dart';

applog(String data) {
  if (kDebugMode) {
    log(data.toString());
  }
}
