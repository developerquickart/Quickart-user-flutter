import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _phoneNo = await secureStorage.getString('ff_phoneNo') ?? _phoneNo;
    });
    await _safeInitAsync(() async {
      _deviceID = await secureStorage.getString('ff_deviceID') ?? _deviceID;
    });
    await _safeInitAsync(() async {
      _userName = await secureStorage.getString('ff_userName') ?? _userName;
    });
    await _safeInitAsync(() async {
      _userEmail = await secureStorage.getString('ff_userEmail') ?? _userEmail;
    });
    await _safeInitAsync(() async {
      _storeID = await secureStorage.getString('ff_storeID') ?? _storeID;
    });
    await _safeInitAsync(() async {
      _userID = await secureStorage.getString('ff_userID') ?? _userID;
    });
    await _safeInitAsync(() async {
      _isUserLogin =
          await secureStorage.getBool('ff_isUserLogin') ?? _isUserLogin;
    });
    await _safeInitAsync(() async {
      _isverified = await secureStorage.getInt('ff_isverified') ?? _isverified;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_checkArray') != null) {
        try {
          _checkArray =
              jsonDecode(await secureStorage.getString('ff_checkArray') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _dialCode = await secureStorage.getString('ff_dialCode') ?? _dialCode;
    });
    await _safeInitAsync(() async {
      _selectedAddresID =
          await secureStorage.getString('ff_selectedAddresID') ??
              _selectedAddresID;
    });
    await _safeInitAsync(() async {
      _userPhoneNo =
          await secureStorage.getString('ff_userPhoneNo') ?? _userPhoneNo;
    });
    await _safeInitAsync(() async {
      _userCountryCode = await secureStorage.getString('ff_userCountryCode') ??
          _userCountryCode;
    });
    await _safeInitAsync(() async {
      _profileImage =
          await secureStorage.getString('ff_profileImage') ?? _profileImage;
    });
    await _safeInitAsync(() async {
      _profileImageBytes =
          await secureStorage.getString('ff_profileImageBytes') ??
              _profileImageBytes;
    });
    await _safeInitAsync(() async {
      _userPhoneEP =
          await secureStorage.getString('ff_userPhoneEP') ?? _userPhoneEP;
    });
    await _safeInitAsync(() async {
      _userCountryCodeEP =
          await secureStorage.getString('ff_userCountryCodeEP') ??
              _userCountryCodeEP;
    });
    await _safeInitAsync(() async {
      _userPhoneProfile =
          await secureStorage.getString('ff_userPhoneProfile') ??
              _userPhoneProfile;
    });
    await _safeInitAsync(() async {
      _usserType = await secureStorage.getString('ff_usserType') ?? _usserType;
    });
    await _safeInitAsync(() async {
      _userDialCode =
          await secureStorage.getString('ff_userDialCode') ?? _userDialCode;
    });
    await _safeInitAsync(() async {
      _userGUUID = await secureStorage.getString('ff_userGUUID') ?? _userGUUID;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  double _gLatitude = 25.2048;
  double get gLatitude => _gLatitude;
  set gLatitude(double value) {
    _gLatitude = value;
  }

  double _gLongitude = 55.2708;
  double get gLongitude => _gLongitude;
  set gLongitude(double value) {
    _gLongitude = value;
  }

  String _countryCode = '971';
  String get countryCode => _countryCode;
  set countryCode(String value) {
    _countryCode = value;
  }

  String _phoneNo = '';
  String get phoneNo => _phoneNo;
  set phoneNo(String value) {
    _phoneNo = value;
    secureStorage.setString('ff_phoneNo', value);
  }

  void deletePhoneNo() {
    secureStorage.delete(key: 'ff_phoneNo');
  }

  String _deviceID = '';
  String get deviceID => _deviceID;
  set deviceID(String value) {
    _deviceID = value;
    secureStorage.setString('ff_deviceID', value);
  }

  void deleteDeviceID() {
    secureStorage.delete(key: 'ff_deviceID');
  }

  bool _isOTPResend = false;
  bool get isOTPResend => _isOTPResend;
  set isOTPResend(bool value) {
    _isOTPResend = value;
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    secureStorage.setString('ff_userName', value);
  }

  void deleteUserName() {
    secureStorage.delete(key: 'ff_userName');
  }

  String _userEmail = '';
  String get userEmail => _userEmail;
  set userEmail(String value) {
    _userEmail = value;
    secureStorage.setString('ff_userEmail', value);
  }

  void deleteUserEmail() {
    secureStorage.delete(key: 'ff_userEmail');
  }

  String _categoryName = '';
  String get categoryName => _categoryName;
  set categoryName(String value) {
    _categoryName = value;
  }

  String _screenName = '';
  String get screenName => _screenName;
  set screenName(String value) {
    _screenName = value;
  }

  String _storeID = '7';
  String get storeID => _storeID;
  set storeID(String value) {
    _storeID = value;
    secureStorage.setString('ff_storeID', value);
  }

  void deleteStoreID() {
    secureStorage.delete(key: 'ff_storeID');
  }

  String _userID = '';
  String get userID => _userID;
  set userID(String value) {
    _userID = value;
    secureStorage.setString('ff_userID', value);
  }

  void deleteUserID() {
    secureStorage.delete(key: 'ff_userID');
  }

  String _byName = 'null';
  String get byName => _byName;
  set byName(String value) {
    _byName = value;
  }

  String _minPrice = 'null';
  String get minPrice => _minPrice;
  set minPrice(String value) {
    _minPrice = value;
  }

  String _maxPrice = 'null';
  String get maxPrice => _maxPrice;
  set maxPrice(String value) {
    _maxPrice = value;
  }

  String _stock = 'null';
  String get stock => _stock;
  set stock(String value) {
    _stock = value;
  }

  String _minDiscount = 'null';
  String get minDiscount => _minDiscount;
  set minDiscount(String value) {
    _minDiscount = value;
  }

  String _maxDiscount = 'null';
  String get maxDiscount => _maxDiscount;
  set maxDiscount(String value) {
    _maxDiscount = value;
  }

  String _sort = 'null';
  String get sort => _sort;
  set sort(String value) {
    _sort = value;
  }

  String _sortName = 'null';
  String get sortName => _sortName;
  set sortName(String value) {
    _sortName = value;
  }

  String _sortPrice = 'null';
  String get sortPrice => _sortPrice;
  set sortPrice(String value) {
    _sortPrice = value;
  }

  String _catID = 'null';
  String get catID => _catID;
  set catID(String value) {
    _catID = value;
  }

  String _subCateID = 'null';
  String get subCateID => _subCateID;
  set subCateID(String value) {
    _subCateID = value;
  }

  int _page = 1;
  int get page => _page;
  set page(int value) {
    _page = value;
  }

  int _pageCount = 100;
  int get pageCount => _pageCount;
  set pageCount(int value) {
    _pageCount = value;
  }

  String _productID = '';
  String get productID => _productID;
  set productID(String value) {
    _productID = value;
  }

  double _productCount = 0.0;
  double get productCount => _productCount;
  set productCount(double value) {
    _productCount = value;
  }

  String _cartID = '';
  String get cartID => _cartID;
  set cartID(String value) {
    _cartID = value;
  }

  bool _isUserLogin = false;
  bool get isUserLogin => _isUserLogin;
  set isUserLogin(bool value) {
    _isUserLogin = value;
    secureStorage.setBool('ff_isUserLogin', value);
  }

  void deleteIsUserLogin() {
    secureStorage.delete(key: 'ff_isUserLogin');
  }

  int _isverified = 1;
  int get isverified => _isverified;
  set isverified(int value) {
    _isverified = value;
    secureStorage.setInt('ff_isverified', value);
  }

  void deleteIsverified() {
    secureStorage.delete(key: 'ff_isverified');
  }

  int _productCountValue = 0;
  int get productCountValue => _productCountValue;
  set productCountValue(int value) {
    _productCountValue = value;
  }

  int _arraylistCount = 0;
  int get arraylistCount => _arraylistCount;
  set arraylistCount(int value) {
    _arraylistCount = value;
  }

  dynamic _checkArray = jsonDecode('[]');
  dynamic get checkArray => _checkArray;
  set checkArray(dynamic value) {
    _checkArray = value;
    secureStorage.setString('ff_checkArray', jsonEncode(value));
  }

  void deleteCheckArray() {
    secureStorage.delete(key: 'ff_checkArray');
  }

  String _AppName = 'QuicKart';
  String get AppName => _AppName;
  set AppName(String value) {
    _AppName = value;
  }

  String _loginMsg = 'go to register details page';
  String get loginMsg => _loginMsg;
  set loginMsg(String value) {
    _loginMsg = value;
  }

  String _termsOfUse = '';
  String get termsOfUse => _termsOfUse;
  set termsOfUse(String value) {
    _termsOfUse = value;
  }

  String _logoutMsg = 'Are you sure you want to logout?';
  String get logoutMsg => _logoutMsg;
  set logoutMsg(String value) {
    _logoutMsg = value;
  }

  bool _countcontrollerShow = false;
  bool get countcontrollerShow => _countcontrollerShow;
  set countcontrollerShow(bool value) {
    _countcontrollerShow = value;
  }

  bool _firstListImage = false;
  bool get firstListImage => _firstListImage;
  set firstListImage(bool value) {
    _firstListImage = value;
  }

  String _failureImage = 'https://picsum.photos/seed/252/600';
  String get failureImage => _failureImage;
  set failureImage(String value) {
    _failureImage = value;
  }

  String _nullValue = 'null';
  String get nullValue => _nullValue;
  set nullValue(String value) {
    _nullValue = value;
  }

  String _loaderImage = 'https://tenor.com/en-GB/view/free-loader-gif-25681495';
  String get loaderImage => _loaderImage;
  set loaderImage(String value) {
    _loaderImage = value;
  }

  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String value) {
    _searchText = value;
  }

  int _selectedCatId = 0;
  int get selectedCatId => _selectedCatId;
  set selectedCatId(int value) {
    _selectedCatId = value;
  }

  dynamic _categoryList;
  dynamic get categoryList => _categoryList;
  set categoryList(dynamic value) {
    _categoryList = value;
  }

  String _platform = '';
  String get platform => _platform;
  set platform(String value) {
    _platform = value;
  }

  int _qtyZeroCheck = 0;
  int get qtyZeroCheck => _qtyZeroCheck;
  set qtyZeroCheck(int value) {
    _qtyZeroCheck = value;
  }

  String _homeType = 'Home';
  String get homeType => _homeType;
  set homeType(String value) {
    _homeType = value;
  }

  String _workType = 'Work';
  String get workType => _workType;
  set workType(String value) {
    _workType = value;
  }

  String _otherType = 'Others';
  String get otherType => _otherType;
  set otherType(String value) {
    _otherType = value;
  }

  dynamic _appInfo;
  dynamic get appInfo => _appInfo;
  set appInfo(dynamic value) {
    _appInfo = value;
  }

  dynamic _addressModel;
  dynamic get addressModel => _addressModel;
  set addressModel(dynamic value) {
    _addressModel = value;
  }

  String _selectedzCityid = '';
  String get selectedzCityid => _selectedzCityid;
  set selectedzCityid(String value) {
    _selectedzCityid = value;
  }

  String _selectedQTY = '';
  String get selectedQTY => _selectedQTY;
  set selectedQTY(String value) {
    _selectedQTY = value;
  }

  String _selectedAddress = 'Dubai';
  String get selectedAddress => _selectedAddress;
  set selectedAddress(String value) {
    _selectedAddress = value;
  }

  String _selectedAddressType = '';
  String get selectedAddressType => _selectedAddressType;
  set selectedAddressType(String value) {
    _selectedAddressType = value;
  }

  LatLng? _latLang = LatLng(25.2048493, 55.2707828);
  LatLng? get latLang => _latLang;
  set latLang(LatLng? value) {
    _latLang = value;
  }

  bool _isLocationVisible = false;
  bool get isLocationVisible => _isLocationVisible;
  set isLocationVisible(bool value) {
    _isLocationVisible = value;
  }

  String _dialCode = 'AE';
  String get dialCode => _dialCode;
  set dialCode(String value) {
    _dialCode = value;
    secureStorage.setString('ff_dialCode', value);
  }

  void deleteDialCode() {
    secureStorage.delete(key: 'ff_dialCode');
  }

  int _cartTotalCount = 0;
  int get cartTotalCount => _cartTotalCount;
  set cartTotalCount(int value) {
    _cartTotalCount = value;
  }

  double _cartTotalPrice = 0.0;
  double get cartTotalPrice => _cartTotalPrice;
  set cartTotalPrice(double value) {
    _cartTotalPrice = value;
  }

  bool _isCartShow = false;
  bool get isCartShow => _isCartShow;
  set isCartShow(bool value) {
    _isCartShow = value;
  }

  String _onCategorySelected = '';
  String get onCategorySelected => _onCategorySelected;
  set onCategorySelected(String value) {
    _onCategorySelected = value;
  }

  String _orderStatusID = '';
  String get orderStatusID => _orderStatusID;
  set orderStatusID(String value) {
    _orderStatusID = value;
  }

  String _isCardSelected = '';
  String get isCardSelected => _isCardSelected;
  set isCardSelected(String value) {
    _isCardSelected = value;
  }

  bool _isSelectedHome = false;
  bool get isSelectedHome => _isSelectedHome;
  set isSelectedHome(bool value) {
    _isSelectedHome = value;
  }

  List<String> _imageforBanner = [];
  List<String> get imageforBanner => _imageforBanner;
  set imageforBanner(List<String> value) {
    _imageforBanner = value;
  }

  void addToImageforBanner(String value) {
    imageforBanner.add(value);
  }

  void removeFromImageforBanner(String value) {
    imageforBanner.remove(value);
  }

  void removeAtIndexFromImageforBanner(int index) {
    imageforBanner.removeAt(index);
  }

  void updateImageforBannerAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imageforBanner[index] = updateFn(_imageforBanner[index]);
  }

  void insertAtIndexInImageforBanner(int index, String value) {
    imageforBanner.insert(index, value);
  }

  String _keyword = '';
  String get keyword => _keyword;
  set keyword(String value) {
    _keyword = value;
  }

  bool _isSubcribeCartVisible = false;
  bool get isSubcribeCartVisible => _isSubcribeCartVisible;
  set isSubcribeCartVisible(bool value) {
    _isSubcribeCartVisible = value;
  }

  bool _isMonSelected = false;
  bool get isMonSelected => _isMonSelected;
  set isMonSelected(bool value) {
    _isMonSelected = value;
  }

  bool _isTueSelected = false;
  bool get isTueSelected => _isTueSelected;
  set isTueSelected(bool value) {
    _isTueSelected = value;
  }

  bool _isWedSelected = false;
  bool get isWedSelected => _isWedSelected;
  set isWedSelected(bool value) {
    _isWedSelected = value;
  }

  bool _isThuSelected = false;
  bool get isThuSelected => _isThuSelected;
  set isThuSelected(bool value) {
    _isThuSelected = value;
  }

  bool _isFriSelected = false;
  bool get isFriSelected => _isFriSelected;
  set isFriSelected(bool value) {
    _isFriSelected = value;
  }

  bool _isSatSelected = false;
  bool get isSatSelected => _isSatSelected;
  set isSatSelected(bool value) {
    _isSatSelected = value;
  }

  bool _isSunSelected = false;
  bool get isSunSelected => _isSunSelected;
  set isSunSelected(bool value) {
    _isSunSelected = value;
  }

  int _userIdInt = 0;
  int get userIdInt => _userIdInt;
  set userIdInt(int value) {
    _userIdInt = value;
  }

  int _isCheckDeliveryFree = 0;
  int get isCheckDeliveryFree => _isCheckDeliveryFree;
  set isCheckDeliveryFree(int value) {
    _isCheckDeliveryFree = value;
  }

  bool _isAddressChange = false;
  bool get isAddressChange => _isAddressChange;
  set isAddressChange(bool value) {
    _isAddressChange = value;
  }

  bool _isCardChange = false;
  bool get isCardChange => _isCardChange;
  set isCardChange(bool value) {
    _isCardChange = value;
  }

  String _selectedAddresID = '';
  String get selectedAddresID => _selectedAddresID;
  set selectedAddresID(String value) {
    _selectedAddresID = value;
    secureStorage.setString('ff_selectedAddresID', value);
  }

  void deleteSelectedAddresID() {
    secureStorage.delete(key: 'ff_selectedAddresID');
  }

  String _selectedCartAddress = '';
  String get selectedCartAddress => _selectedCartAddress;
  set selectedCartAddress(String value) {
    _selectedCartAddress = value;
  }

  double _couponDiscount = 0.0;
  double get couponDiscount => _couponDiscount;
  set couponDiscount(double value) {
    _couponDiscount = value;
  }

  String _deliveryPartnerInstructionAvoid = '';
  String get deliveryPartnerInstructionAvoid =>
      _deliveryPartnerInstructionAvoid;
  set deliveryPartnerInstructionAvoid(String value) {
    _deliveryPartnerInstructionAvoid = value;
  }

  String _kmAway = '';
  String get kmAway => _kmAway;
  set kmAway(String value) {
    _kmAway = value;
  }

  String _selectedCardID = '';
  String get selectedCardID => _selectedCardID;
  set selectedCardID(String value) {
    _selectedCardID = value;
  }

  String _selectedCardNumber = '';
  String get selectedCardNumber => _selectedCardNumber;
  set selectedCardNumber(String value) {
    _selectedCardNumber = value;
  }

  Color _selectedId = Colors.transparent;
  Color get selectedId => _selectedId;
  set selectedId(Color value) {
    _selectedId = value;
  }

  int _isVacationSelected = 0;
  int get isVacationSelected => _isVacationSelected;
  set isVacationSelected(int value) {
    _isVacationSelected = value;
  }

  Color _vacationContainerColor = Color(4294967295);
  Color get vacationContainerColor => _vacationContainerColor;
  set vacationContainerColor(Color value) {
    _vacationContainerColor = value;
  }

  List<bool> _dummy = [];
  List<bool> get dummy => _dummy;
  set dummy(List<bool> value) {
    _dummy = value;
  }

  void addToDummy(bool value) {
    dummy.add(value);
  }

  void removeFromDummy(bool value) {
    dummy.remove(value);
  }

  void removeAtIndexFromDummy(int index) {
    dummy.removeAt(index);
  }

  void updateDummyAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    dummy[index] = updateFn(_dummy[index]);
  }

  void insertAtIndexInDummy(int index, bool value) {
    dummy.insert(index, value);
  }

  String _imageNullCheck = 'N/A';
  String get imageNullCheck => _imageNullCheck;
  set imageNullCheck(String value) {
    _imageNullCheck = value;
  }

  String _userPhoneNo = '';
  String get userPhoneNo => _userPhoneNo;
  set userPhoneNo(String value) {
    _userPhoneNo = value;
    secureStorage.setString('ff_userPhoneNo', value);
  }

  void deleteUserPhoneNo() {
    secureStorage.delete(key: 'ff_userPhoneNo');
  }

  String _userCountryCode = '';
  String get userCountryCode => _userCountryCode;
  set userCountryCode(String value) {
    _userCountryCode = value;
    secureStorage.setString('ff_userCountryCode', value);
  }

  void deleteUserCountryCode() {
    secureStorage.delete(key: 'ff_userCountryCode');
  }

  int _isCancelReason = 0;
  int get isCancelReason => _isCancelReason;
  set isCancelReason(int value) {
    _isCancelReason = value;
  }

  String _cancelReason = '';
  String get cancelReason => _cancelReason;
  set cancelReason(String value) {
    _cancelReason = value;
  }

  int _isWeekSelected = 0;
  int get isWeekSelected => _isWeekSelected;
  set isWeekSelected(int value) {
    _isWeekSelected = value;
  }

  String _isDeliveryTimeSlotSelected = 'no';
  String get isDeliveryTimeSlotSelected => _isDeliveryTimeSlotSelected;
  set isDeliveryTimeSlotSelected(String value) {
    _isDeliveryTimeSlotSelected = value;
  }

  int _varientID = 0;
  int get varientID => _varientID;
  set varientID(int value) {
    _varientID = value;
  }

  int _currentQuantity = 0;
  int get currentQuantity => _currentQuantity;
  set currentQuantity(int value) {
    _currentQuantity = value;
  }

  String _repeatDays = '';
  String get repeatDays => _repeatDays;
  set repeatDays(String value) {
    _repeatDays = value;
  }

  int _subCartWeek = 1;
  int get subCartWeek => _subCartWeek;
  set subCartWeek(int value) {
    _subCartWeek = value;
  }

  bool _isPlusClick = false;
  bool get isPlusClick => _isPlusClick;
  set isPlusClick(bool value) {
    _isPlusClick = value;
  }

  String _totalDelieveries = '';
  String get totalDelieveries => _totalDelieveries;
  set totalDelieveries(String value) {
    _totalDelieveries = value;
  }

  bool _isSubCartVisible = false;
  bool get isSubCartVisible => _isSubCartVisible;
  set isSubCartVisible(bool value) {
    _isSubCartVisible = value;
  }

  String _couponCode = '';
  String get couponCode => _couponCode;
  set couponCode(String value) {
    _couponCode = value;
  }

  String _couponCodeMessage = '';
  String get couponCodeMessage => _couponCodeMessage;
  set couponCodeMessage(String value) {
    _couponCodeMessage = value;
  }

  String _dynamicLink = '';
  String get dynamicLink => _dynamicLink;
  set dynamicLink(String value) {
    _dynamicLink = value;
  }

  String _isDeliveryPartnerTipSelected = '0';
  String get isDeliveryPartnerTipSelected => _isDeliveryPartnerTipSelected;
  set isDeliveryPartnerTipSelected(String value) {
    _isDeliveryPartnerTipSelected = value;
  }

  List<dynamic> _vacationList = [jsonDecode('{\"date\":30}')];
  List<dynamic> get vacationList => _vacationList;
  set vacationList(List<dynamic> value) {
    _vacationList = value;
  }

  void addToVacationList(dynamic value) {
    vacationList.add(value);
  }

  void removeFromVacationList(dynamic value) {
    vacationList.remove(value);
  }

  void removeAtIndexFromVacationList(int index) {
    vacationList.removeAt(index);
  }

  void updateVacationListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    vacationList[index] = updateFn(_vacationList[index]);
  }

  void insertAtIndexInVacationList(int index, dynamic value) {
    vacationList.insert(index, value);
  }

  List<String> _selectedDates = [];
  List<String> get selectedDates => _selectedDates;
  set selectedDates(List<String> value) {
    _selectedDates = value;
  }

  void addToSelectedDates(String value) {
    selectedDates.add(value);
  }

  void removeFromSelectedDates(String value) {
    selectedDates.remove(value);
  }

  void removeAtIndexFromSelectedDates(int index) {
    selectedDates.removeAt(index);
  }

  void updateSelectedDatesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedDates[index] = updateFn(_selectedDates[index]);
  }

  void insertAtIndexInSelectedDates(int index, String value) {
    selectedDates.insert(index, value);
  }

  bool _isTextFieldVisible = false;
  bool get isTextFieldVisible => _isTextFieldVisible;
  set isTextFieldVisible(bool value) {
    _isTextFieldVisible = value;
  }

  String _cartTotal = '';
  String get cartTotal => _cartTotal;
  set cartTotal(String value) {
    _cartTotal = value;
  }

  bool _isWalletSelected = false;
  bool get isWalletSelected => _isWalletSelected;
  set isWalletSelected(bool value) {
    _isWalletSelected = value;
  }

  String _inputAddress = '';
  String get inputAddress => _inputAddress;
  set inputAddress(String value) {
    _inputAddress = value;
  }

  String _pauseOrderReason = 'no need';
  String get pauseOrderReason => _pauseOrderReason;
  set pauseOrderReason(String value) {
    _pauseOrderReason = value;
  }

  String _isDailyCartTimeSlotSelected = '';
  String get isDailyCartTimeSlotSelected => _isDailyCartTimeSlotSelected;
  set isDailyCartTimeSlotSelected(String value) {
    _isDailyCartTimeSlotSelected = value;
  }

  DateTime? _dateTimeNull;
  DateTime? get dateTimeNull => _dateTimeNull;
  set dateTimeNull(DateTime? value) {
    _dateTimeNull = value;
  }

  String _cartAmount = '';
  String get cartAmount => _cartAmount;
  set cartAmount(String value) {
    _cartAmount = value;
  }

  String _selectedItemId = '';
  String get selectedItemId => _selectedItemId;
  set selectedItemId(String value) {
    _selectedItemId = value;
  }

  int _storeOrderId = 0;
  int get storeOrderId => _storeOrderId;
  set storeOrderId(int value) {
    _storeOrderId = value;
  }

  int _subscriptionId = 0;
  int get subscriptionId => _subscriptionId;
  set subscriptionId(int value) {
    _subscriptionId = value;
  }

  List<bool> _isSelectedVacationIndex = [];
  List<bool> get isSelectedVacationIndex => _isSelectedVacationIndex;
  set isSelectedVacationIndex(List<bool> value) {
    _isSelectedVacationIndex = value;
  }

  void addToIsSelectedVacationIndex(bool value) {
    isSelectedVacationIndex.add(value);
  }

  void removeFromIsSelectedVacationIndex(bool value) {
    isSelectedVacationIndex.remove(value);
  }

  void removeAtIndexFromIsSelectedVacationIndex(int index) {
    isSelectedVacationIndex.removeAt(index);
  }

  void updateIsSelectedVacationIndexAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    isSelectedVacationIndex[index] = updateFn(_isSelectedVacationIndex[index]);
  }

  void insertAtIndexInIsSelectedVacationIndex(int index, bool value) {
    isSelectedVacationIndex.insert(index, value);
  }

  bool _isSelectedVacation = false;
  bool get isSelectedVacation => _isSelectedVacation;
  set isSelectedVacation(bool value) {
    _isSelectedVacation = value;
  }

  bool _isCouponApplied = false;
  bool get isCouponApplied => _isCouponApplied;
  set isCouponApplied(bool value) {
    _isCouponApplied = value;
  }

  String _orderType = '';
  String get orderType => _orderType;
  set orderType(String value) {
    _orderType = value;
  }

  String _paymentMethod = '';
  String get paymentMethod => _paymentMethod;
  set paymentMethod(String value) {
    _paymentMethod = value;
  }

  String _selectedCouponID = '0';
  String get selectedCouponID => _selectedCouponID;
  set selectedCouponID(String value) {
    _selectedCouponID = value;
  }

  bool _isSubContainerSelected = false;
  bool get isSubContainerSelected => _isSubContainerSelected;
  set isSubContainerSelected(bool value) {
    _isSubContainerSelected = value;
  }

  String _couponType = '';
  String get couponType => _couponType;
  set couponType(String value) {
    _couponType = value;
  }

  bool _isSelectedSchedule = false;
  bool get isSelectedSchedule => _isSelectedSchedule;
  set isSelectedSchedule(bool value) {
    _isSelectedSchedule = value;
  }

  String _fcmToken = '';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
  }

  bool _isAddWalletSelected = false;
  bool get isAddWalletSelected => _isAddWalletSelected;
  set isAddWalletSelected(bool value) {
    _isAddWalletSelected = value;
  }

  String _selectedDeliveryDate = '';
  String get selectedDeliveryDate => _selectedDeliveryDate;
  set selectedDeliveryDate(String value) {
    _selectedDeliveryDate = value;
  }

  String _selectedDeliveryTimeSlot = '';
  String get selectedDeliveryTimeSlot => _selectedDeliveryTimeSlot;
  set selectedDeliveryTimeSlot(String value) {
    _selectedDeliveryTimeSlot = value;
  }

  bool _isPhoneSelected = false;
  bool get isPhoneSelected => _isPhoneSelected;
  set isPhoneSelected(bool value) {
    _isPhoneSelected = value;
  }

  bool _isEmailSelected = false;
  bool get isEmailSelected => _isEmailSelected;
  set isEmailSelected(bool value) {
    _isEmailSelected = value;
  }

  bool _isOtpSelected = false;
  bool get isOtpSelected => _isOtpSelected;
  set isOtpSelected(bool value) {
    _isOtpSelected = value;
  }

  String _userImage = '';
  String get userImage => _userImage;
  set userImage(String value) {
    _userImage = value;
  }

  String _isChangeType = '';
  String get isChangeType => _isChangeType;
  set isChangeType(String value) {
    _isChangeType = value;
  }

  String _profileImage = '';
  String get profileImage => _profileImage;
  set profileImage(String value) {
    _profileImage = value;
    secureStorage.setString('ff_profileImage', value);
  }

  void deleteProfileImage() {
    secureStorage.delete(key: 'ff_profileImage');
  }

  String _profileImageBytes =
      'https://media.istockphoto.com/id/1916685823/photo/businesswoman-using-laptop-with-banking-applications-via-internet-network.jpg?s=612x612&w=0&k=20&c=L9wQekG3TJ-6fSFlUCUelo5xOCYkm9SVE5ER5J8QiK0=';
  String get profileImageBytes => _profileImageBytes;
  set profileImageBytes(String value) {
    _profileImageBytes = value;
    secureStorage.setString('ff_profileImageBytes', value);
  }

  void deleteProfileImageBytes() {
    secureStorage.delete(key: 'ff_profileImageBytes');
  }

  String _brandID = '';
  String get brandID => _brandID;
  set brandID(String value) {
    _brandID = value;
  }

  double _cartSavingPrice = 0.0;
  double get cartSavingPrice => _cartSavingPrice;
  set cartSavingPrice(double value) {
    _cartSavingPrice = value;
  }

  String _referralCode = '';
  String get referralCode => _referralCode;
  set referralCode(String value) {
    _referralCode = value;
  }

  String _productName = '';
  String get productName => _productName;
  set productName(String value) {
    _productName = value;
  }

  String _selectedMapCountry = '';
  String get selectedMapCountry => _selectedMapCountry;
  set selectedMapCountry(String value) {
    _selectedMapCountry = value;
  }

  String _cartCount = '';
  String get cartCount => _cartCount;
  set cartCount(String value) {
    _cartCount = value;
  }

  String _groupID = '';
  String get groupID => _groupID;
  set groupID(String value) {
    _groupID = value;
  }

  String _subscriptionIdstr = '';
  String get subscriptionIdstr => _subscriptionIdstr;
  set subscriptionIdstr(String value) {
    _subscriptionIdstr = value;
  }

  String _countryflag = 'https://quickart.ae/adminDevnull';
  String get countryflag => _countryflag;
  set countryflag(String value) {
    _countryflag = value;
  }

  String _phonedummy = '';
  String get phonedummy => _phonedummy;
  set phonedummy(String value) {
    _phonedummy = value;
  }

  String _utmSource = '';
  String get utmSource => _utmSource;
  set utmSource(String value) {
    _utmSource = value;
  }

  String _utmCampaign = '';
  String get utmCampaign => _utmCampaign;
  set utmCampaign(String value) {
    _utmCampaign = value;
  }

  String _utmNetwork = '';
  String get utmNetwork => _utmNetwork;
  set utmNetwork(String value) {
    _utmNetwork = value;
  }

  String _utmMedium = '';
  String get utmMedium => _utmMedium;
  set utmMedium(String value) {
    _utmMedium = value;
  }

  String _utmKeyword = '';
  String get utmKeyword => _utmKeyword;
  set utmKeyword(String value) {
    _utmKeyword = value;
  }

  String _placement = '';
  String get placement => _placement;
  set placement(String value) {
    _placement = value;
  }

  String _SEOUrl = '';
  String get SEOUrl => _SEOUrl;
  set SEOUrl(String value) {
    _SEOUrl = value;
  }

  String _userPhoneEP = '';
  String get userPhoneEP => _userPhoneEP;
  set userPhoneEP(String value) {
    _userPhoneEP = value;
    secureStorage.setString('ff_userPhoneEP', value);
  }

  void deleteUserPhoneEP() {
    secureStorage.delete(key: 'ff_userPhoneEP');
  }

  String _userCountryCodeEP = '';
  String get userCountryCodeEP => _userCountryCodeEP;
  set userCountryCodeEP(String value) {
    _userCountryCodeEP = value;
    secureStorage.setString('ff_userCountryCodeEP', value);
  }

  void deleteUserCountryCodeEP() {
    secureStorage.delete(key: 'ff_userCountryCodeEP');
  }

  String _userPhoneProfile = '';
  String get userPhoneProfile => _userPhoneProfile;
  set userPhoneProfile(String value) {
    _userPhoneProfile = value;
    secureStorage.setString('ff_userPhoneProfile', value);
  }

  void deleteUserPhoneProfile() {
    secureStorage.delete(key: 'ff_userPhoneProfile');
  }

  bool _isPaymentSuccess = false;
  bool get isPaymentSuccess => _isPaymentSuccess;
  set isPaymentSuccess(bool value) {
    _isPaymentSuccess = value;
  }

  String _adminArea = '';
  String get adminArea => _adminArea;
  set adminArea(String value) {
    _adminArea = value;
  }

  bool _isEmiratesSelected = false;
  bool get isEmiratesSelected => _isEmiratesSelected;
  set isEmiratesSelected(bool value) {
    _isEmiratesSelected = value;
  }

  double _userWallet = 0.0;
  double get userWallet => _userWallet;
  set userWallet(double value) {
    _userWallet = value;
  }

  String _minRating = 'null';
  String get minRating => _minRating;
  set minRating(String value) {
    _minRating = value;
  }

  String _maxRating = 'null';
  String get maxRating => _maxRating;
  set maxRating(String value) {
    _maxRating = value;
  }

  bool _isSiNoSelected = false;
  bool get isSiNoSelected => _isSiNoSelected;
  set isSiNoSelected(bool value) {
    _isSiNoSelected = value;
  }

  bool _updateContainer = false;
  bool get updateContainer => _updateContainer;
  set updateContainer(bool value) {
    _updateContainer = value;
  }

  String _userWalletstr = '';
  String get userWalletstr => _userWalletstr;
  set userWalletstr(String value) {
    _userWalletstr = value;
  }

  bool _otpContainer = false;
  bool get otpContainer => _otpContainer;
  set otpContainer(bool value) {
    _otpContainer = value;
  }

  bool _backButtonOrder = false;
  bool get backButtonOrder => _backButtonOrder;
  set backButtonOrder(bool value) {
    _backButtonOrder = value;
  }

  String _usserType = '';
  String get usserType => _usserType;
  set usserType(String value) {
    _usserType = value;
    secureStorage.setString('ff_usserType', value);
  }

  void deleteUsserType() {
    secureStorage.delete(key: 'ff_usserType');
  }

  int _subCartTotalItem = 0;
  int get subCartTotalItem => _subCartTotalItem;
  set subCartTotalItem(int value) {
    _subCartTotalItem = value;
  }

  double _subCartTotalPrice = 0.0;
  double get subCartTotalPrice => _subCartTotalPrice;
  set subCartTotalPrice(double value) {
    _subCartTotalPrice = value;
  }

  double _subCartSavingAmount = 0.0;
  double get subCartSavingAmount => _subCartSavingAmount;
  set subCartSavingAmount(double value) {
    _subCartSavingAmount = value;
  }

  String _selectedAddress1 = '';
  String get selectedAddress1 => _selectedAddress1;
  set selectedAddress1(String value) {
    _selectedAddress1 = value;
  }

  String _selectedSINumber = 'null';
  String get selectedSINumber => _selectedSINumber;
  set selectedSINumber(String value) {
    _selectedSINumber = value;
  }

  String _selectedMapAddress = '';
  String get selectedMapAddress => _selectedMapAddress;
  set selectedMapAddress(String value) {
    _selectedMapAddress = value;
  }

  double _addressLatitude = 0.0;
  double get addressLatitude => _addressLatitude;
  set addressLatitude(double value) {
    _addressLatitude = value;
  }

  double _addressLongitude = 0.0;
  double get addressLongitude => _addressLongitude;
  set addressLongitude(double value) {
    _addressLongitude = value;
  }

  bool _cardBoolean = false;
  bool get cardBoolean => _cardBoolean;
  set cardBoolean(bool value) {
    _cardBoolean = value;
  }

  String _userDialCode = '';
  String get userDialCode => _userDialCode;
  set userDialCode(String value) {
    _userDialCode = value;
    secureStorage.setString('ff_userDialCode', value);
  }

  void deleteUserDialCode() {
    secureStorage.delete(key: 'ff_userDialCode');
  }

  String _cardScreenNavigation = '';
  String get cardScreenNavigation => _cardScreenNavigation;
  set cardScreenNavigation(String value) {
    _cardScreenNavigation = value;
  }

  String _cartNavigation = '';
  String get cartNavigation => _cartNavigation;
  set cartNavigation(String value) {
    _cartNavigation = value;
  }

  String _cardnodemo = '';
  String get cardnodemo => _cardnodemo;
  set cardnodemo(String value) {
    _cardnodemo = value;
  }

  String _dashboardBanner = '';
  String get dashboardBanner => _dashboardBanner;
  set dashboardBanner(String value) {
    _dashboardBanner = value;
  }

  String _pOrderId = '';
  String get pOrderId => _pOrderId;
  set pOrderId(String value) {
    _pOrderId = value;
  }

  String _pPaymentid = '';
  String get pPaymentid => _pPaymentid;
  set pPaymentid(String value) {
    _pPaymentid = value;
  }

  String _pTransid = '';
  String get pTransid => _pTransid;
  set pTransid(String value) {
    _pTransid = value;
  }

  String _pHash = '';
  String get pHash => _pHash;
  set pHash(String value) {
    _pHash = value;
  }

  bool _searchLoader = false;
  bool get searchLoader => _searchLoader;
  set searchLoader(bool value) {
    _searchLoader = value;
  }

  bool _subCartVisibility = false;
  bool get subCartVisibility => _subCartVisibility;
  set subCartVisibility(bool value) {
    _subCartVisibility = value;
  }

  String _selectedPayMethod = 'Pay Now';
  String get selectedPayMethod => _selectedPayMethod;
  set selectedPayMethod(String value) {
    _selectedPayMethod = value;
  }

  String _productMsg = 'No Product Available';
  String get productMsg => _productMsg;
  set productMsg(String value) {
    _productMsg = value;
  }

  dynamic _profileInfo;
  dynamic get profileInfo => _profileInfo;
  set profileInfo(dynamic value) {
    _profileInfo = value;
  }

  String _isPageLoad = 'false';
  String get isPageLoad => _isPageLoad;
  set isPageLoad(String value) {
    _isPageLoad = value;
  }

  String _RatingScreenName = '';
  String get RatingScreenName => _RatingScreenName;
  set RatingScreenName(String value) {
    _RatingScreenName = value;
  }

  String _blankString = '';
  String get blankString => _blankString;
  set blankString(String value) {
    _blankString = value;
  }

  String _userGUUID = '';
  String get userGUUID => _userGUUID;
  set userGUUID(String value) {
    _userGUUID = value;
    secureStorage.setString('ff_userGUUID', value);
  }

  void deleteUserGUUID() {
    secureStorage.delete(key: 'ff_userGUUID');
  }

  String _trialId = '';
  String get trialId => _trialId;
  set trialId(String value) {
    _trialId = value;
  }

  String _trialPackBannerImage = '';
  String get trialPackBannerImage => _trialPackBannerImage;
  set trialPackBannerImage(String value) {
    _trialPackBannerImage = value;
  }

  int _isGridUpdated = 0;
  int get isGridUpdated => _isGridUpdated;
  set isGridUpdated(int value) {
    _isGridUpdated = value;
  }

  bool _isTrialPackVisible = true;
  bool get isTrialPackVisible => _isTrialPackVisible;
  set isTrialPackVisible(bool value) {
    _isTrialPackVisible = value;
  }

  String _zeroString = '0';
  String get zeroString => _zeroString;
  set zeroString(String value) {
    _zeroString = value;
  }

  String _searchScreenNaviagtion = '';
  String get searchScreenNaviagtion => _searchScreenNaviagtion;
  set searchScreenNaviagtion(String value) {
    _searchScreenNaviagtion = value;
  }

  String _couponsScreen = 'profile';
  String get couponsScreen => _couponsScreen;
  set couponsScreen(String value) {
    _couponsScreen = value;
  }

  String _pdfURL = '';
  String get pdfURL => _pdfURL;
  set pdfURL(String value) {
    _pdfURL = value;
  }

  String _selectedCartId = '';
  String get selectedCartId => _selectedCartId;
  set selectedCartId(String value) {
    _selectedCartId = value;
  }

  String _socityName = '';
  String get socityName => _socityName;
  set socityName(String value) {
    _socityName = value;
  }

  bool _isPopUpShow = true;
  bool get isPopUpShow => _isPopUpShow;
  set isPopUpShow(bool value) {
    _isPopUpShow = value;
  }

  dynamic _addressCart;
  dynamic get addressCart => _addressCart;
  set addressCart(dynamic value) {
    _addressCart = value;
  }

  String _doorImageAddress = '';
  String get doorImageAddress => _doorImageAddress;
  set doorImageAddress(String value) {
    _doorImageAddress = value;
  }

  bool _isDoorImageSelected = false;
  bool get isDoorImageSelected => _isDoorImageSelected;
  set isDoorImageSelected(bool value) {
    _isDoorImageSelected = value;
  }

  dynamic _selectedDoorImage;
  dynamic get selectedDoorImage => _selectedDoorImage;
  set selectedDoorImage(dynamic value) {
    _selectedDoorImage = value;
  }

  String _trialPackCategoryName = '';
  String get trialPackCategoryName => _trialPackCategoryName;
  set trialPackCategoryName(String value) {
    _trialPackCategoryName = value;
  }

  dynamic _selectedAddressJson;
  dynamic get selectedAddressJson => _selectedAddressJson;
  set selectedAddressJson(dynamic value) {
    _selectedAddressJson = value;
  }

  String _orderDate = '';
  String get orderDate => _orderDate;
  set orderDate(String value) {
    _orderDate = value;
  }

  String _orderValue = '';
  String get orderValue => _orderValue;
  set orderValue(String value) {
    _orderValue = value;
  }

  String _emptyString = '';
  String get emptyString => _emptyString;
  set emptyString(String value) {
    _emptyString = value;
  }

  bool _refreshTrigger = false;
  bool get refreshTrigger => _refreshTrigger;
  set refreshTrigger(bool value) {
    _refreshTrigger = value;
  }

  String _deliveryPartnerInstructionBell = '';
  String get deliveryPartnerInstructionBell => _deliveryPartnerInstructionBell;
  set deliveryPartnerInstructionBell(String value) {
    _deliveryPartnerInstructionBell = value;
  }

  String _deliveryPartnerInstructionDoor = '';
  String get deliveryPartnerInstructionDoor => _deliveryPartnerInstructionDoor;
  set deliveryPartnerInstructionDoor(String value) {
    _deliveryPartnerInstructionDoor = value;
  }

  String _deliveryPatnerInstructionA = '';
  String get deliveryPatnerInstructionA => _deliveryPatnerInstructionA;
  set deliveryPatnerInstructionA(String value) {
    _deliveryPatnerInstructionA = value;
  }

  dynamic _emptyJson;
  dynamic get emptyJson => _emptyJson;
  set emptyJson(dynamic value) {
    _emptyJson = value;
  }

  String _afQty = '';
  String get afQty => _afQty;
  set afQty(String value) {
    _afQty = value;
  }

  String _afPrice = '';
  String get afPrice => _afPrice;
  set afPrice(String value) {
    _afPrice = value;
  }

  String _afProductName = '';
  String get afProductName => _afProductName;
  set afProductName(String value) {
    _afProductName = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
