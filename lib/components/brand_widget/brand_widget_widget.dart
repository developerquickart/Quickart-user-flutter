import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'brand_widget_model.dart';
export 'brand_widget_model.dart';

class BrandWidgetWidget extends StatefulWidget {
  const BrandWidgetWidget({
    super.key,
    required this.brandList,
  });

  final dynamic brandList;

  @override
  State<BrandWidgetWidget> createState() => _BrandWidgetWidgetState();
}

class _BrandWidgetWidgetState extends State<BrandWidgetWidget> {
  late BrandWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrandWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final brand = widget!.brandList!.toList();

        return GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.1,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: brand.length,
          itemBuilder: (context, brandIndex) {
            final brandItem = brand[brandIndex];
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('BRAND_WIDGET_Container_dz8zto2x_ON_TAP');
                logFirebaseEvent('Container_navigate_to');

                context.pushNamed(
                  BrandProductListScreenWidget.routeName,
                  queryParameters: {
                    'keywordPage': serializeParam(
                      getJsonField(
                        brandItem,
                        r'''$.title''',
                      ).toString(),
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );

                logFirebaseEvent('Container_update_app_state');
                FFAppState().searchText = getJsonField(
                  brandItem,
                  r'''$.title''',
                ).toString();
                FFAppState().brandID = getJsonField(
                  brandItem,
                  r'''$.cat_id''',
                ).toString();
                FFAppState().searchScreenNaviagtion = '';
                FFAppState().update(() {});
                logFirebaseEvent('Container_custom_action');
                await actions.facebookEventClass(
                  getJsonField(
                    brandItem,
                    r'''$.cat_id''',
                  ).toString(),
                  getJsonField(
                    brandItem,
                    r'''$.title''',
                  ).toString(),
                  ' ',
                  0.0,
                  0,
                  0.0,
                  'brand',
                  FFAppState().emptyJson,
                  ' ',
                  ' ',
                  ' ',
                  ' ',
                  ' ',
                );
                logFirebaseEvent('Container_google_analytics_event');
                logFirebaseEvent('Navigation To Search Result Screen');
              },
              child: Container(
                width: 100.0,
                height: 130.0,
                decoration: BoxDecoration(
                  color: FFAppConstants.whiteColor,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FFAppConstants.neutralWhiteF5F5F5,
                    width: 1.0,
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          getJsonField(
                            brandItem,
                            r'''$.image''',
                          )?.toString(),
                          'https://tenor.com/en-GB/view/free-loader-gif-25681495',
                        ),
                        width: 100.0,
                        height: 130.0,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/error_image.png',
                          width: 100.0,
                          height: 130.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
