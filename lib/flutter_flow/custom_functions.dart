import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? setDecimalValue(String? value) {
  if (value == null) {
    return "0.00";
  }
  if (value == "NaN") {
    return "0.00";
  }
  if (value == "0") {
    return "0.00";
  }
  int? intValue = int.tryParse(value);
  if (intValue != null) {
    return "$value.00";
  }

  double? doubleValue = double.tryParse(value);
  if (doubleValue != null) {
    double truncatedValue = (doubleValue * 100).truncateToDouble() / 100;
    //return truncatedValue.toStringAsFixed(2);
    return doubleValue.toStringAsFixed(2);
  }

  return "0.00";
}

Color? setbackgroundColorSideBar(
  String? catid,
  String? selectedCatID,
  int? varientID,
  int? selectedVarientID,
) {
  var color;
  // print("G1----->$catid &&.   $selectedCatID");
  if (catid == selectedCatID && varientID == selectedVarientID) {
    color = Color(0xff248c44);
  } else {
    color = Color(0xFFFFFFFF);
  }
  // print("G1----->$color");
  return color;
}

Color setOrderInfoBgColorCopy(String orderStatus) {
  var color;
  if (orderStatus == "Completed") {
    color = Color(0xFFFFFFFF);
  } else if (orderStatus == "Cancelled" ||
      orderStatus == "Payment_failed" ||
      orderStatus == "Payment Failed") {
    color = Color(0xFFFFFFFF);
  } else {
    color = Color(0xFF0A0A0A);
  }
  // print("G1---->$color");
  return color;
}

Color? setbackgroundColor(
  String? catid,
  String? selectedCatID,
  int? varientID,
  int? selectedVarientID,
) {
  var color;
  // print("G1----->$catid &&.   $selectedCatID");
  if (catid == selectedCatID && varientID == selectedVarientID) {
    color = Color(0xFFdadbf0);
  } else {
    color = Color(0xFFFFFFFF);
  }
  // print("G1----->$color");
  return color;
}

String? getSelectedCityID(
  String? cityname,
  dynamic cityJson,
) {
  String selectedCityID = "";

  List<dynamic> data = jsonDecode(cityJson);

  for (var city in data) {
    if (cityname == city['city_name']) {
      selectedCityID = city['city_id'];
      break;
    }
  }
  // print("G1------->${selectedCityID}");
//  FFAppState().selectedzCityid = selectedCityID;
  return selectedCityID;
}

Color? setbackgroundColorSubcategories(
  String? catid,
  String? selectedCatID,
  int? varientID,
  int? selectedVarientID,
) {
  var color;
  // print("G1----->$catid &&.   $selectedCatID");
  if (catid == selectedCatID && varientID == selectedVarientID) {
    // color = Color(0xffD6EADC);
    color = Color(0xffedffed);
  } else {
    color = Color(0xFFFFFFFF);
  }
  // print("G1----->$color");
  return color;
}

String? addRemoveQTY(
  int qty,
  String type,
) {
  int sQTY = 0;
  if (type == "add") {
    sQTY = qty + 1;
  } else {
    if (qty > 0) {
      sQTY = qty - 1;
    } else {
      sQTY = 0;
    }
  }

  return sQTY.toString();
}

String? addCartPice(
  String itemPrice,
  String totalPrice,
  String type,
) {
  String nPrice = "";
  var itemP = double.parse(itemPrice);
  var tPrice = double.parse(totalPrice);
  if (type == "add") {
    var p = itemP + tPrice;
    nPrice = "$p";
    //print("G1--- add-->$nPrice && $tPrice &&  $itemP");
  } else {
    var p = tPrice - itemP;
    nPrice = "$p";
    //  print("G1--- remove-->$nPrice && $tPrice &&  $itemP");
  }
  return nPrice;
}

String? customDateFormatter(
  String dateStr,
  String? dateType,
) {
  if (dateStr.isNotEmpty || dateStr != null || dateStr != "") {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(dateStr);
    if (dateType == "1") {
      var outputFormat = DateFormat('EEE dd MMM yyyy');
      var outputDate = outputFormat.format(inputDate);
      return outputDate.toString();
    } else if (dateType == "2") {
      var outputFormat = DateFormat('EEE');
      var outputDate = outputFormat.format(inputDate);
      return outputDate.toString();
    } else if (dateType == "6") {
      var outputFormat = DateFormat('EEE dd\nMMM yyyy');
      var outputDate = outputFormat.format(inputDate);
      return outputDate.toString();
    } else if (dateType == "3") {
      var outputFormat = DateFormat('dd');
      var outputDate = outputFormat.format(inputDate);
      return outputDate.toString();
    } else if (dateType == "4") {
      var outputFormat = DateFormat('MMM, yyyy');
      var outputDate = outputFormat.format(inputDate);
      return outputDate.toString();
    } else if (dateType == "5") {
      var outputFormat = DateFormat('yyyy - MM - dd');
      var outputDate = outputFormat.format(inputDate);
      return outputDate.toString();
    }
  } else {
    return "";
  }
}

bool? getSelectedDay(
  String? dayString,
  String? day,
) {
  // Check if dayString is null
  if (dayString == null) {
    return null;
  }

  // Split the string by ", "
  List<String> dList = dayString.split(", ");

  //print("G1----> ${dList}");

  bool? rDays = false;
  for (String nday in dList) {
    if (nday == "Sun" && day == "Sun" ||
        nday == "Mon" && day == "Mon" ||
        nday == "Tue" && day == "Tue" ||
        nday == "Wed" && day == "Wed" ||
        nday == "Thu" && day == "Thu" ||
        nday == "Fri" && day == "Fri" ||
        nday == "Sat" && day == "Sat") {
      rDays = true;
      break;
    }
  }

  return rDays;
}

Color? setbackgroundColororderResume(
  String? catid,
  String? selectedCatID,
  int? varientID,
  int? selectedVarientID,
) {
  var color;
  // print("G1----->$catid &&.   $selectedCatID");
  if (catid == selectedCatID && varientID == selectedVarientID) {
    color = Color(0xff2e317e);
  } else {
    color = Color(0xffc1c4da);
  }
  // print("G1----->$color");
  return color;
}

Color? setBgColorinIOrder(String? orderStatus) {
  var color;
  if (orderStatus == "Completed") {
    color = Color(0xFF248c44);
  } else if (orderStatus == "Pause") {
    color = Color(0xFFBDA6E1);
  } else if (orderStatus == "Pending" || orderStatus == "pending") {
    // color = Color(0xFFc0c0c0);
    color = Color(0xFFe69138);
  } else if (orderStatus == "Cancelled" ||
      orderStatus == "Payment Failed" ||
      orderStatus == "Payment_failed") {
    color = Color(0xFFDF3F56);
  } else if (orderStatus == "Out_For_Delivery") {
    color = Color(0xFFFF7E38);
  } else if (orderStatus == "Ready For Pick Up") {
    color = Color(0xFFFF7E38);
  } else if (orderStatus == "Confirmed") {
    color = Color(0xFFFF7E38);
  } else {
    color = Color(0xFFee8b60);
  }
  // print("G1---->$color");
  return color;
}

Color? setbackgroundColororderResumeCopy(
  String? catid,
  String? selectedCatID,
  int? varientID,
  int? selectedVarientID,
) {
  var color;
  // print("G1----->$catid &&.   $selectedCatID");
  if (catid == selectedCatID && varientID == selectedVarientID) {
    color = Color(0xffFFFFFF);
  } else {
    color = Color(0xff0A0A0A);
  }
  // print("G1----->$color");
  return color;
}

String? getRepeatdays(
  bool? isSun,
  bool? isMon,
  bool? isTue,
  bool? isWed,
  bool? isThu,
  bool? isFri,
  bool? isSat,
) {
  List<String> dList = [];
  String? rDays = "";

  if (isSun == true) {
    dList.add("Sun");
  }
  if (isMon == true) {
    dList.add("Mon");
  }
  if (isTue == true) {
    dList.add("Tue");
  }
  if (isWed == true) {
    dList.add("Wed");
  }
  if (isThu == true) {
    dList.add("Thu");
  }
  if (isFri == true) {
    dList.add("Fri");
  }
  if (isSat == true) {
    dList.add("Sat");
  }
  //print("G1---days--->${dList.join(", ")}");
  String nDays = dList.join(", ");
  //print("G1---ndays--->${nDays}");

  return nDays;
}

DateTime tCalenderDate(int? tDate) {
  return DateTime.now().add(Duration(days: tDate!));
}

String? latlngToString(LatLng? inputLocatiion) {
  // return inputLocation as string
  if (inputLocatiion == null) {
    return null;
  }
  return '${inputLocatiion.latitude},${inputLocatiion.longitude}';
}

List<LatLng>? listDoubleToLatLng(
  List<double>? latitude,
  List<double>? longitude,
) {
  // return latitude and longitude combined
  if (latitude == null || longitude == null) {
    return null;
  }
  if (latitude.length != longitude.length) {
    throw ArgumentError(
        'Latitude and longitude lists must have the same length');
  }
  final List<LatLng> result = [];
  for (int i = 0; i < latitude.length; i++) {
    result.add(LatLng(latitude[i], longitude[i]));
  }
  return result;
}

Color? setBgColorinVacation(bool? isSelectedVacation) {
  // change the color of a container on selecting and deselecting it
  if (isSelectedVacation == true) {
    return Color(0xFFA63E);
  } else {
    return Colors.white;
  }
}

Color? setNotificationBGColor(
  String title,
  String isTitle,
) {
  // print("G1--->$isTitle");
  var color;
  if (title.contains("Your Order is Placed")) {
    //  print("G1---1-->$isTitle");
    if (isTitle.contains("border")) {
      color = Color(0xFFE4D8F5);
    } else if (isTitle.contains("title")) {
      color = Color(0xFF7E65AC);
    } else {
      color = Color(0xFFF6F2FC);
    }
  } else if (title.contains("Your Order has been Delivered")) {
    if (isTitle.contains("border")) {
      color = Color(0xFFDCE9D8);
    } else if (isTitle.contains("title")) {
      color = Color(0xFF248c44);
    } else {
      color = Color(0xFFF4F6F4);
    }
  } else if (title.contains("Your order has been cancelled")) {
    if (isTitle.contains("border")) {
      color = Color(0xFFE2B6BC);
    } else if (isTitle.contains("title")) {
      color = Color(0xFFDF3F56);
    } else {
      color = Color(0xFFFEEEF0);
    }
  } else {
    if (isTitle.contains("border")) {
      color = Color(0xFFDADBFF);
    } else if (isTitle.contains("title")) {
      color = Color(0xFF2e317e);
    } else {
      color = Color(0xFFEBEBFF);
    }
  }
  return color;
}

String? getCancelReason(
  int id,
  dynamic jsonList,
) {
  String? cancelReason = "";

  // Ensure jsonList is a JSON string and then decode it
  List<dynamic> data;
  if (jsonList is String) {
    data = jsonDecode(jsonList);
  } else {
    throw ArgumentError('Expected a JSON string');
  }

  for (var res in data) {
    if (id == res['res_id']) {
      cancelReason = res['reason'];
      break;
    }
  }

  return cancelReason;
}

Color? setbackgroundColorOfDailyCartTimeSlot(
  String? catid,
  String? selectedCatID,
) {
  var color;
  if (catid == selectedCatID) {
    color = Color(0xffdadbf0);
  } else {
    color = Color(0xFFFFFFFF);
  }
  return color;
}

String? getArrayCount(dynamic arrList) {
  var count = arrList.length - 1;
  //print("G1------>$count");

  return count.toString();
}

double? updateTotalAmount(
  String? partnerTip,
  String? couponDiscount,
  String? itemTotal,
  String? refWallet,
  String? refWalletAddRemove,
  String? selectedpaymentType,
  String? codeAmount,
  String? cashWallet,
  String? cashWalletAddRemove,
) {
  double total = 0.0;
  // print(
  //     "G1---->$refWallet & $refWalletAddRemove & $cashWallet &$cashWalletAddRemove ");
  if (itemTotal != null) {
    total += double.parse(itemTotal);
  }

  if (partnerTip != null) {
    total += double.parse(partnerTip);
  }

  if (couponDiscount != null) {
    total -= double.parse(couponDiscount);
  }
  if (refWallet != null && refWallet != "0" && refWallet != "") {
    if (refWalletAddRemove == "add") {
      //  total += double.parse(wallet);
      // } else if (walletAddRemove == "remove") {
      total -= double.parse(refWallet);
    }
  }
  if (cashWallet != null && cashWallet != "0" && cashWallet != "") {
    if (cashWalletAddRemove == "add") {
      //  total += double.parse(wallet);
      // } else if (walletAddRemove == "remove") {
      total -= double.parse(cashWallet);
    }
  }
  // print("G1---->$selectedpaymentType -----&&&-----$codeAmount ---&-- $total");
  if (codeAmount != null) {
    // print("G1---->$selectedpaymentType -----&&&-----$codeAmount");
    if (selectedpaymentType == "COD") {
      total += double.tryParse(codeAmount) ?? 0.0;
    }
  }
  //print("G1---->$total");
  if (total < 0) {
    total = 0;
  }
  String nPrice = total.toStringAsFixed(2);
  // print("G1---nPrice-->${double.parse(nPrice)}");
  return double.parse(nPrice);
}

bool? cartOpenClose(
  String? repeatDays,
  bool? isCardVisible,
  int? varientID,
  int? itemVarientID,
) {
  if (repeatDays == "" || isCardVisible == true && varientID == itemVarientID) {
    return true;
  } else {
    return false;
  }
}

String? setOrderStatus(String? orderStatus) {
  var status;
  if (orderStatus == "Completed") {
    status = "Completed";
  } else if (orderStatus == "Confirmed") {
    status = "Processed";
  } else if (orderStatus == "pending" ||
      orderStatus == "Pending" ||
      orderStatus == "In Progress") {
    status = "Placed";
  } else if (orderStatus == "Inprogress") {
    status = "In Progress";
  } else if (orderStatus == "Cancelled") {
    status = "Cancelled";
  } else if (orderStatus == "Payment_failed" ||
      orderStatus == "Payment Failed") {
    status = "Payment Failed";
  } else if (orderStatus == "Out_For_Delivery") {
    status = "Out For Delivery";
  } else if (orderStatus == "Ready For Pick Up") {
    status = "Ready For Pick Up";
  } else {
    status = orderStatus;
  }
  // print("G1---->$color");
  return status;
}

bool? isOrderStatusChange(
  String? orderStatus,
  String? cStatus,
) {
  //if (orderStatus == "Pending") {
  // return true;
  //}

  if (orderStatus == "Confirmed" && cStatus == "Procesed" ||
      orderStatus == "Completed" && cStatus == "Procesed" ||
      orderStatus == "Out_For_Delivery" && cStatus == "Procesed" ||
      orderStatus == "Ready For Pick Up" && cStatus == "Procesed") {
    return true;
  }

  if (orderStatus == "Ready For Pick Up" && cStatus == "Ready" ||
      orderStatus == "Completed" && cStatus == "Ready" ||
      orderStatus == "Out_For_Delivery" && cStatus == "Ready") {
    return true;
  }

  if (orderStatus == "Out_For_Delivery" && cStatus == "out" ||
      orderStatus == "Completed" && cStatus == "out") {
    return true;
  }

  if (orderStatus == "Cancelled" && cStatus == "Cancelled") {
    return true;
  }

  if (orderStatus == "Completed" && cStatus == "completed") {
    return true;
  }
}

bool? checkSubscriptionDate(String? subDate) {
  // create a func in which it will check the date must be futures date
  if (subDate == null) {
    return null;
  }
  final now = DateTime.now();
  final subscriptionDate = DateTime.parse(subDate);
  return subscriptionDate.isAfter(now);
}

bool? checkSubscriptionCartEmpty(dynamic cartList) {
  for (var e in cartList) {
    if (e['repeat_orders'] == "" ||
        e['sub_delivery_date'] == "" ||
        e['sub_total_delivery'] == "" ||
        e['sub_time_slot'] == "") {
      return false;
    }
  }

  return true;
}

bool? checkWallet(
  String wallet,
  String totalPay,
) {
  double w = double.parse(wallet);
  double t = double.parse(totalPay);

  if (w > t) {
    //print("G1---->true");
    return true;
  } else {
    //  print("G1---->false");
    return false;
  }
}

String? setDateFormatter(
  String? date,
  String? type,
  String? dateFormate,
) {
  if (date == null || date.trim().isEmpty) return null;

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);

  var inputFormat = DateFormat('$dateFormate');
  var inputDate = inputFormat.parse(date);
  final aDate = DateTime(inputDate.year, inputDate.month, inputDate.day);
  // print("G1------>date---->1");
  if (aDate == today && type == "EEE") {
    //   print("G1------>date---->2");
    return "Today";
  } else if (aDate == tomorrow && type == "EEE") {
//    print("G1------>date---->3");
    return "Tomorrow";
  } else {
    //  print("G1------>date---->4");
    // var inputFormat = DateFormat('$dateFormate');
    // var inputDate = inputFormat.parse(date);
    return DateFormat('$type').format(inputDate);
  }
}

dynamic getSelectedTimeSlotList(
  String selectedDate,
  dynamic dateList,
) {
  // print("G1----->$selectedDate &&& ${dateList.toString()}");
  for (var e in dateList) {
    if (e['date'] == selectedDate) {
      // print("G1----->$selectedDate &&& ${e['timeslots']}");

      return e['timeslots'];
    }
  }
}

double? checkWalletWithAction(
  String? isWalletSelected,
  String? totalPay,
  String? wallet,
  String? walletValue,
) {
  double? isShow = 0.0;

  double tpay = totalPay != null ? double.tryParse(totalPay) ?? 0.0 : 0.0;
  double walletD = wallet != null ? double.tryParse(wallet) ?? 0.0 : 0.0;
  double wWalletV =
      walletValue != null ? double.tryParse(walletValue) ?? 0.0 : 0.0;

  if (isWalletSelected == "add") {
    // // If wallet balance is less than totalPay → use full wallet
    // if (walletD < tpay) {
    //   isShow = walletD;
    // }
    // If wallet balance is enough → apply percentage rule
    // else {
      double percentValue = (tpay * wWalletV) / 100;

      if (percentValue <= walletD) {
        isShow = percentValue;
      } else {
        isShow = walletD;
      }
    // }
  } else {
    isShow = 0.0;
  }

  return isShow;
}

LatLng convertStringToLatLng(
  String lat,
  String lng,
) {
  var lats = double.parse(lat);
  var lngs = double.parse(lng);
  return new LatLng(lats, lngs);
}

LatLng setMapLocation(
  LatLng searchLatlng,
  LatLng currentLatLng,
) {
  var sLatLng;

  //print("G1----> setmap---->$searchLatlng");
  // print("G1----> setmap---->$currentLatLng");

  if (searchLatlng.latitude == 0.0 && searchLatlng.longitude == 0.0) {
    //  print("G1----> setmap---->unset");

    sLatLng = currentLatLng;
  } else {
    // print("G1----> setmap---->set");
    sLatLng = searchLatlng;
  }

  return sLatLng;
}

double stringToDouble(String stringValue) {
  if (stringValue != null) {
    return double.parse(stringValue);
  } else {
    return 0.0;
  }
}

String? setCustomDateFormate(
  String? date,
  String? getDateF,
  String? setDateF,
) {
  if (date != null && date.isNotEmpty) {
    var inputFormat = DateFormat(getDateF);
    var inputDate = inputFormat.parse(date);

    var outputFormat = DateFormat(setDateF);
    var outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  } else {
    return "";
  }
}

String? subscriptionItemPrice(
  String price,
  String repeatCount,
) {
  double pcheck = 0.00;
  if (price != "Null") {
    pcheck = double.parse(price);
  }
  double rc = double.parse(repeatCount);

  double nPrice = pcheck / rc;

  return "${nPrice.toStringAsFixed(2)}";
}

String? calculateItemPrice(
  String repeatCount,
  String price,
) {
  double rc = double.parse(repeatCount);
  double p = double.parse(price);
  double nPrice = p * rc;

  return "${nPrice.toStringAsFixed(2)}";
}

double? additionFunction(
  double? first,
  double? second,
) {
  // Check if either of the input values is null
  if (first == null || second == null) {
    return null; // Return null if any input is null
  }

  // Perform the addition
  return first + second;
}

int? additionFunctionInt(
  int? first,
  int? second,
) {
  //print("G1----->$first  &&&&. $second");
  int a = first ?? 0;
  int b = second ?? 0;

  int result = a + b;

  // If result is negative, return 0
  if (result < 0) {
    return 0;
  }

  return result;
}

bool? checkAvailableDays(
  String day,
  String? dayList,
) {
  if (dayList == null) {
    return null;
  }

  // Split the dayList into a list of days, all converted to lowercase
  List<String> dList = dayList.toLowerCase().split(",");

  // Convert the input day to lowercase for case-insensitive comparison
  String lowerCaseDay = day.toLowerCase();

  // print("G1-------> $lowerCaseDay");
  // print("G1-----dList--> $dList");

  bool check = false;

  // Iterate through the list of days and check for a match
  for (String nday in dList) {
    if (nday.toLowerCase() == lowerCaseDay || nday.toLowerCase() == "all") {
      //  print('$nday is available.');
      check = true;
      break; // Exit the loop if the day is found
    } else {
      //   print('$nday is not available.');
    }
  }

  // Return whether the day was found or not
  return check;
}

double? checkDoubleValue(String value) {
  double? parsedValue = double.tryParse(value);

  return parsedValue;
}

int setIngeterValue(String value) {
  return int.parse(value);
}

Color setDaysbgColor(
  bool isDayAvailable,
  bool isDaySelected,
) {
  var color;
  if (isDayAvailable == true) {
    if (isDaySelected == true) {
      color = Color(0xFF2e317e);
      //  print("G1---> indego");
    } else {
      color = Color(0xFFdadbf0);
      // print("G1---> purple");
    }
  } else {
    color = Color(0xFFf5f5f5);
    //   print("G1---> lightgrey");
  }
  return color;
}

String setTimeSlot() {
  DateTime now = DateTime.now();
  int currentHour = now.hour; // Get the current hour in 24-hour format

  if (currentHour >= 0 && currentHour < 11) {
    // print("It's morning!");
    return '4 PM - 7 PM';
  } else if (currentHour >= 11 && currentHour < 17) {
    // print("It's afternoon/evening!");
    return '6 AM - 10 AM';
  } else {
    return '2 PM - 4 PM';
  }
}

String? extractFirstName(String? fullName) {
  // Check if fullName is null or empty
  if (fullName == null || fullName.isEmpty) {
    return null; // Return null if input is null or empty
  }

  // Trim leading and trailing spaces from the full name
  fullName = fullName.trim();

  // Find the first space in the trimmed full name
  int spaceIndex = fullName.indexOf(' ');

  // If no space is found, return the full name (this means there's only one word)
  if (spaceIndex == -1) {
    return fullName;
  }

  var name = fullName.substring(0, spaceIndex)[0].toUpperCase() +
      fullName.substring(0, spaceIndex).substring(1);
  // Extract and return the first name
  return name;
}

String? trimString(String? userName) {
  // Check if userName is null or empty
  if (userName == null || userName.isEmpty) {
    return null; // Return null if userName is null or empty
  }

  // Trim leading and trailing spaces from the userName
  return userName.trim();
}

bool checkEmptylatLng(LatLng latLng) {
  if (latLng == null) {
    //print("LatLng is null");
    return false;
  } else if (latLng.latitude == 0.0 && latLng.longitude == 0.0) {
    // print("LatLng is empty (default values)");
    return false;
  } else {
    //  print("LatLng is valid: (${latLng.latitude}, ${latLng.longitude})");
    return true;
  }
}

bool checkPayCardAvailable(
  bool isCardChange,
  dynamic lastAddress,
) {
  if (lastAddress != null && lastAddress.isNotEmpty || isCardChange == true) {
    return true;
  }
  return false;
}

int checkSelectionDaysCount(String dayList) {
  List<String> days = dayList.split(',');

  return days.length;
}

double getCurrentLatitudeLogitude(
  LatLng latLng,
  String type,
) {
  print("G1------->$latLng");
  if (type == 'lat') {
    // return latLng.latitude;
    return 25.2048;
  } else {
    // return latLng.longitude;
    return 55.2708;
  }
}

Color setOrderInfoBgColor(String orderStatus) {
  var color;
  if (orderStatus == "Completed") {
    color = Color(0xFF248c44);
  } else if (orderStatus == "Pause") {
    color = Color(0xFFBDA6E1);
  } else if (orderStatus == "Pending" || orderStatus == "pending") {
    color = Color(0xFFc0c0c0);
    // color = Color(0xFFe69138);
  } else if (orderStatus == "Cancelled" ||
      orderStatus == "Payment_failed" ||
      orderStatus == "Payment Failed") {
    color = Color(0xFFDF3F56);
  } else if (orderStatus == "Out_For_Delivery") {
    color = Color(0xFFFF7E38);
  } else if (orderStatus == "Ready For Pick Up") {
    color = Color(0xFFFF7E38);
  } else if (orderStatus == "Confirmed") {
    color = Color(0xFFFF7E38);
  } else {
    color = Color(0xFFee8b60);
  }
  // print("G1---->$color");
  return color;
}

bool checkDateforOldOrCurrentDate(dynamic orderDate) {
  DateTime today = DateTime.now();
  DateTime currentDateWithoutTime =
      DateTime(today.year, today.month, today.day);
  bool checkDate = false;
  // print("G1---orderDate---->$orderDate");

  for (var item in orderDate) {
    if (item["sub_delivery_date"] != "null" &&
        item["sub_delivery_date"] != "") {
      DateTime deliveryDate = DateTime.parse(item["sub_delivery_date"]);

      DateTime deliveryDateWithoutTime =
          DateTime(deliveryDate.year, deliveryDate.month, deliveryDate.day);

      // Compare delivery date with current date
      if (deliveryDateWithoutTime.isBefore(currentDateWithoutTime)) {
        // print(
        //     "g1--${item["product_name"]} - Delivery Date: $deliveryDateWithoutTime is in the past.");

        checkDate = true;
        break;

        // } else if (deliveryDateWithoutTime.isAtSameMomentAs(currentDateWithoutTime)) {
        //   print("${item["product_name"]} - Delivery Date: $deliveryDateWithoutTime is today.");
      } else if (deliveryDateWithoutTime
          .isAtSameMomentAs(currentDateWithoutTime)) {
        // print("The selected date $deliveryDateWithoutTime is today.");
        checkDate = true; // Date is today
      } else {
        checkDate = false;
        // print(
        //     "g11---${item["product_name"]} - Delivery Date: $deliveryDateWithoutTime is in the future.");
      }
    } else {
      // print("g111---is in the future.");
      checkDate = true;
    }
  }
  // print("G1---checkDate---->$checkDate");
  return checkDate;
}

bool checkDateOldCurrentDate(String selectedDate) {
  DateTime today = DateTime.now();
  DateTime currentDateWithoutTime =
      DateTime(today.year, today.month, today.day);

  bool isOldDate = false;
  if (selectedDate != "null" && selectedDate != "") {
    // Parse the selected date
    DateTime deliveryDate = DateTime.parse(selectedDate);

    // Remove the time from deliveryDate
    DateTime deliveryDateWithoutTime =
        DateTime(deliveryDate.year, deliveryDate.month, deliveryDate.day);

    /*// Compare delivery date with the current date
    if (deliveryDateWithoutTime.isBefore(currentDateWithoutTime)) {
      print("The selected date $deliveryDateWithoutTime is in the past.");
      isOldDate = true; // Date is in the past
    } else {
      print("The selected date $deliveryDateWithoutTime is not in the past.");
      isOldDate = false; // Date is not in the past
    }
    */
    if (deliveryDateWithoutTime.isBefore(currentDateWithoutTime)) {
      // print("The selected date $deliveryDateWithoutTime is in the past.");
      isOldDate = true; // Date is in the past
    } else if (deliveryDateWithoutTime
        .isAtSameMomentAs(currentDateWithoutTime)) {
      // print("The selected date $deliveryDateWithoutTime is today.");
      isOldDate = true; // Date is today
    } else {
      // print("The selected date $deliveryDateWithoutTime is in the future.");
      isOldDate = false; // Date is in the future
    }
  } else {
    isOldDate = true;
  }
  return isOldDate;
}

String timeAgoDate(String notiDate) {
  bool numericDates = true; // Semicolon added
  DateTime date = DateTime.parse(notiDate); // Parse the string date
  final date2 = DateTime.now().toLocal();
  final difference = date2.difference(date);

  if (difference.inSeconds < 5) {
    return 'Just now';
  } else if (difference.inSeconds <= 60) {
    return '${difference.inSeconds} sec ago';
  } else if (difference.inMinutes <= 1) {
    return (numericDates) ? '1 min ago' : 'A minute ago';
  } else if (difference.inMinutes <= 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours <= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
  } else if (difference.inHours <= 24) {
    // Fixed from 60 to 24 hours
    return '${difference.inHours} hours ago';
  } else if (difference.inDays <= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (difference.inDays <= 6) {
    return '${difference.inDays} days ago';
  } else if ((difference.inDays / 7).ceil() <= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
  } else if ((difference.inDays / 7).ceil() <= 4) {
    return '${(difference.inDays / 7).ceil()} weeks ago';
  } else if ((difference.inDays / 30).ceil() <= 1) {
    return (numericDates) ? '1 month ago' : 'Last month';
  } else if ((difference.inDays / 30).ceil() <= 12) {
    // Fixed to go up to 12 months (1 year)
    return '${(difference.inDays / 30).ceil()} months ago';
  } else if ((difference.inDays / 365).ceil() <= 1) {
    return (numericDates) ? '1 year ago' : 'Last year';
  }
  return '${(difference.inDays / 365).floor()} years ago';
}

String? getIntegerValue(int? value) {
  return value.toString();
}

String setDecimalValueWithCount(
  String value,
  int decimalCount,
  bool? isDiscount,
) {
  if (value == null) {
    return "0.00";
  }
  if (value == "NaN") {
    return "0.00";
  }
  if (value == "0") {
    return "0.00";
  }
  int? intValue = int.tryParse(value);
  if (intValue != null) {
    return isDiscount == true ? value : "$value.00";
  }

  double? doubleValue = double.tryParse(value);
  if (doubleValue != null) {
    double truncatedValue = (doubleValue * 100).truncateToDouble() / 100;
    //return truncatedValue.toStringAsFixed(2);
    if (decimalCount == 1) {
      return doubleValue.toStringAsFixed(1);
    } else if (decimalCount == 0) {
      return doubleValue.toInt().toString();
    } else {
      return doubleValue.toStringAsFixed(2);
    }
  }

  return "0.00";
}

String getReviewCount(dynamic arrayList) {
  if (arrayList != null && arrayList.isNotEmpty) {
    int count = 0;
    for (var e in arrayList) {
      if (e['description'] != null && e['description'].isNotEmpty) {
        count += 1;
      }
    }
    return count.toString();
  }
  return "0";
}

bool isSpecificTimeOnSelectedDate(
  String selectedDate,
  String selectedTime,
  String dateFormat,
  String specificTimeMorning,
  String specificTimeEvening,
) {
  // if (selectedDate == null || selectedDate.isEmpty || specificTime.isEmpty) {
  //   return false;
  // }

  // try {
  //   // Parse the selected date
  //   DateTime parsedDate = DateFormat(dateFormat).parse(selectedDate);

  //   // Trim and parse the specific time
  //   specificTime = specificTime.trim(); // Remove extra spaces
  //   DateTime parsedTime =
  //       DateFormat.jm().parse(specificTime); // e.g., "11:59 AM"

  //   // Combine the selected date with the specific time
  //   DateTime specificDateTime = DateTime(
  //     parsedDate.year,
  //     parsedDate.month,
  //     parsedDate.day,
  //     parsedTime.hour,
  //     parsedTime.minute,
  //   );

  //   // Get the current time
  //   DateTime now = DateTime.now();
  //   // print("Jivan ----->$now");
  //   // Compare the specific datetime with the current datetime
  //   if (now.isBefore(specificDateTime)) {
  //     // print("The current time is before $specificTime on $selectedDate.");
  //     return false;
  //   } else if (now.isAfter(specificDateTime)) {
  //     // print("The current time is after $specificTime on $selectedDate.");
  //     return true;
  //   } else {
  //     // print("The current time is exactly $specificTime on $selectedDate.");
  //     return true;
  //   }
  // } catch (e) {
  //   // Handle parsing errors
  //   print("Error: $e");
  //   return false;
  // }
  //  String selectedTime = "06:00 am - 10:00 am";
  try {
    final DateTime now = DateTime.now();

    // Today (date-only)
    final DateTime today = DateTime(now.year, now.month, now.day);

    // Parse selected date
    final DateTime parsedDate = DateFormat(dateFormat).parse(selectedDate);

    final DateTime selectedDay =
        DateTime(parsedDate.year, parsedDate.month, parsedDate.day);

    final int dayDiff = selectedDay.difference(today).inDays;

    // ================= TODAY =================
    if (dayDiff == 0) {
      DateTime morningCutoff = DateFormat.jm().parse(specificTimeMorning);

      DateTime morningDateTime = DateTime(
        today.year,
        today.month,
        today.day,
        morningCutoff.hour,
        morningCutoff.minute,
      );

      return now.isAfter(morningDateTime); // true = disable
    }

    // ================= TOMORROW =================
    if (dayDiff == 1 && selectedTime.trim() == "06:00 am - 10:00 am") {
      DateTime eveningCutoff = DateFormat.jm().parse(specificTimeEvening);

      DateTime eveningDateTime = DateTime(
        today.year,
        today.month,
        today.day,
        eveningCutoff.hour,
        eveningCutoff.minute,
      );

      return now.isAfter(eveningDateTime); // true = disable
    }

    return false;
  } catch (e) {
    print("Time validation error: $e");
    return false;
  }
}

bool isStockAvailable(dynamic data) {
  if (data is Map<String, dynamic> && data.containsKey("products")) {
    // Ensure "products" is a list
    var products = data["products"];
    if (products is List) {
      for (var product in products) {
        if (product is Map<String, dynamic> && product.containsKey("stock")) {
          // Safely parse stock
          var stock = product["stock"];
          if (stock is int) {
            if (stock == 0) {
              return false; // Stock not available for this product
            }
          } else {
            // print("Invalid stock value: $stock");
            return false; // Handle unexpected stock type
          }
        }
      }
      return true; // All products have stock available
    }
  }

  // print("Invalid data structure or missing 'products' key");
  return false; // Invalid data or no products key
}

bool checkUUIDCondition(
  String addressdetail,
  String userbankdetail,
  String ordersdetail,
  String subscriptionOrderDetail,
) {
  if (addressdetail == "false" &&
      userbankdetail == "false" &&
      ordersdetail == "false" &&
      subscriptionOrderDetail == "false") {
    return true;
  }
  return false;
}

int? paginatioInteger(int? page) {
  // create a function that will +1 the page value  and return  the value
  if (page != null) {
    return page + 1;
  } else {
    return null;
  }
}

int setLoadingCount(int loadingCount) {
//  FFAppState().isGridUpdated = 0;
  return loadingCount;
}

String? trimStringB(String? userName) {
  // Check if userName is null or empty
  if (userName == null || userName.trim().isEmpty) {
    return ''; // Return an empty string if userName is null, empty, or contains only spaces
  }

  // Trim leading and trailing spaces from the userName
  return userName.trim();
}

String? dateFormatterSubscription(String date) {
  // i need a function  that formats a time slot string. The input format is 'HH:mm - HH:mm AM/PM', like '06:00 - 10:00 AM', and I want to display it as '06-10 AM'.
  final List<String> parts = date.split(' - ');
  final List<String> startParts = parts[0].split(':');
  final List<String> endParts = parts[1].split(':');
  final String startTime =
      '${startParts[0]}-${endParts[0]} ${parts[1].substring(6)}';
  return startTime;
}

dynamic getSelectedSubscriptionData(
  String selectedCartId,
  dynamic arrayListMain,
) {
  // print("Selected Cart ID: $selectedCartId");
  // print("Selected Cart ID: ${arrayListMain[0]['user_name']}");

  // Ensure arrayListMain is a list and check its count safely
  if (arrayListMain is List && arrayListMain.isNotEmpty) {
    // print("Total Orders: ${arrayListMain.length}");
    // print("First Order User: ${arrayListMain[0]['user_name']}");

    // Loop through orders to find matching cart_id
    for (var item in arrayListMain) {
      if (item["cart_id"] == selectedCartId) {
        // print("Matching Data Found: ${item}");

        return item ?? []; // Return data or empty list if null
      }
    }
  } else {
    print("Error: arrayListMain is not a valid list.");
  }

  return null;
}

bool checkRestrictions(
  String? restrictedCities,
  String? selectedCity,
  String? itemTotal,
  String? aboveAmount,
) {
  double itemTotalValue = double.tryParse(itemTotal?.trim() ?? '') ?? 0;
  double aboveAmountValue =
      double.tryParse(aboveAmount?.trim() ?? '') ?? 30; // Default 30

  bool isRestrict = false;
  // print("✅  restriction for this city.------------->$restrictedCities");
  // print("✅ selectedCity  for this city.------------->$selectedCity");

  if (restrictedCities != null &&
      restrictedCities.isNotEmpty &&
      selectedCity != null) {
    List<String> cities = restrictedCities.split(",");

    for (String city in cities) {
      if (selectedCity.toLowerCase().contains(city.trim().toLowerCase())) {
        isRestrict = true;
        // print("Restricted -----: $isRestrict");
        break; // Exit loop early if a match is found
      }
    }
  }
  bool isPass = false;
  // Check if itemTotalValue is greater than aboveAmountValue
  if (isRestrict) {
    if (itemTotalValue > aboveAmountValue) {
      // print(
      //     "✅ Allowed: Item Total ($itemTotalValue) is greater than Limit ($aboveAmountValue)");
      isPass = false; // Not restricted if item total is greater
    } else {
      // print(
      //     "❌ Restricted: Item Total ($itemTotalValue) is less than or equal to Limit ($aboveAmountValue)");
      isPass = true; // Restricted if item total is less or equal
    }
  }

  // print("✅ No restriction for this city------------------------->$isPass.");
  return isPass;
}

String? calculateDifference(
  String? totalValue,
  String? reachamount,
) {
  if (totalValue == null || reachamount == null) return null;
  if (totalValue.isEmpty || reachamount.isEmpty) return null;

  double amount1 = double.tryParse(totalValue) ?? 0;
  double amount2 = double.tryParse(reachamount) ?? 0;

  double difference = (amount1 - amount2).abs();

  return difference.toStringAsFixed(2);
}

bool isOfferProductOrder(dynamic productJson) {
  bool hasOffer = false;

  if (productJson is List) {
    // print("Offer Found1: $hasOffer");

    for (var product in productJson) {
      final offerValue = product['is_offer_product'];
      if (offerValue == 1 || offerValue == '1') {
        // print("Offer Found2: $hasOffer");
        hasOffer = true;
        break;
      }
    }
  } else {
    // print("Offer Found3: $hasOffer");

    hasOffer = false;
  }

  // print("Offer Found: $hasOffer");
  return hasOffer;
}

dynamic updateNotifyme(
  String addRemove,
  dynamic list,
  int index,
) {
  if (list == null) return list;

  try {
    if (addRemove == "add") {
      list[index]['notify_me'] = "true";
    } else if (addRemove == "add1") {
      list['varients'][index]['notify_me'] = 'true';
    }
    return list;
  } catch (e) {
    print("Error updating cart qty: $e");
    return list;
  }
}

bool? checkVariantsWithStock(dynamic variants) {
  try {
    if (variants == null || variants is! List) return false;

    // True if at least one variant has stock > 0
    final bool hasStock = variants.any((v) {
      final stock = (v is Map && v['stock'] != null)
          ? int.tryParse(v['stock'].toString()) ?? 0
          : 0;
      if (stock > 0) {
        // print("G1---3---> true");
        return true;
      } else {
        // print("G1---2--->false");
        return false;
      }
      // return stock > 0;
    });
    // print("G1---1--->$hasStock");

    return hasStock;
  } catch (e) {
    print("Error in checkVariantsWithStock: $e");
    return false;
  }
}

bool checkVariantFeatureCondition(dynamic productList) {
  try {
    if (productList == null) return false;

    final variants = productList['varients'] ?? [];
    final features = productList['features'] ?? [];

    final int variantCount = (variants is List) ? variants.length : 0;
    final int featureCount = (features is List) ? features.length : 0;

    if (variantCount >= 2) {
      return true;
    }

    if (variantCount == 1 && featureCount >= 1) {
      return true;
    }

    return false;
  } catch (e) {
    print("Error in checkVariantFeatureCondition: $e");
    return false;
  }

  return false;
}

dynamic updateSelectedIndexData(
  dynamic list,
  dynamic updatedData,
  int selectedIndex,
) {
  if (list == null) return list;

  try {
    final variants = List<Map<String, dynamic>>.from(updatedData['varients']);
    final totalCartQty = variants.fold<int>(
      0,
      (sum, v) => sum + ((v['cart_qty'] ?? 0) as int),
    );
    list[selectedIndex]['total_cart_qty'] = totalCartQty;
    list[selectedIndex]['notify_me'] = updatedData['notify_me'];
    list[selectedIndex]['varients'] = updatedData['varients'];
    // print("total_cart_qty:------- $totalCartQty");

    return list;
  } catch (e) {
    print("Error updating cart qty: $e");
    return list;
  }
}

String getVariantDescription(
  dynamic variants,
  String selectedVariabtId,
) {
  if (variants == null || selectedVariabtId.isEmpty) return "";

  try {
    final int id = int.tryParse(selectedVariabtId) ?? -1;

    final variant = (variants as List).firstWhere(
      (v) => v['varient_id'] == id,
      orElse: () => null,
    );

    if (variant != null && variant['description'] != null) {
      // print("G1----->${variant['description'].toString()}");
      return variant['description'].toString();
    }
    return "";
  } catch (e) {
    return "";
  }
}

String calculateVariantTotals(
  dynamic dataJson,
  String cartType,
) {
  if (dataJson == null || dataJson == null || dataJson['varients'] == null) {
    return "0";
  }

  final variants = dataJson['varients'] as List;

  double total = 0.0;
  int cartQty = 0;
  int subcartQty = 0;
  for (var variant in variants) {
    if (cartType == "daily") {
      cartQty = (variant['cart_qty'] ?? 0).toInt();
    } else {
      subcartQty = (variant['subcartQty'] ?? 0).toInt();
    }
    final double price = (variant['price'] ?? 0).toDouble();

    total += (cartQty + subcartQty) * price;
  }
  // print("G1----->$total");
  return total.toString();
}

String combineInstructions(
  String? s1,
  String? s2,
  String? s3,
) {
  final instructions = [s1, s2, s3];

  // Filter out null or empty strings, then join
  return instructions.where((s) => s != null && s.trim().isNotEmpty).join(", ");
}

bool? isNullOrEmpty(String? text) {
  print("G1----isNullOrEmpty--------->${text == null || text.trim().isEmpty}");
  return text == null || text.trim().isEmpty;
}

bool checkVarientStockAvailable(
  int selectedIndex,
  dynamic varients,
) {
  try {
    if (varients == null || varients is! List || varients.isEmpty) {
      return false;
    }

    // Case 1: If no variant selected, use first one
    if (selectedIndex == 0) {
      final stock = int.tryParse(varients[0]['stock'].toString()) ?? 0;
      // print("G1------index 0 ---->$stock");
      return stock > 0;
    }

    // Case 2: Find matching variant by ID
    for (final v in varients) {
      final varientId = int.tryParse(v['varient_id'].toString()) ?? 0;
      final stock = int.tryParse(v['stock'].toString()) ?? 0;

      if (varientId == selectedIndex) {
        // print("G1------stock 0 ---->$stock");

        return stock > 0;
      }
    }

    return false;
  } catch (e) {
    print("Error in checkVarientStockAvailable: $e");
    return false;
  }
}

dynamic updateQtyPlusMinus(
  dynamic list,
  int index,
  String addRemove,
  int productFeatureID,
) {
  if (addRemove == "add1" || addRemove == "remove1") {
    if (addRemove == "add1") {
      list['varients'][index]['cart_qty'] += 1;
      list['varients'][index]['product_feature_id'] = productFeatureID;
      return list;
    } else {
      if (list['varients'][index]['cart_qty'] > 0) {
        list['varients'][index]['cart_qty'] -= 1;
        list['varients'][index]['product_feature_id'] = productFeatureID;
      }
      return list;
    }
  } else if (addRemove == "addSub" || addRemove == "removeSub") {
    // print("G1----addSub----->");
    if (addRemove == "addSub") {
      list['varients'][index]['subcartQty'] += 1;
      list['varients'][index]['product_feature_id'] = productFeatureID;
      return list;
    } else {
      if (list['varients'][index]['subcartQty'] > 0) {
        list['varients'][index]['subcartQty'] -= 1;
        list['varients'][index]['product_feature_id'] = productFeatureID;
      }
      return list;
    }
  } else if (addRemove == "add" || addRemove == "remove") {
    if (addRemove == "add") {
      list[index]['cart_qty'] += 1;
      list[index]['total_cart_qty'] += 1;
      return list;
    } else {
      if (list[index]['cart_qty'] > 0) {
        list[index]['cart_qty'] -= 1;
        list[index]['total_cart_qty'] -= 1;
      }
      return list;
    }
  } else if (addRemove == "addWish" || addRemove == "removeWish") {
    print("G1----->$addRemove");
    if (addRemove == "addWish") {
      print("G1---FALSE-->$addRemove");
      list[index]['isFavourite'] = "true";
      return list;
    } else {
      print("G1---TRUE-->$addRemove");
      list[index]['isFavourite'] = "false";

      return list;
    }
  }

  return list;
}

dynamic getOrderItemsByCartId(
  String selectedCartID,
  dynamic responseJson,
) {
  try {
    final parsed =
        responseJson is String ? jsonDecode(responseJson) : responseJson;

    if (parsed == null) {
      return [];
    }

    for (final order in parsed) {
      if (order['cart_id'] == selectedCartID) {
        // Return the entire "data" for that cart
        return order;
      }
    }

    // If no cart_id matches, return empty object instead of null
    return {};
  } catch (e) {
    print('getOrderItemsByCartId error: $e');
    return {};
  }
}

List<dynamic> getVarientIdsWithCartQty(
  dynamic variants,
  String isSubCart,
) {
  if (isSubCart == "sub") {
    var v1 = variants
        .where((v) => v is Map && (v["subcartQty"] ?? 0) > 0)
        .map<int>((v) => v["varient_id"] as int)
        .toList();

    // print("G1-------> $v1");
    return v1.isNotEmpty ? v1 : <int>[];
  } else if (isSubCart == "product") {
    final List<dynamic> categories = variants ?? [];
    final List<int> varientIds = [];

    for (final category in categories) {
      final List<dynamic> products = category['products'] ?? [];
      for (final product in products) {
        final varientId = product['varient_id'];
        if (varientId != null) {
          varientIds.add(varientId);
        }
      }
    }
    print("G1-------> $varientIds");
    return varientIds.isNotEmpty ? varientIds : <int>[];
  } else {
    var v1 = variants
        .where((v) => v is Map && (v["cart_qty"] ?? 0) > 0)
        .map<int>((v) => v["varient_id"] as int)
        .toList();

    // print("G1-------> $v1");
    return v1.isNotEmpty ? v1 : <int>[];
  }
}

bool isDiscountEmpty(String discount) {
  if (discount == null) return false;

  final d = discount.toString().trim();

  return d.isEmpty || d == "0";
}

String checkSelectedTimeslotCashback(dynamic data) {
  try {
    final List timeslotsData = data['timeslotsdata'] ?? [];
    final List products = data['products'] ?? [];

    if (timeslotsData.isEmpty) return "";

    // 1. Safely get selectedDate and selectedTime
    String selectedDate = (data['selectedDate'] ?? "").toString();
    String selectedTime = (data['selectedTime'] ?? "").toString();

    // 2. If either is empty, pick first available date & time slot
    if (selectedDate.isEmpty || selectedTime.isEmpty) {
      // final firstDateEntry = timeslotsData[0];
      // selectedDate = (firstDateEntry['date'] ?? "").toString();
      // final firstTimeslots = (firstDateEntry['timeslots'] ?? []) as List;
      // selectedTime = firstTimeslots.isNotEmpty
      //     ? ((firstTimeslots[0]['time_slots'] ?? "").toString())
      //     : "";
      return "";
    }

    // 3. Find matching date
    final dateEntry = timeslotsData.firstWhere(
      (d) => (d['date'] ?? "").toString() == selectedDate,
      orElse: () => null,
    );
    if (dateEntry == null) return "";

    // 4. Find matching time slot
    final slot = ((dateEntry['timeslots'] ?? []) as List).firstWhere(
      (s) => (s['time_slots'] ?? "").toString() == selectedTime,
      orElse: () => null,
    );
    if (slot == null) return "";

    // 5. Discount & minAmount
    final double discount =
        double.tryParse((slot['discount'] ?? "0").toString()) ?? 0;
    final double minAmount =
        double.tryParse((slot['min_amount'] ?? "0").toString()) ?? 0;

    // 6. Calculate total cart amount
    double total = 0.0;
    for (final p in products) {
      final int qty = int.tryParse((p['cart_qty'] ?? "0").toString()) ?? 0;
      final double price = double.tryParse((p['price'] ?? "0").toString()) ?? 0;
      total += qty * price;
    }
    if (total <= 0) return "";

    // 7. Check eligibility
    if (discount > 0) {
      if (total >= minAmount) {
        final double cashback = total * discount / 100;

        // return "Your selected time slot $selectedTime is getting AED ${cashback.toStringAsFixed(2)} cashback";
        return "Awesome! You’ve earned AED ${cashback.toStringAsFixed(2)} cashback";
      } else {
        final needed = (minAmount - total).toStringAsFixed(2);
        return "You have to add AED $needed to get $discount% cashback for selected time slot $selectedTime";
      }
    }

    return "";
  } catch (e) {
    return "";
  }
}

String calculateTotalCashback(dynamic rootJson) {
  try {
    final List categories = rootJson ?? [];
    if (categories.isEmpty) return "0";

    double totalCashback = 0.0;

    for (final cat in categories) {
      final List timeslotsData = cat['timeslotsdata'] ?? [];
      final List products = cat['products'] ?? [];

      if (timeslotsData.isEmpty || products.isEmpty) continue;

      // selected values
      String selectedDate = (cat['selectedDate'] ?? "").toString();
      String selectedTime = (cat['selectedTime'] ?? "").toString();

      // fallback to first slot if missing
      if (selectedDate.isEmpty || selectedTime.isEmpty) {
        final firstDateEntry = timeslotsData[0];
        selectedDate = (firstDateEntry['date'] ?? "").toString();
        final firstTimeslots = (firstDateEntry['timeslots'] ?? []) as List;
        selectedTime = firstTimeslots.isNotEmpty
            ? ((firstTimeslots[0]['time_slots'] ?? "").toString())
            : "";
      }

      // find date entry
      final dateEntry = timeslotsData.firstWhere(
        (d) => (d['date'] ?? "").toString() == selectedDate,
        orElse: () => null,
      );
      if (dateEntry == null) continue;

      // find slot
      final slot = ((dateEntry['timeslots'] ?? []) as List).firstWhere(
        (s) => (s['time_slots'] ?? "").toString() == selectedTime,
        orElse: () => null,
      );
      if (slot == null) continue;

      // slot values
      final double discount =
          double.tryParse((slot['discount'] ?? "0").toString()) ?? 0;
      final double minAmount =
          double.tryParse((slot['min_amount'] ?? "0").toString()) ?? 0;

      // category total
      double catTotal = 0.0;
      for (final p in products) {
        final int qty = int.tryParse((p['cart_qty'] ?? "0").toString()) ?? 0;
        final double price =
            double.tryParse((p['price'] ?? "0").toString()) ?? 0;
        catTotal += qty * price;
      }
      if (catTotal <= 0) continue;

      // cashback for this category
      if (discount > 0 && catTotal >= minAmount) {
        totalCashback += (catTotal * discount / 100);
      }
    }
    return totalCashback > 0
        ? "AED ${totalCashback.toStringAsFixed(2)} cashback on this order"
        : "";
  } catch (e) {
    print("Error in calculateTotalCashback: $e");
    return " ";
  }
}

int getProductFeatureId(dynamic variants) {
  try {
    if (variants == null || variants is! List || variants.isEmpty) {
      return 0;
    }

    // Find the first variant with a valid product_feature_id > 0
    for (final v in variants) {
      final int featureId =
          int.tryParse(v['product_feature_id'].toString()) ?? 0;
      if (featureId > 0) {
        // print("G1-----featureId--->$featureId");
        return featureId;
      }
    }

    // No valid feature_id found
    // print("G1-----index--->${variants[0]['product_feature_id']}");
    return 0;
  } catch (e) {
    print("Error in getProductFeatureId: $e");
    return 0;
  }
}

String formatTimeRange(String input) {
  if (input.isEmpty) return "";

  String cleaned = input.replaceAll(":00 am", " AM ");
  String cleaned1 = cleaned.replaceAll(":00 pm", " PM ");

  String cleaned2 = cleaned1.replaceAll(" - ", " to ");
  return cleaned2.trim();
}

String checkTomorrowTimeslotAvailability(dynamic timeslotsData) {
  try {
    if (timeslotsData == null || timeslotsData is! List) {
      return "";
    }

    // Get tomorrow's date (formatted as yyyy-MM-dd)
    final tomorrowDate = DateTime.now().add(Duration(days: 1));
    final formattedDate =
        "${tomorrowDate.year.toString().padLeft(4, '0')}-${tomorrowDate.month.toString().padLeft(2, '0')}-${tomorrowDate.day.toString().padLeft(2, '0')}";

    // Find the timeslot entry for tomorrow
    final tomorrowEntry = timeslotsData.firstWhere(
      (item) => item['date'] == formattedDate,
      orElse: () => null,
    );

    if (tomorrowEntry == null) {
      return "This time slot is unavailable for tomorrow. Please select a different date or remove items from this category.";
    }

    // Extract timeslots for tomorrow
    final times = tomorrowEntry['timeslots'] ?? [];

    // Check if "06:00 am - 10:00 am" exists
    final hasMorningSlot = times.any(
      (slot) => slot['time_slots'] == "06:00 am - 10:00 am",
    );

    if (!hasMorningSlot) {
      return "This time slot is unavailable for tomorrow. Please select a different date or remove items from this category.";
    }

    // Slot available — return empty message
    return "";
  } catch (e) {
    print("Error in checkTomorrowTimeslotAvailability: $e");
    return "";
  }
}

double getContainerWidth(
  dynamic myList,
  String type,
  double screenWidth,
) {
  if (myList == null) return 1.0;

  return myList.length > 1 ? (screenWidth - 70) : (screenWidth - 5);
}

String? validateSelectedDateTime(dynamic data) {
  if (data == null || data.isEmpty) {
    return 'No category data available';
  }

  for (final item in data) {
    final selectedDate = item['selectedDate'];
    final selectedTime = item['selectedTime'];

    if (selectedDate == null || selectedTime == null) {
      return 'Please select delivery date and time for all categories';
    }
  }

  return ""; // validation passed
}

bool? isValidDateRange(
  DateTime startDate,
  DateTime endDate,
) {
  print("G1----->$startDate &  $endDate");
  return !endDate.isBefore(startDate);
}

String? setDateFormatterbyISO(
  String date,
  String type,
  String dateFormate,
) {
  if (date.isEmpty) return null;

  try {
    // Parse ISO date safely (2026-01-15T07:21:06.000Z)
    final inputDate = DateTime.parse(date).toLocal();

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final aDate = DateTime(inputDate.year, inputDate.month, inputDate.day);

    if (aDate == today && type == "EEE") {
      return "Today";
    } else if (aDate == tomorrow && type == "EEE") {
      return "Tomorrow";
    } else {
      return DateFormat(type).format(inputDate);
    }
  } catch (e) {
    return null;
  }
}

String toLowerCaseSafe(String? value) {
  if (value == null) return '';
  return value.toLowerCase();
}

String getWalletMessage(String? resource) {
  final r = (resource ?? '').toLowerCase().trim();

  // ================= ADMIN =================
  if (r.contains('admin_added')) {
    return 'Amount added by admin';
  }

  if (r.contains('admin_removed')) {
    return 'Amount deducted by admin';
  }

  // ================= ORDER =================
  if (r.contains('order_placed_wallet')) {
    return 'Wallet amount used for order';
  }

  if (r.contains('order_wallet_deduction')) {
    return 'Wallet amount deducted for order';
  }

  if (r.contains('order_refund_cancelled')) {
    return 'Order cancelled, refund added to wallet';
  }

  // ================= CASHBACK =================
  if (r.contains('cash_back')) {
    return 'Cashback credited to wallet';
  }

  // ================= REFERRAL =================
  if (r.contains('referral')) {

    if (r.contains('registration')) {
      return 'Referral bonus after registration';
    }

    if (r.contains('first_order')) {
      return 'Referral bonus after first order completion';
    }

    if (r.contains('return')) {
      return 'Referral bonus returned to wallet';
    }

    return 'Referral bonus credited';
  }

  // ================= GENERIC =================
  if (r.contains('add')) {
    return 'Wallet amount added';
  }

  if (r.contains('deduct') || r.contains('remove')) {
    return 'Wallet amount deducted';
  }

  if (r.contains('expire')) {
    return 'Wallet balance expired';
  }

  // ================= DEFAULT =================
  return 'Wallet transaction';
}

double calculateFinalPayableForCashPayment(
  String? totalPay,
  String? refWallet,
  String? cashWallet,
  String? isCashWalletApplied,
) {
  // print(
  //     "G1----cw->$totalPay & $refWallet & $cashWallet & $isCashWalletApplied");
  // Convert values safely
  final double total = double.tryParse(totalPay ?? '0') ?? 0.0;

  final double ref = double.tryParse(refWallet ?? '0') ?? 0.0;

  final double cash = double.tryParse(cashWallet ?? '0') ?? 0.0;
  // print("G1----11->$total & $ref & $cash ");

  // Step 1: Remaining after referral wallet
  double remaining = total - ref;
  if (remaining < 0) remaining = 0.0;

  final String action = (isCashWalletApplied ?? '').toLowerCase();

  double appliedCash = 0.0;

  if (action == 'add' || action == 'true' || action == '1') {
    if (cash <= remaining) {
      appliedCash = cash; // apply full cash wallet
    } else {
      appliedCash = remaining; // apply only remaining amount
    }
  }
  // print("G1----12->$appliedCash ");
  return appliedCash;
}

String getPaymentMethod(
  String? paymentMethod,
  double? totalAmount,
  String? orderType,
) {
  final String method = paymentMethod?.toLowerCase().trim() ?? '';
  final double rawTotal = totalAmount ?? 0.0;

  // 🔹 Step 1: Round to 2 decimal places
  final double total = double.parse(rawTotal.toStringAsFixed(2));

  // 🔹 Step 2: Prevent negative values
  if (total < 0) {
    return '';
  }

  // 🔹 Step 3: Handle zero values
  if (total == 0.00) {
    return 'Wallet';
  }

  // 🔹 Step 4: Handle all positive values
  if (total > 0.00) {
    if (method == 'cod') {
      return 'COD';
    } else if (method == 'card') {
      return 'Card';
    } else {
      return 'Card'; // safe default
    }
  }

  return 'Card';
}

bool checkTotalAndOrderType(
  String? total,
  String? orderType,
) {
  double totalValue = double.tryParse(total ?? "0") ?? 0.0;
  String type = (orderType ?? "").toLowerCase().trim();

  if (totalValue <= 0 && type != "paynow") {
    return false;
  }
  
  return true;
}
int getItemQtyByIndex(
  dynamic listData,
  int? selectedIndex,
  bool isSub,
) {
  // print("G1----->listData---->${listData.length}.   &.  $selectedIndex  ");
  // print("G1----->listData---->${listData}");
  if (listData == null ||
      selectedIndex == null ||
      selectedIndex >= listData.length) {
    return 0;
  }

  final item = listData[selectedIndex] as Map<String, dynamic>;

  if (isSub) {
    // print("G1----->subcartQty---->${item['subcartQty'].toString()}");

    return int.tryParse(item['subcartQty'].toString()) ?? 0;
  } else {
    // print("G1----->cart_qty---->${item['cart_qty'].toString()}");
  }

  return int.tryParse(item['cart_qty'].toString()) ?? 0;
}

dynamic getItemByIndex(
  dynamic listData,
  int? selectedIndex,
) {
  // print("G1----->listData---->${listData.length}.   &.  $selectedIndex  ");
  // print("G1----->listData---->${listData}");
  if (listData == null ||
      selectedIndex == null ||
      selectedIndex >= listData.length) {
    return 0;
  }

  final item = listData[selectedIndex] as Map<String, dynamic>;
  print("G1----->item---->${item}");
  return item;
}
String getGrandPrizeMessage(
  double cartTotal,
  int minimumAmount,
  String addMsg,
  String successMsg,
) {
   if (cartTotal >= minimumAmount) {
    return successMsg;
  }

  double remainingAmount =
      double.parse((minimumAmount - cartTotal).toStringAsFixed(2));

  print(
      "G1---remainingAmount--->$remainingAmount = $minimumAmount - $cartTotal");

  return "Add AED ${remainingAmount.toStringAsFixed(2)} $addMsg";
}