import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Quickart Group Code

class QuickartGroup {
  
  // static String getBaseUrl() => 'https://supaapioriginal-production.up.railway.app/testnodejsapp/';

 //Demo server
    static String getBaseUrl() => 'https://demoapi.quickart.ae/testnodejsapp/';
//Live server
    //  static String getBaseUrl() => 'https://api.quickart.ae/testnodejsapp/';
  
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
  static VerifyOTPCall verifyOTPCall = VerifyOTPCall();
  static RegisterDetailCall registerDetailCall = RegisterDetailCall();
  static OneAPICall oneAPICall = OneAPICall();
  static CateeCall cateeCall = CateeCall();
  static MyOrdersCall myOrdersCall = MyOrdersCall();
  static ResendOTPCall resendOTPCall = ResendOTPCall();
  static ProductDetailCall productDetailCall = ProductDetailCall();
  static OrderDetailAPICall orderDetailAPICall = OrderDetailAPICall();
  static AddremwishlistCall addremwishlistCall = AddremwishlistCall();
  static TopsellingCall topsellingCall = TopsellingCall();
  static RecentsellingCall recentsellingCall = RecentsellingCall();
  static AdditionalCatSearchCall additionalCatSearchCall =
      AdditionalCatSearchCall();
  static BrandlistCall brandlistCall = BrandlistCall();
  static ShowwishlistCall showwishlistCall = ShowwishlistCall();
  static TermsConditionCall termsConditionCall = TermsConditionCall();
  static UserdeactivateCall userdeactivateCall = UserdeactivateCall();
  static SearchbystoreproductCall searchbystoreproductCall =
      SearchbystoreproductCall();
  static RecentsearchCall recentsearchCall = RecentsearchCall();
  static TrensearchproductsCall trensearchproductsCall =
      TrensearchproductsCall();
  static SubcateeCall subcateeCall = SubcateeCall();
  static RepeatordersCall repeatordersCall = RepeatordersCall();
  static AppinfoCall appinfoCall = AppinfoCall();
  static AddToCartCall addToCartCall = AddToCartCall();
  static CatproductCall catproductCall = CatproductCall();
  static ShowaddressCall showaddressCall = ShowaddressCall();
  static RemoveaddressCall removeaddressCall = RemoveaddressCall();
  static AddaddressCall addaddressCall = AddaddressCall();
  static MyorderssubscriptionCall myorderssubscriptionCall =
      MyorderssubscriptionCall();
  static EditaddressCall editaddressCall = EditaddressCall();
  static ShowcartCall showcartCall = ShowcartCall();
  static MyOrdersSubCall myOrdersSubCall = MyOrdersSubCall();
  static SearchByBannerCall searchByBannerCall = SearchByBannerCall();
  static TotaldeliveriesCall totaldeliveriesCall = TotaldeliveriesCall();
  static TimeslotCall timeslotCall = TimeslotCall();
  static SneakyproductlistCall sneakyproductlistCall = SneakyproductlistCall();
  static CancelOrderCall cancelOrderCall = CancelOrderCall();
  static PlacerepeatedorderCall placerepeatedorderCall =
      PlacerepeatedorderCall();
  static UserbankdetailsCall userbankdetailsCall = UserbankdetailsCall();
  static NotificationlistCall notificationlistCall = NotificationlistCall();
  static CancelorderreasonCall cancelorderreasonCall = CancelorderreasonCall();
  static CancelledproductorderCall cancelledproductorderCall =
      CancelledproductorderCall();
  static AddtosubcartCall addtosubcartCall = AddtosubcartCall();
  static ShowsubcartCall showsubcartCall = ShowsubcartCall();
  static CouponListCall couponListCall = CouponListCall();
  static ApplyCouponCall applyCouponCall = ApplyCouponCall();
  static SubscriptionOrderPauseCall subscriptionOrderPauseCall =
      SubscriptionOrderPauseCall();
  static DailyCartTimeSlotCall dailyCartTimeSlotCall = DailyCartTimeSlotCall();
  static MydailyordersCall mydailyordersCall = MydailyordersCall();
  static CancelledquickorderCall cancelledquickorderCall =
      CancelledquickorderCall();
  static CheckoutsubcribtionorderCall checkoutsubcribtionorderCall =
      CheckoutsubcribtionorderCall();
  static CheckoutquickorderCall checkoutquickorderCall =
      CheckoutquickorderCall();
  static EditProfileCall editProfileCall = EditProfileCall();
  static ResumeOrderCall resumeOrderCall = ResumeOrderCall();
  static SendOTPCall sendOTPCall = SendOTPCall();
  static VerifyOTPUpdateCall verifyOTPUpdateCall = VerifyOTPUpdateCall();
  static SubscriptionOrderResumeCall subscriptionOrderResumeCall =
      SubscriptionOrderResumeCall();
  static SubscriptionresumetimeslotCall subscriptionresumetimeslotCall =
      SubscriptionresumetimeslotCall();
  static PaymentCall paymentCall = PaymentCall();
  static CancelledquickorderprodCall cancelledquickorderprodCall =
      CancelledquickorderprodCall();
  static SeosourceCall seosourceCall = SeosourceCall();
  static OrdercardchangesCall ordercardchangesCall = OrdercardchangesCall();
  static SubpaymentCall subpaymentCall = SubpaymentCall();
  static GuestloginCall guestloginCall = GuestloginCall();
  static SavecardCall savecardCall = SavecardCall();
  static DeleteCardCall deleteCardCall = DeleteCardCall();
  static UpdateproductdetailsCall updateproductdetailsCall =
      UpdateproductdetailsCall();
  static FaqslistCall faqslistCall = FaqslistCall();
  static QuickplacerepeatedorderCall quickplacerepeatedorderCall =
      QuickplacerepeatedorderCall();
  static OrderssubscriptionproductCall orderssubscriptionproductCall =
      OrderssubscriptionproductCall();
  static SearchbybrandsCall searchbybrandsCall = SearchbybrandsCall();
  static ProfileDetailsCall profileDetailsCall = ProfileDetailsCall();
  static AddnotifymeCall addnotifymeCall = AddnotifymeCall();
  static ShownotifymeCall shownotifymeCall = ShownotifymeCall();
  static DeletenotifymeCall deletenotifymeCall = DeletenotifymeCall();
  static VerifydetailsCall verifydetailsCall = VerifydetailsCall();
  static ReviewondeliveryCall reviewondeliveryCall = ReviewondeliveryCall();
  static AddproductratingCall addproductratingCall = AddproductratingCall();
  static ShowspcatcartCall showspcatcartCall = ShowspcatcartCall();
  static MyorderssubscriptionlistCall myorderssubscriptionlistCall =
      MyorderssubscriptionlistCall();
  static UpquickordertimeslotCall upquickordertimeslotCall =
      UpquickordertimeslotCall();
  static ProductreviewlistCall productreviewlistCall = ProductreviewlistCall();
  static OccasionalcatsearchCall occasionalcatsearchCall =
      OccasionalcatsearchCall();
  static TrialproductlistCall trialproductlistCall = TrialproductlistCall();
  static TrialPackDetailsCall trialPackDetailsCall = TrialPackDetailsCall();
  static SearchbybannerpageCall searchbybannerpageCall =
      SearchbybannerpageCall();
  static AddtrailpackCall addtrailpackCall = AddtrailpackCall();
  static ShowtrailpackCall showtrailpackCall = ShowtrailpackCall();
  static CheckouttrailpackCall checkouttrailpackCall = CheckouttrailpackCall();
  static TrailpaymentCall trailpaymentCall = TrailpaymentCall();
  static FeaturedCategoryCall featuredCategoryCall = FeaturedCategoryCall();
  static MightHaveMissedCall mightHaveMissedCall = MightHaveMissedCall();
  static UserOrderListCall userOrderListCall = UserOrderListCall();
  static SubscriptionMergedCall subscriptionMergedCall =
      SubscriptionMergedCall();
  static AutoRenewalCall autoRenewalCall = AutoRenewalCall();
  static UploadDoorimageCall uploadDoorimageCall = UploadDoorimageCall();
  static TrendingrecentsearchCall trendingrecentsearchCall =
      TrendingrecentsearchCall();
  static GenerateinvoiceCall generateinvoiceCall = GenerateinvoiceCall();
  static SearchbypopupbannerCall searchbypopupbannerCall =
      SearchbypopupbannerCall();
  static FeaturecategoryCall featurecategoryCall = FeaturecategoryCall();
  static UpdatecartCall updatecartCall = UpdatecartCall();
  static UpdatessubcartCall updatessubcartCall = UpdatessubcartCall();
  static SpentbywalletCall spentbywalletCall = SpentbywalletCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? userPhone = '',
    String? countryCode = '',
    bool? isWhatappMsgUnable,
    bool? isTermsCondUnable,
    String? dialCode = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_phone": "${userPhone}",
  "country_code": "${countryCode}",
  "is_whatapp_msg_unable": ${isWhatappMsgUnable},
  "is_terms_cond_unable": ${isTermsCondUnable},
  "dial_code": "${dialCode}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${baseUrl}api/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic? userData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class VerifyOTPCall {
  Future<ApiCallResponse> call({
    String? phoneNo = '',
    String? otp = '',
    String? deviceID = '',
    String? countryCode = '',
    String? email = '',
    String? name = '',
    String? referralCode = '',
    String? uuid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_phone": "${phoneNo}",
  "country_code": "${countryCode}",
  "otp": "${otp}",
  "user_email": "${email}",
  "name": "${name}",
  "referral_code": "${referralCode}",
  "is_terms_cond_unable": true,
  "actual_device_id": "${deviceID}",
  "is_whatapp_msg_unable": "1",
  "uuid": "${uuid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify OTP',
      apiUrl: '${baseUrl}api/verify_otp',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic? otherDate(dynamic response) => getJsonField(
        response,
        r'''$.otherdata''',
      );
  String? appUUID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.otherdata.appuuid''',
      ));
}

class RegisterDetailCall {
  Future<ApiCallResponse> call({
    String? countryCode = '',
    String? phoneNo = '',
    String? name = '',
    String? email = '',
    String? referralCode = '',
    bool? termsandcondion,
    String? dialCode = '',
    bool? whatsApp,
    String? deviceid = '',
    String? fcmToken = '',
    String? uuid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_phone": "${phoneNo}",
  "country_code": "${countryCode}",
  "user_email": "${email}",
  "name": "${name}",
  "referral_code": "${referralCode}",
  "is_terms_cond_unable": ${termsandcondion},
  "is_whatapp_msg_unable": ${whatsApp},
  "dial_code": "${dialCode}",
  "actual_device_id": "${deviceid}",
  "device_id": "${fcmToken}",
  "uuid": "${uuid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register Detail',
      apiUrl: '${baseUrl}api/register_details',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic? registerData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class OneAPICall {
  Future<ApiCallResponse> call({
    String? storeID = '',
    String? userID = '',
    String? deviceID = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "user_id": "${userID}",
  "is_subscription": 1,
  "device_id": "${deviceID}",
  "platform": "${platform}"
}''';
print("G1---oneapi--> store_id: ${storeID}, user_id: ${userID}, is_subscription: 1, device_id: ${deviceID}, platform: ${platform} ");
print("G1---one api-->${baseUrl}api/oneapi");

    return ApiManager.instance.makeApiCall(
      callName: 'oneAPI',
      apiUrl: '${baseUrl}api/oneapi',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? firstBanner(dynamic response) => getJsonField(
        response,
        r'''$.banner''',
        true,
      ) as List?;
  List? secondBanner(dynamic response) => getJsonField(
        response,
        r'''$.second_banner''',
        true,
      ) as List?;
  List? topCat(dynamic response) => getJsonField(
        response,
        r'''$.top_cat''',
        true,
      ) as List?;
  List? whatsNew(dynamic response) => getJsonField(
        response,
        r'''$.whatsnew''',
        true,
      ) as List?;
  List? dealProduct(dynamic response) => getJsonField(
        response,
        r'''$.dealproduct''',
        true,
      ) as List?;
  List? recentSelling(dynamic response) => getJsonField(
        response,
        r'''$.recentselling''',
        true,
      ) as List?;
  List? topSelling(dynamic response) => getJsonField(
        response,
        r'''$.topselling''',
        true,
      ) as List?;
  List? addCategory(dynamic response) => getJsonField(
        response,
        r'''$.additional_category''',
        true,
      ) as List?;
  List? orderAgain(dynamic response) => getJsonField(
        response,
        r'''$.orderlist''',
        true,
      ) as List?;
  List? band(dynamic response) => getJsonField(
        response,
        r'''$.brand''',
        true,
      ) as List?;
  String? bgImage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.oneapi_bg_first_image''',
      ));
  List? specialBanncder(dynamic response) => getJsonField(
        response,
        r'''$.special_offer_banner''',
        true,
      ) as List?;
  dynamic? sneakyBanner(dynamic response) => getJsonField(
        response,
        r'''$.sneaky_banner''',
      );
  List? occasionalCat(dynamic response) => getJsonField(
        response,
        r'''$.occasionalCategory''',
        true,
      ) as List?;
}

class CateeCall {
  Future<ApiCallResponse> call({
    String? storeID = '',
    String? latest = '',
    String? byname = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "byname": "${latest}",
  "latest": "${byname}",
   "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Catee',
      apiUrl: '${baseUrl}api/catee',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List? subcatList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].subcategory''',
        true,
      ) as List?;
}

class MyOrdersCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userID}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'myOrders',
      apiUrl: '${baseUrl}api/my_orders',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? myOrdersData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ResendOTPCall {
  Future<ApiCallResponse> call({
    String? countryCode = '',
    String? phonoNo = '',
    String? otpType = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_phone": "${phonoNo}",
  "country_code": "${countryCode}",
  "isotptype": "${otpType}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resendOTP',
      apiUrl: '${baseUrl}api/resend_otp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ProductDetailCall {
  Future<ApiCallResponse> call({
    String? storeID = '',
    String? userID = '',
    String? productID = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userID}",
  "product_id": "${productID}",
  "store_id": "7",
  "is_subscription": 1,
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProductDetail',
      apiUrl: '${baseUrl}api/product_det',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic? productDetailData(dynamic response) => getJsonField(
        response,
        r'''$.detail''',
      );
  List? similarProduct(dynamic response) => getJsonField(
        response,
        r'''$.similar_product''',
        true,
      ) as List?;
  String? productName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail.product_name''',
      ));
  List? imageList(dynamic response) => getJsonField(
        response,
        r'''$.detail.images''',
        true,
      ) as List?;
  int? productId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.detail.product_id''',
      ));
}

class OrderDetailAPICall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? groupid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userID}",
  "group_id": "${groupid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OrderDetailAPI',
      apiUrl: '${baseUrl}api/orders_details',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic? orderData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  List? itemList(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      ) as List?;
}

class AddremwishlistCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeID = '',
    String? varientID = '',
    String? deviceid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "store_id": "7",
  "varient_id": "${varientID}",
  "device_id": "${deviceid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addremwishlist',
      apiUrl: '${baseUrl}api/add_rem_wishlist',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class TopsellingCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeid = '',
    String? byname = '',
    String? minPrice = '',
    String? maxPrice = '',
    String? stock = '',
    String? minDiscount = '',
    String? maxDiscount = '',
    String? sort = '',
    String? sortName = '',
    String? sortPrice = '',
    String? catId = '',
    String? subCatId = '',
    int? page,
    int? perpage,
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "user_id": "${userid}",
  "byname": "${byname}",
  "min_price": "${minPrice}",
  "max_price": "${maxPrice}",
  "stock": "${stock}",
  "min_discount": "${minDiscount}",
  "max_discount": "${maxDiscount}",
  "sort": "${sort}",
  "sortname": "${sortName}",
  "sortprice": "${sortPrice}",
  "cat_id": "${catId}",
  "sub_cat_id": "${subCatId}",
  "page": ${page},
  "perpage": ${perpage},
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'topselling',
      apiUrl: '${baseUrl}api/top_selling',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class RecentsellingCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeid = '',
    String? byname = '',
    String? minPrice = '',
    String? maxPrice = '',
    String? stock = '',
    String? minDiscount = '',
    String? maxDiscount = '',
    String? sort = '',
    String? sortName = '',
    String? sortPrice = '',
    String? catId = '',
    String? subCatId = '',
    int? page,
    int? pageper,
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "user_id": "${userid}",
  "byname": "${byname}",
  "min_price": "${minPrice}",
  "max_price": "${maxPrice}",
  "stock": "${stock}",
  "min_discount": "${minDiscount}",
  "max_discount": "${maxDiscount}",
  "sort": "${sort}",
  "sortname": "${sortName}",
  "sortprice": "${sortPrice}",
  "cat_id": "${catId}",
  "sub_cat_id": "${subCatId}",
  "page": ${page},
  "perpage": ${pageper},
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'recentselling',
      apiUrl: '${baseUrl}api/recentselling',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AdditionalCatSearchCall {
  Future<ApiCallResponse> call({
    String? storeid = '',
    String? userid = '',
    String? byName = '',
    String? minPrice = '',
    String? maxPrice = '',
    String? stock = '',
    String? minDiscount = '',
    String? maxDiscount = '',
    String? sort = '',
    String? sortName = '',
    String? sortPrice = '',
    String? catId = '',
    String? subCatId = '',
    int? page,
    int? perpage,
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "user_id": "${userid}",
  "byname": "${byName}",
  "min_price": "${minPrice}",
  "max_price": "${maxPrice}",
  "stock": "${stock}",
  "min_discount": "${minDiscount}",
  "max_discount": "${maxDiscount}",
  "sort": "${sort}",
  "sortname": "${sortName}",
  "sortprice": "${sortPrice}",
  "cat_id": "${catId}",
  "sub_cat_id": "${subCatId}",
  "page": ${page},
  "perpage": ${perpage},
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'additionalCatSearch',
      apiUrl: '${baseUrl}api/additionalcat_search',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class BrandlistCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QuickartGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'brandlist',
      apiUrl: '${baseUrl}api/brand_list',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ShowwishlistCall {
  Future<ApiCallResponse> call({
    String? storeid = '',
    String? userid = '',
    String? byname = '',
    String? minPrice = '',
    String? maxPrice = '',
    String? stock = '',
    String? minDiscount = '',
    String? maxDiscount = '',
    String? deviceid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "user_id": "${userid}",
  "byname": "${byname}",
  "min_price": "${minPrice}",
  "max_price": "${maxPrice}",
  "stock": "${stock}",
  "min_discount": "${minDiscount}",
  "max_discount": "${maxDiscount}",
  "is_subscription": 1,
  "device_id" : "${deviceid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'showwishlist',
      apiUrl: '${baseUrl}api/show_wishlist',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class TermsConditionCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QuickartGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Terms  Condition',
      apiUrl: '${baseUrl}api/appterms',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.description''',
      ));
}

class UserdeactivateCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "deactivate_by": "Cuatomer",
  "activate_deactivate_status": "deactivate",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'userdeactivate',
      apiUrl: '${baseUrl}api/user_deactivate',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SearchbystoreproductCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeid = '',
    String? keyword = '',
    String? minPrice = '',
    String? maxPrice = '',
    String? byName = '',
    String? stock = '',
    String? minDiscount = '',
    String? maxDiscount = '',
    String? sort = '',
    String? sortPrice = '',
    String? sortName = '',
    String? subCatId = '',
    String? catId = '',
    String? deviceid = '',
    String? minRating = '',
    String? maxRating = '',
    int? perpage,
    int? page,
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "store_id": "7",
  "keyword": "${keyword}",
  "byname": "${byName}",
  "min_price": "${minPrice}",
  "max_price": "${maxPrice}",
  "stock": "${stock}",
  "min_discount": "${minDiscount}",
  "max_discount": "${maxDiscount}",
  "sort": "${sort}",
  "sortname": "${sortName}",
  "sortprice": "${sortPrice}",
  "cat_id": "${catId}",
  "sub_cat_id": "${subCatId}",
  "device_id": "${deviceid}",
  "min_rating": "${minRating}",
  "max_rating": "${maxRating}",
  "perpage": ${perpage},
  "page": ${page},
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'searchbystoreproduct',
      // apiUrl: '${baseUrl}api/searchbystoreproduct',
      apiUrl: 'https://ckxrmeapgvkllpxjgheg.supabase.co/functions/v1/product-search',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class RecentsearchCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'recentsearch',
      apiUrl: '${baseUrl}api/recent_search',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class TrensearchproductsCall {
  Future<ApiCallResponse> call({
    String? storeID = '',
    String? userid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "user_id":"${userid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'trensearchproducts',
      apiUrl: '${baseUrl}api/trensearchproducts',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class SubcateeCall {
  Future<ApiCallResponse> call({
    String? storeid = '',
    String? catid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "cat_id": "${catid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'subcatee',
      apiUrl: '${baseUrl}api/subcatee',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List? productDetail(dynamic response) => getJsonField(
        response,
        r'''$.data[:].product_details''',
        true,
      ) as List?;
  List<int>? catId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cat_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class RepeatordersCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeid = '',
    String? deviceID = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "store_id": "7",
  "device_id": "${deviceID}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'repeatorders',
      apiUrl: '${baseUrl}api/repeat_orders',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AppinfoCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? stroreid = '',
    String? platform = '',
    String? fcmToken = '',
    String? deviceid = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "platform": "${platform}",
  "app_name": "customer",
  "device_id": "${fcmToken}",
  "actual_device_id": "${deviceid}",
  "store_id": "7"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'appinfo',
      apiUrl: '${baseUrl}api/app_info',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  int? discount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.discountonmrp''',
      ));
  int? totalPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.total_price''',
      ));
}

class AddToCartCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? qty = '',
    String? storeid = '',
    String? varientid = '',
    String? deviceid = '',
    String? itemPrice = '',
    String? itemName = '',
    String? platform = '',
    String? featuresID = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "qty": "${qty}",
  "store_id": "7",
  "varient_id": "${varientid}",
  "device_id": "${deviceid}",
  "platform": "${platform}",
  "product_feature_id": "${featuresID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add to Cart',
      apiUrl: '${baseUrl}api/add_to_cart',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  int? totalItems(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.total_items''',
      ));
  double? savingPrice(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.saving_price''',
      ));
  double? totalPrice(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.total_price''',
      ));
}

class CatproductCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeid = '',
    String? catid = '',
    String? byName = '',
    String? minPrice = '',
    String? maxPrice = '',
    String? stock = '',
    String? minDiscount = '',
    String? maxDiscount = '',
    String? sort = '',
    String? sortName = '',
    String? sortPrice = '',
    String? subCatID = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "cat_id": "${catid}",
  "user_id": "${userid}",
  "byname": "${byName}",
  "min_price": "${minPrice}",
  "max_price": "${maxPrice}",
  "stock": "${stock}",
  "min_discount": "${minDiscount}",
  "max_discount": "${maxDiscount}",
  "sort": "${sort}",
  "sortname": "${sortName}",
  "sortprice": "${sortPrice}",
  "sub_cat_id": "${subCatID}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'catproduct',
      apiUrl: '${baseUrl}api/cat_product',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ShowaddressCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeid = '',
    String? deviceId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "store_id": "7",
  "device_id": "${deviceId}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'showaddress',
      apiUrl: '${baseUrl}api/show_address',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List? latLng(dynamic response) => getJsonField(
        response,
        r'''$.data[:].latlng''',
        true,
      ) as List?;
}

class RemoveaddressCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? addressID = '',
    String? deviceId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "address_id": "${addressID}",
  "device_id": "${deviceId}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removeaddress',
      apiUrl: '${baseUrl}api/remove_address',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class AddaddressCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? type = '',
    String? rName = '',
    String? rPhone = '',
    String? rCountryCode = '',
    String? rEmail = '',
    String? houseNo = '',
    String? landmark = '',
    double? lat,
    double? long,
    String? dialCode = '',
    String? deviceId = '',
    FFUploadedFile? image,
    String? societyName = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'addaddress',
      apiUrl: '${baseUrl}api/add_address',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'user_id': userid,
        'type': type,
        'receiver_name': rName,
        'receiver_phone': rPhone,
        'receiver_phone_code': rCountryCode,
        'receiver_email': rEmail,
        'house_no': houseNo,
        'landmark': landmark,
        'lat': lat,
        'lng': long,
        'society_name': societyName,
        'dial_code': dialCode,
        'device_id': deviceId,
        'image': image,
        'platfomr': platform,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class MyorderssubscriptionCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeId = '',
    int? page,
    int? pageCount,
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "user_id": "${userid}",
  "page": ${page},
  "perpage": ${pageCount},
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'myorderssubscription',
      apiUrl: '${baseUrl}api/my_orders_subscription',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class EditaddressCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? addressID = '',
    String? type = '',
    String? rName = '',
    String? rPhone = '',
    String? rCountryCode = '',
    String? rEmail = '',
    String? houseno = '',
    double? lat,
    double? long,
    String? landmark = '',
    String? dialCode = '',
    FFUploadedFile? img,
    String? societyName = '',
    String? deviceId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'editaddress',
      apiUrl: '${baseUrl}api/edit_address',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'address_id': addressID,
        'user_id': userid,
        'type': type,
        'receiver_name': rName,
        'receiver_phone': rPhone,
        'receiver_email': rEmail,
        'rCountryCode': rCountryCode,
        'society_name': societyName,
        'house_no': houseno,
        'landmark': landmark,
        'lat': lat,
        'lng': long,
        'dial_code': dialCode,
        'device_id': deviceId,
        'image': img,
        'platfomr': platform,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ShowcartCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? deviceid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "device_id": "${deviceid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'showcart',
      apiUrl: '${baseUrl}api/show_cart',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  List? cartData(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      ) as List?;
  List? lastAddress(dynamic response) => getJsonField(
        response,
        r'''$.data.lastadd''',
        true,
      ) as List?;
  String? totalPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.total_price''',
      ));
  dynamic? lastCardDetails(dynamic response) => getJsonField(
        response,
        r'''$.data.lastcarddetails''',
      );
}

class MyOrdersSubCall {
  Future<ApiCallResponse> call({
    String? cartId = '',
    String? orderStatusID = '',
    String? subscriptionId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cart_id": "${cartId}",
  "store_order_id": "${orderStatusID}",
  "subscription_id": "${subscriptionId}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'myOrdersSub',
      apiUrl: '${baseUrl}api/my_orders_sub',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  List? productData(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      ) as List?;
  List? subscriptionDetail(dynamic response) => getJsonField(
        response,
        r'''$.data.subscription_details''',
        true,
      ) as List?;
  List<int>? subscriptionId(dynamic response) => (getJsonField(
        response,
        r'''$.data.subscription_details[:].subscription_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class SearchByBannerCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? storeId = '',
    String? keyword = '',
    String? byName = '',
    String? minPrice = '',
    String? maxPrice = '',
    String? stock = '',
    String? minDiscount = '',
    String? maxDiscount = '',
    String? sort = '',
    String? sortName = '',
    String? sortPrice = '',
    String? catid = '',
    String? subCatid = '',
    String? deviceid = '',
    String? brandID = '',
    String? bannerID = '',
    int? page,
    int? pageper,
    String? bannerType = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "store_id": "7",
  "keyword": "${keyword} ",
  "byname": "${byName}",
  "min_price": "${minPrice}",
  "max_price": "${maxPrice}",
  "stock": "${stock}",
  "min_discount": "${minDiscount}",
  "max_discount": "${maxDiscount}",
  "sort": "${sort}",
  "sortname": "${sortName}",
  "sortprice": "${sortPrice}",
  "cat_id": "${catid}",
  "sub_cat_id": "${subCatid}",
  "device_id": "${deviceid}",
  "brand_id": "${brandID}",
  "banner_id": "${bannerID}",
  "banner_type":"${bannerType}",
  "perpage": ${pageper},
  "page": ${page},
  "platform": "${platform}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'searchByBanner',
      apiUrl: '${baseUrl}api/searchbybanner',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class TotaldeliveriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QuickartGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'totaldeliveries',
      apiUrl: '${baseUrl}api/total_deliveries',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class TimeslotCall {
  Future<ApiCallResponse> call({
    String? storeID = '',
    String? selectedDate = '',
    String? repeatedDays = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "selected_date": "${selectedDate}",
  "repeated_days": "${repeatedDays}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'timeslot',
      apiUrl: '${baseUrl}api/timeslot',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? firstDeliveryDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.deliveryDate''',
      ));
}

class SneakyproductlistCall {
  Future<ApiCallResponse> call({
    String? storeid = '',
    double? lat,
    double? long,
    String? deviceid = '',
    String? userid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "userLat": "${lat}",
  "userLng": "${long}",
  "store_id": "7",
  "device_id": "${deviceid}",
  "user_id": "${userid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sneakyproductlist',
      apiUrl: '${baseUrl}api/sneaky_productlist',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class CancelOrderCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": ${userId},
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cancelOrder',
      apiUrl: '${baseUrl}/api/can_orders',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PlacerepeatedorderCall {
  Future<ApiCallResponse> call({
    String? cartid = '',
    String? userid = '',
    String? replaceStatus = '',
    String? deviceid = '',
    String? orderType = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cart_id": "${cartid}",
  "user_id": "${userid}",
  "replace_status": "${replaceStatus}",
  "device_id": "${deviceid}",
  "order_type": "${orderType}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'placerepeatedorder',
      apiUrl: '${baseUrl}api/place_repeated_order',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class UserbankdetailsCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'userbankdetails',
      apiUrl: '${baseUrl}api/user_bank_details',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class NotificationlistCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'notificationlist',
      apiUrl: '${baseUrl}api/notificationlist',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class CancelorderreasonCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QuickartGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'cancelorderreason',
      apiUrl: '${baseUrl}api/cancelorderreason',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class CancelledproductorderCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeOrderid = '',
    String? cartID = '',
    String? cancelReason = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cart_id": "${cartID}",
  "user_id": "${userid}",
  "store_order_id": "${storeOrderid}",
  "cancel_reason": "${cancelReason}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cancelledproductorder',
      apiUrl: '${baseUrl}api/cancelledproductorder',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class AddtosubcartCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? qty = '',
    String? storeid = '',
    String? varientid = '',
    String? deviceid = '',
    String? repeatOrder = '',
    String? timeSlot = '',
    String? subTotalDelivery = '',
    String? subTotalDate = '',
    String? itemName = '',
    String? itemPrice = '',
    String? autoRenew = '',
    String? platform = '',
    String? featuresID = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "qty": "${qty}",
  "store_id": "7",
  "varient_id": "${varientid}",
  "is_subscription": 1,
  "percentage": 20,
  "device_id": "${deviceid}",
  "repeat_orders": "${repeatOrder}",
  "time_slot": "${timeSlot}",
  "sub_totaldelivery": "${subTotalDelivery}",
  "start_delivery_date": "${subTotalDate}",
  "isAutoRenew": "${autoRenew}",
  "platform": "${platform}",
  "product_feature_id": "${featuresID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addtosubcart',
      apiUrl: '${baseUrl}api/add_to_subcart',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  double? savingPrice(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.saving_price''',
      ));
  double? totalPrice(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.total_price''',
      ));
  int? totalItems(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.total_items''',
      ));
}

class ShowsubcartCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? deviceid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "device_id": "${deviceid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'showsubcart',
      apiUrl: '${baseUrl}api/showsub_cart',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  List? lastAddress(dynamic response) => getJsonField(
        response,
        r'''$.data.lastadd''',
        true,
      ) as List?;
  List? lastCardDetail(dynamic response) => getJsonField(
        response,
        r'''$.data.lastcarddetails''',
        true,
      ) as List?;
  List? cardData(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      ) as List?;
}

class CouponListCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? storeId = '',
    String? totalDelievery = '',
    String? cartId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "store_id": "7",
  "total_delivery": "${totalDelievery}",
  "cart_id": "${cartId}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CouponList',
      apiUrl: '${baseUrl}api/couponlist',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? couponData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ApplyCouponCall {
  Future<ApiCallResponse> call({
    String? storeId = '',
    String? couponCode = '',
    String? userId = '',
    String? orderType = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "coupon_code": "${couponCode}",
  "user_id": "${userId}",
  "order_type": "${orderType}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'applyCoupon',
      apiUrl: '${baseUrl}api/apply_coupon',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SubscriptionOrderPauseCall {
  Future<ApiCallResponse> call({
    String? susbscriptionId = '',
    String? pauseReason = '',
    String? cartId = '',
    String? storeOrderId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "subscription_id": "${susbscriptionId}",
  "pause_reason": "${pauseReason}",
  "cart_id": "${cartId}",
  "store_order_id": "${storeOrderId}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'subscriptionOrderPause',
      apiUrl: '${baseUrl}api/my_subscription_pause_order',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DailyCartTimeSlotCall {
  Future<ApiCallResponse> call({
    String? storeId = '',
    String? selectedDate = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id":"${storeId}",
  "selected_date":"${selectedDate}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'dailyCartTimeSlot',
      apiUrl: '${baseUrl}api/quickord_timeslot',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? responseMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? dailyTimeSlot(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class MydailyordersCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    int? pageno,
    int? pageCount,
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "page": ${pageno},
  "perpage": ${pageCount},
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'mydailyorders',
      apiUrl: '${baseUrl}api/my_dailyorders',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class CancelledquickorderCall {
  Future<ApiCallResponse> call({
    String? cartID = '',
    String? userID = '',
    String? cancelResoan = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "group_id": "${cartID}",
  "user_id": "${userID}",
  "cancel_reason": "${cancelResoan}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cancelledquickorder',
      apiUrl: '${baseUrl}api/cancelledquickorder',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class CheckoutsubcribtionorderCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? addressID = '',
    String? siNo = '',
    String? storeid = '',
    String? paymentMethod = '',
    String? wallet = '',
    String? couponid = '',
    String? couponCode = '',
    String? discountAmount = '',
    String? delPartnerInstruction = '',
    String? deviceid = '',
    String? paymentType = '',
    String? totalwalletamt = '',
    double? orderTotal,
    String? orderInstruction = '',
    String? autorenewSubCart = '',
    String? platform = '',
    String? totalrefwalletamt = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "is_subscription": 1,
  "address_id": "${addressID}",
  "bank_id": 0,
  "si_sub_ref_no": "${siNo}",
  "store_id": "7",
  "payment_method": "${paymentMethod}",
  "payment_status": "pending",
  "wallet": "${wallet}",
  "payment_id": null,
  "payment_gateway": null,
  "coupon_id": 0,
  "coupon_code": "",
  "discount_amount": 0.0,
  "device_id": "${deviceid}",
  "del_partner_instruction": "${delPartnerInstruction}",
  "payment_type": "${paymentType}",
  "del_partner_tip": "0",
  "totalwalletamt": "${totalwalletamt}",
  "order_instruction": "${orderInstruction}",
  "AutoRenewSubCart": "${autorenewSubCart}",
  "platform": "${platform}",
  "totalrefwalletamt": "${totalrefwalletamt}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkoutsubcribtionorder',
      apiUrl: '${baseUrl}api/checkout_subcribtionorder',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? cartID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].cart_id''',
      ));
}

class CheckoutquickorderCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? deviceid = '',
    String? storeid = '',
    String? addressID = '',
    String? bankID = '',
    String? siNo = '',
    String? paymentMethod = '',
    String? wallet = '',
    String? couponid = '',
    String? couponCode = '',
    String? discountAmount = '',
    String? deliveryDate = '',
    String? timeSlot = '',
    String? deliveryPartnerTip = '',
    String? deliveryPartnerInstruction = '',
    double? totalwalletamt,
    double? orderTotal,
    String? orderInstruction = '',
    String? platform = '',
    String? totalrefwalletamt = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "device_id": "${deviceid}",
  "address_id": "${addressID}",
  "bank_id": "${bankID}",
  "si_sub_ref_no": "${siNo}",
  "store_id": "7",
  "payment_method": "${paymentMethod}",
  "payment_status": "pending",
  "wallet": "${wallet}",
  "payment_id": null,
  "payment_gateway": null,
  "coupon_id": "${couponid}",
  "coupon_code": "${couponCode}",
  "discount_amount": "${discountAmount}",
  "delivery_date": "${deliveryDate}",
  "time_slot": "${timeSlot}",
  "del_partner_tip": "${deliveryPartnerTip}",
  "del_partner_instruction": "${deliveryPartnerInstruction}",
  "totalwalletamt": ${totalwalletamt},
  "order_instruction": "${orderInstruction}",
  "platform": "${platform}",
  "totalrefwalletamt": "${totalrefwalletamt}"
}''';

    return ApiManager.instance.makeApiCall(
      callName: 'checkoutquickorder',
      apiUrl: '${baseUrl}api/checkout_quickorder',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditProfileCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? image,
    String? filePath = '',
    String? userId = '',
    String? userPhone = '',
    String? countryCode = '',
    String? deviceId = '',
    String? userName = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'editProfile',
      apiUrl: '${baseUrl}api/edit_profile',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': image,
        'user_id': userId,
        'user_phone': userPhone,
        'country_code': countryCode,
        'device_id': deviceId,
        'user_name': userName,
        'platform': platform,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.image''',
      );
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ResumeOrderCall {
  Future<ApiCallResponse> call({
    String? storeId = '',
    String? selectedDate = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "selected_date": "${selectedDate}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ResumeOrder',
      apiUrl: '${baseUrl}api/resumeord_timeslot',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendOTPCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? newInfo = '',
    String? changeType = '',
    String? countryCode = '',
    String? dialCode = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "new_info": "${newInfo}",
  "change_type": "${changeType}",
  "country_code": "${countryCode}",
  "dial_code": "${dialCode}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendOTP',
      apiUrl: '${baseUrl}api/send_otp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class VerifyOTPUpdateCall {
  Future<ApiCallResponse> call({
    String? otp = '',
    String? lastId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "otp": "${otp}",
  "lastid": "${lastId}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'verifyOTPUpdate',
      apiUrl: '${baseUrl}api/verify_otp_update',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscriptionOrderResumeCall {
  Future<ApiCallResponse> call({
    String? subscriptionId = '',
    String? cartId = '',
    String? timeSlot = '',
    String? delieveryDate = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "subscription_id": "${subscriptionId}",
  "cart_id": "${cartId}",
  "time_slot": "${timeSlot}",
  "delivery_date": "${delieveryDate}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'subscriptionOrderResume',
      apiUrl: '${baseUrl}api/my_subscription_resume_order',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscriptionresumetimeslotCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QuickartGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Subscriptionresumetimeslot',
      apiUrl: '${baseUrl}api/resumeord_timeslot',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? dateData(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? timeslotsData(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].timeslots''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PaymentCall {
  Future<ApiCallResponse> call({
    String? addressid = '',
    String? userid = '',
    String? couponDiscount = '',
    String? walllet = '',
    String? paymentMethod = '',
    String? deviceid = '',
    String? siNO = '',
    String? storeid = '',
    String? couponid = '',
    String? couponcode = '',
    String? deliveryDate = '',
    String? timeSlot = '',
    String? partertip = '',
    String? parterInstruction = '',
    String? totalWalletAmt = '',
    String? paymentType = '',
    double? orderTotal,
    String? orderInstruction = '',
    String? platform = '',
    String? totalrefwalletamt = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "address_id": "${addressid}",
  "user_id": "${userid}",
  "bank_id": 0,
  "si_sub_ref_no": "${siNO}",
  "store_id": "7",
  "payment_method": "${paymentMethod}",
  "payment_status": "success",
  "wallet": "${walllet}",
  "payment_id": null,
  "payment_gateway": null,
  "coupon_id": "${couponid}",
  "coupon_code": "${couponcode}",
  "discount_amount": "${couponDiscount}",
  "delivery_date": "${deliveryDate}",
  "time_slot": "${timeSlot}",
  "del_partner_tip": "${partertip}",
  "del_partner_instruction": "${parterInstruction}",
  "device_id": "${deviceid}",
  "totalwalletamt": "${totalWalletAmt}",
  "group_id": "null",
  "payment_type": "${paymentType}",
  "order_instruction": "${orderInstruction}",
  "platform": "${platform}",
  "totalrefwalletamt": "${totalrefwalletamt}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'payment',
      apiUrl: '${baseUrl}api/payment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? redirectUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.redirect_url''',
      ));
}

class CancelledquickorderprodCall {
  Future<ApiCallResponse> call({
    String? cartid = '',
    String? userid = '',
    String? cancelReason = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cart_id": "${cartid}",
  "user_id": "${userid}",
  "cancel_reason": "${cancelReason}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cancelledquickorderprod',
      apiUrl: '${baseUrl}api/cancelledquickorderprod',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SeosourceCall {
  Future<ApiCallResponse> call({
    String? utmSource = '',
    String? utmcampaign = '',
    String? utmnetwork = '',
    String? utmmedium = '',
    String? utmkeyword = '',
    String? placement = '',
    String? userid = '',
    String? deviceid = '',
    String? fcmtoken = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "utm_source": "${utmSource}",
  "utm_campaign": "${utmcampaign}",
  "utm_network": "${utmnetwork}",
  "utm_medium": "${utmmedium}",
  "utm_keyword": "${utmkeyword}",
  "placement": "${placement}",
  "user_id": "${userid}",
  "device_id": "${deviceid}",
  "fcm_token": "${fcmtoken}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'seosource',
      apiUrl: '${baseUrl}api/seo_source',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OrdercardchangesCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? deviceid = '',
    String? siNo = '',
    String? cartid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "device_id": "${deviceid}",
  "si_sub_ref_no": "${siNo}",
  "cart_id": "${cartid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ordercardchanges',
      apiUrl: '${baseUrl}api/order_card_changes',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SubpaymentCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? addressid = '',
    String? siNo = '',
    String? storeid = '',
    String? paymentMethod = '',
    String? wallet = '',
    String? deviceid = '',
    String? paymentType = '',
    double? orderTotal,
    String? totalWalletAmt = '',
    String? delPartnerInstruction = '',
    String? orderInstruction = '',
    String? platform = '',
    String? totalrefwalletamt = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "is_subscription": 1,
  "address_id": "${addressid}",
  "bank_id": 0,
  "si_sub_ref_no": "${siNo}",
  "store_id": "7",
  "payment_method": "${paymentMethod}",
  "payment_status": "success",
  "wallet": "${wallet}",
  "payment_id": null,
  "payment_gateway": null,
  "coupon_id": 0,
  "coupon_code": "",
  "discount_amount": 0.0,
  "device_id": "${deviceid}",
  "group_id": "null",
  "payment_type": "${paymentType}",
  "totalwalletamt": "${totalWalletAmt}",
  "del_partner_instruction": "${delPartnerInstruction}",
  "order_instruction": "${orderInstruction}",
  "platform": "${platform}",
  "totalrefwalletamt": "${totalrefwalletamt}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'subpayment',
      apiUrl: '${baseUrl}api/subpayment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? redirectURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.redirect_url''',
      ));
}

class GuestloginCall {
  Future<ApiCallResponse> call({
    String? deviceid = '',
    String? fcmToken = '',
    String? uuid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "actual_device_id": "${deviceid}",
  "device_id": "${fcmToken}",
  "uuid": "${uuid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'guestlogin',
      apiUrl: '${baseUrl}api/guestlogin',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class SavecardCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
 "user_id":"${userid}",
 "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'savecard',
      apiUrl: '${baseUrl}api/savecard',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? refirectURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.redirect_url''',
      ));
}

class DeleteCardCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? bankId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
 "user_id": "${userId}",
 "bank_id": "${bankId}",
 "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteCard',
      apiUrl: '${baseUrl}api/deletecard',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateproductdetailsCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "platform": "${platform}"
}''';

    return ApiManager.instance.makeApiCall(
      callName: 'updateproductdetails',
      apiUrl: '${baseUrl}api/updateproductdetails',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? subCartSavingPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.subscriptiondiscountOnMrp''',
      ));
  int? subCartCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.subscriptioncartCount''',
      ));
  String? subCartPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.subscriptiontotalPrice''',
      ));
  String? dSavingPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.dailydiscountOnMrp''',
      ));
  String? dCartPrice(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.dailytotalPrice''',
      ));
  int? dCartCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.dailycartCount''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? userWallet(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userwallet''',
      ));
}

class FaqslistCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QuickartGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'faqslist',
      apiUrl: '${baseUrl}api/faqslist',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class QuickplacerepeatedorderCall {
  Future<ApiCallResponse> call({
    String? cartid = '',
    String? userid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cart_id": "${cartid}",
  "user_id": "${userid}",
  "order_type": "quick",
  "replace_status": 1,
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'quickplacerepeatedorder',
      apiUrl: '${baseUrl}api/quick_place_repeated_order',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class OrderssubscriptionproductCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeid = '',
    String? groupid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "store_id": "7",
  "group_id": "${groupid}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'orderssubscriptionproduct',
      apiUrl: '${baseUrl}api/orders_subscription_product',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class SearchbybrandsCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeid = '',
    String? keyword = '',
    String? byName = '',
    String? maxPrice = '',
    String? minPrice = '',
    String? stock = '',
    String? minDiscount = '',
    String? maxDiscount = '',
    String? sort = '',
    String? sortName = '',
    String? sortPrice = '',
    String? catid = '',
    String? subcatid = '',
    String? deviceid = '',
    String? brandid = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "store_id": "7",
  "keyword": "${keyword}",
  "byname": "${byName}",
  "min_price": "${minPrice}",
  "max_price": "${maxPrice}",
  "stock": "${stock}",
  "min_discount": "${minDiscount}",
  "max_discount": "${maxDiscount}",
  "sort": "${sort}",
  "sortname": "${sortName}",
  "sortprice": "${sortPrice}",
  "cat_id": "${catid}",
  "sub_cat_id": "${subcatid}",
  "device_id": "${deviceid}",
  "min_rating": "null",
  "max_rating": "null",
  "brand_id": ${brandid}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'searchbybrands',
      apiUrl: '${baseUrl}api/searchbybrands',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ProfileDetailsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProfileDetails',
      apiUrl: '${baseUrl}api/show_profile',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddnotifymeCall {
  Future<ApiCallResponse> call({
    String? productID = '',
    String? varientID = '',
    String? userID = '',
    String? platform = '',
    String? fcmToken = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "product_id": "${productID}",
  "varient_id": "${varientID}",
  "user_id": "${userID}",
  "platform": "${platform}",
  "fcmtoken": "${fcmToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addnotifyme',
      apiUrl: '${baseUrl}api/addnotifyme',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ShownotifymeCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userid}",
  "store_id": "7",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'shownotifyme',
      apiUrl: '${baseUrl}api/shownotifyme',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class DeletenotifymeCall {
  Future<ApiCallResponse> call({
    String? productID = '',
    String? varientID = '',
    String? userID = '',
    String? fcmToken = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "product_id": "${productID}",
  "varient_id": "${varientID}",
  "user_id": "${userID}",
  "platform": "${platform}",
  "fcmtoken": "${fcmToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deletenotifyme',
      apiUrl: '${baseUrl}api/deletenotifyme',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class VerifydetailsCall {
  Future<ApiCallResponse> call({
    String? transferType = '',
    String? appUUID = '',
    String? serverUUID = '',
    String? appUserID = '',
    String? serverUSerID = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "transfertype": "${transferType}",
  "appuuid": "${appUUID}",
  "serveruuid": "${serverUUID}",
  "appuserid": "${appUserID}",
  "serveruserid": "${serverUSerID}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'verifydetails',
      apiUrl: '${baseUrl}api/verify_details',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  int? userID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.user_id''',
      ));
  String? uuid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.uuid''',
      ));
}

class ReviewondeliveryCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? cartID = '',
    int? rating,
    String? descriptiion = '',
    String? subScriptinID = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userid)}",
  "cart_id": "${escapeStringForJson(cartID)}",
  "rating": ${rating},
  "description": "${escapeStringForJson(descriptiion)}",
  "subscription_id": "${escapeStringForJson(subScriptinID)}",
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'reviewondelivery',
      apiUrl: '${baseUrl}api/review_on_delivery',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class AddproductratingCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? storeid = '',
    int? rating,
    String? varientID = '',
    String? description = '',
    String? cartID = '',
    String? subscriptionID = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userID)}",
  "store_id": "7",
  "varient_id": "${escapeStringForJson(varientID)}",
  "rating": ${rating},
  "description": "${escapeStringForJson(description)}",
  "cart_id": "${escapeStringForJson(cartID)}",
  "subscription_id": "${escapeStringForJson(subscriptionID)}",
  "platform": "${escapeStringForJson(platform)}"
}''';

print("G1---->${ffApiRequestBody}");
print("G2---->${baseUrl}api/add_product_rating");
    return ApiManager.instance.makeApiCall(
      callName: 'addproductrating',
      apiUrl: '${baseUrl}api/add_product_rating',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ShowspcatcartCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? deviceid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userid)}",
  "device_id": "${escapeStringForJson(deviceid)}",
 "selected_date":"null",
 "selected_time":"null",
 "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'showspcatcart',
      apiUrl: '${baseUrl}api/show_spcatcart',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? mainData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  List? lastAdd(dynamic response) => getJsonField(
        response,
        r'''$.data.lastadd''',
        true,
      ) as List?;
  dynamic? lastCardDetails(dynamic response) => getJsonField(
        response,
        r'''$.data.lastcarddetails''',
      );
  List? catData(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      ) as List?;
  List? dataTimeSlots(dynamic response) => getJsonField(
        response,
        r'''$.data.data[:].timeslots''',
        true,
      ) as List?;
}

class MyorderssubscriptionlistCall {
  Future<ApiCallResponse> call({
    String? storeid = '',
    String? userid = '',
    int? page,
    int? pageper,
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "user_id": "$userid",
  "page": ${page},
  "perpage": ${pageper},
  "platform": "${platform}"
}''';
print("G1---->${ffApiRequestBody}");
print("G2---->${baseUrl}api/my_orders_subscription_list");
    return ApiManager.instance.makeApiCall(
      callName: 'myorderssubscriptionlist',
      apiUrl: '${baseUrl}api/my_orders_subscription_list',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class UpquickordertimeslotCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    dynamic? datetimeArrayJson,
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final datetimeArray = _serializeJson(datetimeArrayJson, true);
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userid)}",
  "dataarray": ${datetimeArray},
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'upquickordertimeslot',
      apiUrl: '${baseUrl}api/upquickorder_timeslot',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ProductreviewlistCall {
  Future<ApiCallResponse> call({
    String? varientid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "varient_id": "${escapeStringForJson(varientid)}",
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'productreviewlist',
      apiUrl: '${baseUrl}api/product_review_list',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class OccasionalcatsearchCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeid = '',
    int? page,
    int? pageCount,
    String? byName = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "user_id": "${escapeStringForJson(userid)}",
  "byname": "${escapeStringForJson(byName)}",
  "min_price": "null",
  "max_price": "null",
  "stock": "null",
  "min_discount": "null",
  "max_discount": "null",
  "sort": "null",
  "sortname": "null",
  "sortprice": "null",
  "cat_id": "null",
  "sub_cat_id": "null",
  "cattype": "occasional",
  "page": ${page},
  "perpage": ${pageCount},
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'occasionalcatsearch',
      apiUrl: '${baseUrl}api/occasionalcat_search',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class TrialproductlistCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'trialproductlist',
      apiUrl: '${baseUrl}api/trailpacklist',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TrialPackDetailsCall {
  Future<ApiCallResponse> call({
    String? trialId = '',
    String? userId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
    "trail_id" : "${escapeStringForJson(trialId)}" ,
    "user_id": "${escapeStringForJson(userId)}",
    "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'trialPackDetails',
      apiUrl: '${baseUrl}api/trailpackdetails',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchbybannerpageCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    int? page,
    int? pageCount,
    String? keyword = '',
    String? brandid = '',
    String? bannerid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userid)}",
  "store_id": "7",
  "keyword": "${escapeStringForJson(keyword)}",
  "byname": "null",
  "min_price": "null",
  "max_price": "null",
  "stock": "null",
  "min_discount": "null",
  "max_discount": "null",
  "sort": "null",
  "sortname": "null",
  "sortprice": "null",
  "cat_id": "null",
  "sub_cat_id": "null",
  "device_id": "UP1A.231005.007",
  "brand_id": "${escapeStringForJson(brandid)}",
  "banner_id": "${escapeStringForJson(bannerid)}",
  "perpage": ${pageCount},
  "page": ${page},
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'searchbybannerpage',
      apiUrl: '${baseUrl}api/searchbybanner',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? date(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AddtrailpackCall {
  Future<ApiCallResponse> call({
    String? trialid = '',
    String? userid = '',
    String? qty = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "trail_id": "${escapeStringForJson(trialid)}",
  "user_id": "${escapeStringForJson(userid)}",
  "qty": "${escapeStringForJson(qty)}",
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addtrailpack',
      apiUrl: '${baseUrl}api/add_trail_pack',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class ShowtrailpackCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? deviceid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userid)}",
  "device_id": "${escapeStringForJson(deviceid)}",
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'showtrailpack',
      apiUrl: '${baseUrl}api/show_trailpack',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? mainData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  List? timeSlotsData(dynamic response) => getJsonField(
        response,
        r'''$.data.timeslotsdata''',
        true,
      ) as List?;
  List? lastAddress(dynamic response) => getJsonField(
        response,
        r'''$.data.lastadd''',
        true,
      ) as List?;
  dynamic? lastCardDetails(dynamic response) => getJsonField(
        response,
        r'''$.data.lastcarddetails''',
      );
  List? productList(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      ) as List?;
}

class CheckouttrailpackCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? addressid = '',
    String? sino = '',
    String? storeid = '',
    String? paymentMethod = '',
    String? deliveryDate = '',
    String? timeSlot = '',
    String? deviceid = '',
    String? deliverypartnerTip = '',
    String? deliveryInstruction = '',
    String? orderInstruction = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userid)}",
  "address_id": "${escapeStringForJson(addressid)}",
  "bank_id": 0,
  "si_sub_ref_no": "${escapeStringForJson(sino)}",
  "store_id": "7",
  "payment_method": "${escapeStringForJson(paymentMethod)}",
  "payment_status": "Pending",
  "payment_id": null,
  "payment_gateway": null,
  "discount_amount": 0.0,
  "delivery_date": "${escapeStringForJson(deliveryDate)}",
  "time_slot": "${escapeStringForJson(timeSlot)}",
  "device_id": "${escapeStringForJson(deviceid)}",
  "del_partner_tip": "${escapeStringForJson(deliverypartnerTip)}",
  "del_partner_instruction": "${escapeStringForJson(deliveryInstruction)}",
  "order_instruction": "${escapeStringForJson(orderInstruction)}",
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkouttrailpack',
      apiUrl: '${baseUrl}api/checkout_trailpack',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class TrailpaymentCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? addressid = '',
    String? sino = '',
    String? storeid = '',
    String? paymentMethod = '',
    String? deliveryDate = '',
    String? timeSlot = '',
    String? delPartnerTip = '',
    String? delPartnerInstruction = '',
    String? deviceid = '',
    String? orderInstruction = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userid)}",
  "address_id": "${escapeStringForJson(addressid)}",
  "bank_id": 0,
  "si_sub_ref_no": "${escapeStringForJson(sino)}",
  "store_id": "7",
  "payment_method": "${escapeStringForJson(paymentMethod)}",
  "payment_status": "Pending",
  "wallet": "no",
  "payment_id": null,
  "payment_gateway": null,
  "coupon_id": 0,
  "coupon_code": "",
  "discount_amount": 0.0,
  "delivery_date": "${escapeStringForJson(deliveryDate)}",
  "time_slot": "${escapeStringForJson(timeSlot)}",
  "del_partner_tip": "${escapeStringForJson(delPartnerTip)}",
  "del_partner_instruction": "${escapeStringForJson(delPartnerInstruction)}",
  "device_id": "${escapeStringForJson(deviceid)}",
  "totalwalletamt": 0,
  "group_id": "null",
  "order_instruction": "${escapeStringForJson(orderInstruction)}",
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'trailpayment',
      apiUrl: '${baseUrl}api/trailpayment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class FeaturedCategoryCall {
  Future<ApiCallResponse> call({
    String? storedId = '',
    String? fcatId = '',
    String? userid = '',
    String? byName = '',
    String? minprice = '',
    String? maxprice = '',
    String? minrating = '',
    String? maxrating = '',
    String? sort = '',
    String? sortName = '',
    String? sortPrice = '',
    String? stock = '',
    String? minDiscount = '',
    String? maxDiscount = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "${escapeStringForJson(storedId)}",
  "fcat_id": "${escapeStringForJson(fcatId)}",
  "user_id": "${escapeStringForJson(userid)}",
  "byname": "${escapeStringForJson(byName)}",
  "min_price": "${escapeStringForJson(minprice)}",
  "max_price": "${escapeStringForJson(maxprice)}",
  "stock": "${escapeStringForJson(stock)}",
  "min_discount": "${escapeStringForJson(minDiscount)}",
  "max_discount": "${escapeStringForJson(maxDiscount)}",
  "min_rating": "${escapeStringForJson(minrating)}",
  "max_rating": "${escapeStringForJson(maxrating)}",
  "sort": "${escapeStringForJson(sort)}",
  "sortname": "${escapeStringForJson(sortName)}",
  "sortprice": "${escapeStringForJson(sortPrice)}",
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FeaturedCategory',
      apiUrl: '${baseUrl}api/featurecat_prod',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MightHaveMissedCall {
  Future<ApiCallResponse> call({
    String? storeId = '',
    String? userId = '',
    String? deviceId = '',
    String? orderType = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "user_id": "${escapeStringForJson(userId)}",
  "device_id": "${escapeStringForJson(deviceId)}",
  "type": "${escapeStringForJson(orderType)}",
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MightHaveMissed',
      apiUrl: '${baseUrl}api/might_have_missed',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserOrderListCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? storeId = '',
    String? deviceId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${userId}",
  "store_id": "7",
  "device_id": "${deviceId}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UserOrderList',
      apiUrl: '${baseUrl}api/orderwiselist',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscriptionMergedCall {
  Future<ApiCallResponse> call({
    String? groupId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "group_id": "${groupId}",
  "platform": "${platform}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SubscriptionMerged',
      apiUrl: '${baseUrl}api/merge_orders',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? mainData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List? productData(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data''',
        true,
      ) as List?;
  List? productSubscriptionData(dynamic response) => getJsonField(
        response,
        r'''$.data[:].subscription_details''',
        true,
      ) as List?;
  List<String>? lastDeliveryDate(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].lastdeliverydate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? productName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].data[:].product_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AutoRenewalCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? storeOrderId = '',
    String? cartId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "store_order_id": "${escapeStringForJson(storeOrderId)}",
  "cart_id": "${escapeStringForJson(cartId)}",
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AutoRenewal',
      apiUrl: '${baseUrl}api/can_autorenewal',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadDoorimageCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? image,
    String? addressId = '',
    String? userId = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'UploadDoorimage',
      apiUrl: '${baseUrl}api/upload_image',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'user_id': userId,
        'address_id': addressId,
        'image': image,
        'platform': platform,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TrendingrecentsearchCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? storeid = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "user_id" :"${escapeStringForJson(userid)}",
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'trendingrecentsearch',
      apiUrl: '${baseUrl}api/trendingrecentsearch',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  List? recentSearchList(dynamic response) => getJsonField(
        response,
        r'''$.recent_search''',
        true,
      ) as List?;
  List? trendBrandList(dynamic response) => getJsonField(
        response,
        r'''$.trend_brands''',
        true,
      ) as List?;
  List? trendProductList(dynamic response) => getJsonField(
        response,
        r'''$.trend_products''',
        true,
      ) as List?;
}

class GenerateinvoiceCall {
  Future<ApiCallResponse> call({
    String? userid = '',
    String? cartID = '',
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userid)}",
  "cart_id": "${escapeStringForJson(cartID)}",
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateinvoice',
      apiUrl: '${baseUrl}api/generate_invoice',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? invoiceURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data''',
      ));
}

class SearchbypopupbannerCall {
  Future<ApiCallResponse> call({
    String? storeid = '',
    String? userid = '',
    String? bannerid = '',
    String? maxPrice = '',
    String? minPrice = '',
    String? stock = '',
    String? minDiscount = '',
    String? maxDiscount = '',
    String? sort = '',
    String? sortName = '',
    String? sortPrice = '',
    int? page,
    int? pagePer,
    String? platform = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "store_id": "7",
  "user_id": "${escapeStringForJson(userid)}",
  "bannerid": "${escapeStringForJson(bannerid)}",
  "min_price": "${escapeStringForJson(minPrice)}",
  "max_price": "${escapeStringForJson(maxPrice)}",
  "stock": "${escapeStringForJson(stock)}",
  "min_discount": "${escapeStringForJson(minDiscount)}",
  "max_discount": "${escapeStringForJson(maxDiscount)}",
  "sort": "${escapeStringForJson(sort)}",
  "sortname": "${escapeStringForJson(sortName)}",
  "sortprice": "${escapeStringForJson(sortPrice)}",
  "cat_id": "null",
  "sub_cat_id": "null",
  "page": ${page},
  "perpage": ${pagePer},
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'searchbypopupbanner',
      apiUrl: '${baseUrl}api/searchbypopupbanner',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class FeaturecategoryCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = QuickartGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'featurecategory',
      apiUrl: '${baseUrl}api/feature_category',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class UpdatecartCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? storeID = '',
    dynamic? varientIDJson,
    String? productFeatureID = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final varientID = _serializeJson(varientIDJson, true);
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userID)}",
  "store_id": "7",
  "varient_id": ${varientID},
  "product_feature_id": "${escapeStringForJson(productFeatureID)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updatecart',
      apiUrl: '${baseUrl}api/update_cart',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class UpdatessubcartCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? storeID = '',
    dynamic? varientIDJson,
    String? productFeatureID = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final varientID = _serializeJson(varientIDJson, true);
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userID)}",
  "store_id": "7",
  "varient_id": ${varientID},
  "product_feature_id": "${escapeStringForJson(productFeatureID)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updatessubcart ',
      apiUrl: '${baseUrl}api/update_subcart',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SpentbywalletCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? startDate = '',
    String? endDate = '',
    String? type = '',
  }) async {
    final baseUrl = QuickartGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userID)}",
  "start_date": "${escapeStringForJson(startDate)}",
  "end_date": "${escapeStringForJson(endDate)}",
  "type": "${escapeStringForJson(type)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'spentbywallet',
      apiUrl: '${baseUrl}api/spent_by_wallet',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

/// End Quickart Group Code

class NearbySearchGoogleMapsCall {
  static Future<ApiCallResponse> call({
    String? latlng = '27.8247427:-82.75040159999999',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'nearbySearchGoogleMaps',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/nearbysearch/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyDjGU6WbSwLK9d7_CAVYQ1Br0DpFhx3Rt0",
        'location': latlng,
        'radius': "2000",
        'type': "Hospital",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? lat(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? long(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class AutocompleteCall {
  static Future<ApiCallResponse> call({
    String? input = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'autocomplete',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/autocomplete/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'language': "en_US",
        'input': input,
        'key': "AIzaSyDjGU6WbSwLK9d7_CAVYQ1Br0DpFhx3Rt0",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? placeName(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ProductsearchCall {
  static Future<ApiCallResponse> call({
    String? userid = '',
    String? keyword = '',
    String? storeid = '',
    String? platform = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userid)}",
  "store_id": "7",
  "keyword": "${escapeStringForJson(keyword)}",
  "byname": "null",
  "min_price": "null",
  "max_price": "null",
  "stock": "null",
  "min_discount": "null",
  "max_discount": "null",
  "sort": "null",
  "sortname": "null",
  "sortprice": "null",
  "cat_id": "null",
  "sub_cat_id": "null",
  "device_id": "",
  "min_rating": "null",
  "max_rating": "null",
  "perpage": 200,
  "page": 1,
  "platform": "${escapeStringForJson(platform)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'productsearch',
      apiUrl:
          'https://ckxrmeapgvkllpxjgheg.supabase.co/functions/v1/product-search',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
