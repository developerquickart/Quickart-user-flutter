import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = false;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => RootPageContext.wrap(
        appStateNotifier.loggedIn
            ? DashboardScreenWidget()
            : QuickartsplashScreenWidget(),
        errorRoute: state.uri.toString(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn
                ? DashboardScreenWidget()
                : QuickartsplashScreenWidget(),
          ),
        ),
        FFRoute(
          name: QuickartsplashScreenWidget.routeName,
          path: QuickartsplashScreenWidget.routePath,
          builder: (context, params) => QuickartsplashScreenWidget(),
        ),
        FFRoute(
          name: IntroScreenWidget.routeName,
          path: IntroScreenWidget.routePath,
          builder: (context, params) => IntroScreenWidget(),
        ),
        FFRoute(
          name: LoginOnBoardScreenWidget.routeName,
          path: LoginOnBoardScreenWidget.routePath,
          builder: (context, params) => LoginOnBoardScreenWidget(
            refCode: params.getParam(
              'refCode',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SignUpScreenWidget.routeName,
          path: SignUpScreenWidget.routePath,
          builder: (context, params) => SignUpScreenWidget(
            refCode: params.getParam(
              'refCode',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LoginScreenWidget.routeName,
          path: LoginScreenWidget.routePath,
          builder: (context, params) => LoginScreenWidget(),
        ),
        FFRoute(
          name: OtpScreenWidget.routeName,
          path: OtpScreenWidget.routePath,
          builder: (context, params) => OtpScreenWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            refCode: params.getParam(
              'refCode',
              ParamType.String,
            ),
            screenName: params.getParam(
              'screenName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DashboardScreenWidget.routeName,
          path: DashboardScreenWidget.routePath,
          builder: (context, params) => DashboardScreenWidget(
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TopDealsScreenWidget.routeName,
          path: TopDealsScreenWidget.routePath,
          builder: (context, params) => TopDealsScreenWidget(
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TermsandConditionWidget.routeName,
          path: TermsandConditionWidget.routePath,
          builder: (context, params) => TermsandConditionWidget(),
        ),
        FFRoute(
          name: AddressListScreenWidget.routeName,
          path: AddressListScreenWidget.routePath,
          builder: (context, params) => AddressListScreenWidget(),
        ),
        FFRoute(
          name: AddAddressScreenWidget.routeName,
          path: AddAddressScreenWidget.routePath,
          builder: (context, params) => AddAddressScreenWidget(),
        ),
        FFRoute(
          name: FaqWidget.routeName,
          path: FaqWidget.routePath,
          builder: (context, params) => FaqWidget(),
        ),
        FFRoute(
          name: Faq2Widget.routeName,
          path: Faq2Widget.routePath,
          builder: (context, params) => Faq2Widget(
            que: params.getParam(
              'que',
              ParamType.String,
            ),
            ans: params.getParam(
              'ans',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ProfilePageWidget.routeName,
          path: ProfilePageWidget.routePath,
          builder: (context, params) => ProfilePageWidget(),
        ),
        FFRoute(
          name: RepeatOrdersWidget.routeName,
          path: RepeatOrdersWidget.routePath,
          builder: (context, params) => RepeatOrdersWidget(
            repeat: params.getParam(
              'repeat',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: FavouritesScreenWidget.routeName,
          path: FavouritesScreenWidget.routePath,
          builder: (context, params) => FavouritesScreenWidget(),
        ),
        FFRoute(
          name: NotifyProductsListScreenWidget.routeName,
          path: NotifyProductsListScreenWidget.routePath,
          builder: (context, params) => NotifyProductsListScreenWidget(),
        ),
        FFRoute(
          name: DailyCartScreenWidget.routeName,
          path: DailyCartScreenWidget.routePath,
          builder: (context, params) => DailyCartScreenWidget(),
        ),
        FFRoute(
          name: CategoriesScreenWidget.routeName,
          path: CategoriesScreenWidget.routePath,
          builder: (context, params) => CategoriesScreenWidget(
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SearchScreenWidget.routeName,
          path: SearchScreenWidget.routePath,
          builder: (context, params) => SearchScreenWidget(),
        ),
        FFRoute(
          name: TrendingProductsScreenWidget.routeName,
          path: TrendingProductsScreenWidget.routePath,
          builder: (context, params) => TrendingProductsScreenWidget(
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AdditionalCatScreenWidget.routeName,
          path: AdditionalCatScreenWidget.routePath,
          builder: (context, params) => AdditionalCatScreenWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: BrandListScreenWidget.routeName,
          path: BrandListScreenWidget.routePath,
          builder: (context, params) => BrandListScreenWidget(),
        ),
        FFRoute(
          name: SearchResultScreenWidget.routeName,
          path: SearchResultScreenWidget.routePath,
          builder: (context, params) => SearchResultScreenWidget(
            brandText: params.getParam(
              'brandText',
              ParamType.String,
            ),
            keyword: params.getParam(
              'keyword',
              ParamType.String,
            ),
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            placement: params.getParam(
              'placement',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SearchProductScreenWidget.routeName,
          path: SearchProductScreenWidget.routePath,
          builder: (context, params) => SearchProductScreenWidget(
            keywordPage: params.getParam(
              'keywordPage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: GoogleMapsRedirectWidget.routeName,
          path: GoogleMapsRedirectWidget.routePath,
          builder: (context, params) => GoogleMapsRedirectWidget(),
        ),
        FFRoute(
          name: WalletScreenWidget.routeName,
          path: WalletScreenWidget.routePath,
          builder: (context, params) => WalletScreenWidget(),
        ),
        FFRoute(
          name: ContactUsScreenWidget.routeName,
          path: ContactUsScreenWidget.routePath,
          builder: (context, params) => ContactUsScreenWidget(),
        ),
        FFRoute(
          name: FreshFoodScreenWidget.routeName,
          path: FreshFoodScreenWidget.routePath,
          builder: (context, params) => FreshFoodScreenWidget(),
        ),
        FFRoute(
          name: NotificationsWidget.routeName,
          path: NotificationsWidget.routePath,
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: CardScreenWidget.routeName,
          path: CardScreenWidget.routePath,
          builder: (context, params) => CardScreenWidget(),
        ),
        FFRoute(
          name: EditProfile2Widget.routeName,
          path: EditProfile2Widget.routePath,
          builder: (context, params) => EditProfile2Widget(
            dialCode: params.getParam(
              'dialCode',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SearchbyBannerWidget.routeName,
          path: SearchbyBannerWidget.routePath,
          builder: (context, params) => SearchbyBannerWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            banner: params.getParam(
              'banner',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CancelOrderScreenWidget.routeName,
          path: CancelOrderScreenWidget.routePath,
          builder: (context, params) => CancelOrderScreenWidget(),
        ),
        FFRoute(
          name: SneakyProductListScreenWidget.routeName,
          path: SneakyProductListScreenWidget.routePath,
          builder: (context, params) => SneakyProductListScreenWidget(
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CouponsandOffersWidget.routeName,
          path: CouponsandOffersWidget.routePath,
          builder: (context, params) => CouponsandOffersWidget(),
        ),
        FFRoute(
          name: OrderTrackingPageWidget.routeName,
          path: OrderTrackingPageWidget.routePath,
          builder: (context, params) => OrderTrackingPageWidget(),
        ),
        FFRoute(
          name: OrderSuccessFailScreenWidget.routeName,
          path: OrderSuccessFailScreenWidget.routePath,
          builder: (context, params) => OrderSuccessFailScreenWidget(),
        ),
        FFRoute(
          name: OrderCancelScreenWidget.routeName,
          path: OrderCancelScreenWidget.routePath,
          builder: (context, params) => OrderCancelScreenWidget(),
        ),
        FFRoute(
          name: CartSubscriptionScreenWidget.routeName,
          path: CartSubscriptionScreenWidget.routePath,
          builder: (context, params) => CartSubscriptionScreenWidget(),
        ),
        FFRoute(
          name: PaymentScreenWidget.routeName,
          path: PaymentScreenWidget.routePath,
          builder: (context, params) => PaymentScreenWidget(
            redirectURl: params.getParam(
              'redirectURl',
              ParamType.String,
            ),
            screenPName: params.getParam(
              'screenPName',
              ParamType.String,
            ),
            mrp: params.getParam(
              'mrp',
              ParamType.double,
            ),
            orderType: params.getParam(
              'orderType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ProductDetailsScreenWidget.routeName,
          path: ProductDetailsScreenWidget.routePath,
          builder: (context, params) => ProductDetailsScreenWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: NoteIOSNotesWidget.routeName,
          path: NoteIOSNotesWidget.routePath,
          builder: (context, params) => NoteIOSNotesWidget(),
        ),
        FFRoute(
          name: NoteAndroidNotesWidget.routeName,
          path: NoteAndroidNotesWidget.routePath,
          builder: (context, params) => NoteAndroidNotesWidget(),
        ),
        FFRoute(
          name: BrandProductListScreenWidget.routeName,
          path: BrandProductListScreenWidget.routePath,
          builder: (context, params) => BrandProductListScreenWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            keywordPage: params.getParam(
              'keywordPage',
              ParamType.String,
            ),
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RatingOrderScreenWidget.routeName,
          path: RatingOrderScreenWidget.routePath,
          builder: (context, params) => RatingOrderScreenWidget(
            productList: params.getParam(
              'productList',
              ParamType.JSON,
            ),
            cartId: params.getParam(
              'cartId',
              ParamType.String,
            ),
            subscriptionID: params.getParam(
              'subscriptionID',
              ParamType.String,
            ),
            screenName: params.getParam(
              'screenName',
              ParamType.String,
            ),
            rating: params.getParam(
              'rating',
              ParamType.int,
            ),
            reviewStr: params.getParam(
              'reviewStr',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TrialProductCartScreenWidget.routeName,
          path: TrialProductCartScreenWidget.routePath,
          builder: (context, params) => TrialProductCartScreenWidget(),
        ),
        FFRoute(
          name: TrialProductListingWidget.routeName,
          path: TrialProductListingWidget.routePath,
          builder: (context, params) => TrialProductListingWidget(),
        ),
        FFRoute(
          name: ProductRatingReveiwScreenWidget.routeName,
          path: ProductRatingReveiwScreenWidget.routePath,
          builder: (context, params) => ProductRatingReveiwScreenWidget(
            varientID: params.getParam(
              'varientID',
              ParamType.String,
            ),
            productName: params.getParam(
              'productName',
              ParamType.String,
            ),
            varientid: params.getParam(
              'varientid',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: OccasionalCategoryWidget.routeName,
          path: OccasionalCategoryWidget.routePath,
          builder: (context, params) => OccasionalCategoryWidget(
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TrialPackcategoriesWidget.routeName,
          path: TrialPackcategoriesWidget.routePath,
          builder: (context, params) => TrialPackcategoriesWidget(
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AllOrdersTABLISTWidget.routeName,
          path: AllOrdersTABLISTWidget.routePath,
          builder: (context, params) => AllOrdersTABLISTWidget(),
        ),
        FFRoute(
          name: SubscriptionOrderProductsWidget.routeName,
          path: SubscriptionOrderProductsWidget.routePath,
          builder: (context, params) => SubscriptionOrderProductsWidget(
            orderDate: params.getParam(
              'orderDate',
              ParamType.String,
            ),
            orderPrice: params.getParam(
              'orderPrice',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PdfViewWidget.routeName,
          path: PdfViewWidget.routePath,
          builder: (context, params) => PdfViewWidget(
            pdfURL: params.getParam(
              'pdfURL',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SubscriptionOrderProductsInfoWidget.routeName,
          path: SubscriptionOrderProductsInfoWidget.routePath,
          builder: (context, params) => SubscriptionOrderProductsInfoWidget(
            orderPrice: params.getParam(
              'orderPrice',
              ParamType.String,
            ),
            orderDate: params.getParam(
              'orderDate',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SubCategoriesScreenWidget.routeName,
          path: SubCategoriesScreenWidget.routePath,
          builder: (context, params) => SubCategoriesScreenWidget(
            catid: params.getParam(
              'catid',
              ParamType.String,
            ),
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
            category: params.getParam(
              'category',
              ParamType.String,
            ),
            subcatid: params.getParam(
              'subcatid',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: FeaturedCategoryWidget.routeName,
          path: FeaturedCategoryWidget.routePath,
          builder: (context, params) => FeaturedCategoryWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: NoteDeeplinkflutterchangesWidget.routeName,
          path: NoteDeeplinkflutterchangesWidget.routePath,
          builder: (context, params) => NoteDeeplinkflutterchangesWidget(),
        ),
        FFRoute(
          name: SearchbyPopupBannerWidget.routeName,
          path: SearchbyPopupBannerWidget.routePath,
          builder: (context, params) => SearchbyPopupBannerWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            utmSource: params.getParam(
              'utmSource',
              ParamType.String,
            ),
            utmCampaign: params.getParam(
              'utmCampaign',
              ParamType.String,
            ),
            utmNetwork: params.getParam(
              'utmNetwork',
              ParamType.String,
            ),
            utmMedium: params.getParam(
              'utmMedium',
              ParamType.String,
            ),
            utmKeyword: params.getParam(
              'utmKeyword',
              ParamType.String,
            ),
            utmPlacement: params.getParam(
              'utmPlacement',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: WebViewAppWidget.routeName,
          path: WebViewAppWidget.routePath,
          builder: (context, params) => WebViewAppWidget(
            webURL: params.getParam(
              'webURL',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: GoogleMapsRedirectCopyWidget.routeName,
          path: GoogleMapsRedirectCopyWidget.routePath,
          builder: (context, params) => GoogleMapsRedirectCopyWidget(),
        ),
        FFRoute(
          name: DailyCartScreenCopyWidget.routeName,
          path: DailyCartScreenCopyWidget.routePath,
          builder: (context, params) => DailyCartScreenCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/quickartsplashScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.white,
                  // child: Center(
                  //   child: Image.asset(
                  //     'assets/images/Quickart_Icon.png',
                  //     width: 300.0,
                  //     height: 300.0,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
