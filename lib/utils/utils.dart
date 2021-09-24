import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test_ui/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  //show toast message
  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black87,
        textColor: Colors.white);
  }

  //to show snackBar
  static showSnackBar(BuildContext context, String message,
      {Color color = AppColors.primaryColor, int duration = 4500}) {
    Duration _snackBarDisplayDuration = Duration(milliseconds: duration);
    final snackBar = new SnackBar(
      content: new Text(message),
      backgroundColor: color,
      duration: _snackBarDisplayDuration,
    );
//
//    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
//    Scaffold.of(context).showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showTwoButtonAlertDialog(BuildContext context, String title,
      String message, VoidCallback okPressed,
      {String positiveButtonTitle = "Ok",
      String negativeButtonTitle = "Cancel"}) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(negativeButtonTitle),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text(positiveButtonTitle),
      onPressed: okPressed,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showOneButtonAlertDialog(BuildContext context, String title,
      String message, VoidCallback callback) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: callback,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //convert image  into base64
  static Future<String> convertImageToBase64(File image) async {
    List<int> imageBytes = image.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  static ImageProvider convertBase64ToImage(String base64Image) {
    Uint8List bytes = Base64Decoder().convert(base64Image);
    return Image.memory(bytes).image;
  }

  //to change Date to timeStamp
  static int convertTimeToMillis(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }

  //to change Date to timeStamp
  static int convertTimeToSeconds(DateTime dateTime) {
    var timeSeconds = dateTime.millisecondsSinceEpoch / 1000;
    return timeSeconds.toInt();
  }

  static int convertMillisToMinutes(int milliseconds) {
    return (milliseconds / 60000).round();
  }

  static DateTime convertMillisToDate(int millis) {
    var date = new DateTime.fromMillisecondsSinceEpoch(millis);
    return date;
  }

  //to change timestamp to date format
  static DateTime convertTimeStampToDate(int timeStamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return date;
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// Returns String in international number form
  /// i.e +234XXXXXXXXXX format (note that the number of X is 10, not 11)
  static String convertToInternationalPhoneNumber(String phoneNumber) {
    /// if number starts with +234 return
    /// else if it starts with '0' remove the first 0 and add +234 to the front
    /// else if doesn't start with '0' just add +234 to the front
    if (phoneNumber.startsWith('+234'))
      return phoneNumber;
    else if (phoneNumber.startsWith('0'))
      return '+234' + phoneNumber.substring(1);
    else
      return '+234' + phoneNumber;
  }
}
