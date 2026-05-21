import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'top_category_widget_model.dart';
export 'top_category_widget_model.dart';

class TopCategoryWidgetWidget extends StatefulWidget {
  const TopCategoryWidgetWidget({
    super.key,
    required this.title,
    required this.image,
    required this.catID,
    required this.model,
  });

  final String? title;
  final String? image;
  final String? catID;
  final dynamic model;

  @override
  State<TopCategoryWidgetWidget> createState() =>
      _TopCategoryWidgetWidgetState();
}

class _TopCategoryWidgetWidgetState extends State<TopCategoryWidgetWidget> {
  late TopCategoryWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopCategoryWidgetModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('TOP_CATEGORY_WIDGET_Container_48lrma9i_O');
        logFirebaseEvent('Container_navigate_to');

        context.pushNamed(SubCategoriesScreenWidget.routeName);

        logFirebaseEvent('Container_update_app_state');
        FFAppState().categoryName = widget!.title!;
        FFAppState().catID = widget!.catID!;
        safeSetState(() {});
        logFirebaseEvent('Container_custom_action');
        await actions.facebookEventClass(
          widget!.catID!,
          widget!.title!,
          ' ',
          0.0,
          0,
          0.0,
          'category',
          FFAppState().emptyJson,
          'c',
          ' ',
          ' ',
          ' ',
          ' ',
        );
        logFirebaseEvent('Container_google_analytics_event');
        logFirebaseEvent(
          'Navigation',
          parameters: {
            'Navigate To': 'Sub Categories Screen',
          },
        );
      },
      child: Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget!.image!,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.png',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 2.0),
              child: Text(
                valueOrDefault<String>(
                  widget!.title,
                  '\"\"',
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FFAppConstants.blackColor0A0A0A,
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
