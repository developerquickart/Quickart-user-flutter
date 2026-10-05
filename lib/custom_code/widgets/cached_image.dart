// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cached_network_image/cached_network_image.dart';

class CachedImage extends StatefulWidget {
  const CachedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
  });

  final double? width;
  final double? height;
  final String imageUrl;

  @override
  State<CachedImage> createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/bg-banner.jpg',
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
      ),
      width: widget.width,
      height: widget.height,
      fit: BoxFit.cover,
    );
  }
}
