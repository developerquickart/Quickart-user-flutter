import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rating_bar_component_model.dart';
export 'rating_bar_component_model.dart';

class RatingBarComponentWidget extends StatefulWidget {
  const RatingBarComponentWidget({super.key});

  @override
  State<RatingBarComponentWidget> createState() =>
      _RatingBarComponentWidgetState();
}

class _RatingBarComponentWidgetState extends State<RatingBarComponentWidget> {
  late RatingBarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingBarComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: RatingBar.builder(
        onRatingUpdate: (newValue) =>
            safeSetState(() => _model.ratingBarProductValue = newValue),
        itemBuilder: (context, index) => Icon(
          Icons.star_rounded,
          color: FFAppConstants.yellowColor,
        ),
        direction: Axis.horizontal,
        initialRating: _model.ratingBarProductValue ??= 0.0,
        unratedColor: Color(0xFFDBDADA),
        itemCount: 5,
        itemPadding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        itemSize: 35.0,
        glowColor: FFAppConstants.yellowColor,
      ),
    );
  }
}
