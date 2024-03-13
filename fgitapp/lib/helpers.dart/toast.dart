import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showSuccessToast(msg) {
  return Fluttertoast.showToast(msg: msg, backgroundColor: Colors.green);
}

showMessageToast(msg) {
  return Fluttertoast.showToast(msg: msg, backgroundColor: Colors.blueGrey);
}

showErrorToast(msg) {
  return Fluttertoast.showToast(msg: msg, backgroundColor: Colors.red);
}

showDynamicSuccessToast(msg) {
  // used when need to show dynamic response from api
  return Fluttertoast.showToast(msg: msg, backgroundColor: Colors.green);
}

showDynamicErrorToast(msg) {
  return Fluttertoast.showToast(msg: msg, backgroundColor: Colors.red);
}
