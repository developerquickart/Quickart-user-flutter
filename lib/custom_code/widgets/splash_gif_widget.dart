// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class SplashGifWidget extends StatefulWidget {
  const SplashGifWidget({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    required this.version,
  });

  final double? width;
  final double? height;
  final String imageUrl;
  final String version;

  @override
  State<SplashGifWidget> createState() => _SplashGifWidgetState();
}

class _SplashGifWidgetState extends State<SplashGifWidget> {
 File? _gifFile;

  static const String cacheKey = "quickart_splash";

  @override
  void initState() {
    super.initState();
    _loadGif();
  }

  Future<void> _loadGif() async {
    final cacheManager = DefaultCacheManager();

    // Show old cache immediately
    final cached = await cacheManager.getFileFromCache(cacheKey);

    if (cached != null && mounted) {
      setState(() {
        _gifFile = cached.file;
      });
    }

    // Download latest GIF
    try {
      final url = "${widget.imageUrl}?v=${widget.version}";

      final downloaded = await cacheManager.downloadFile(
        url,
        key: cacheKey,
      );

      if (!mounted) return;

      // Replace old cache with new cache
      setState(() {
        _gifFile = downloaded.file;
      });
    } catch (_) {
      // Ignore download failure
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_gifFile != null) {
      return Image.file(
        _gifFile!,
        width: widget.width ?? double.infinity,
        height: widget.height ?? double.infinity,
        fit: BoxFit.fill,
        gaplessPlayback: true,
      );
    }

    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      fit: BoxFit.fill,
      placeholder: (_, __) => Image.asset(
        "assets/images/QuicKart_New_Final.png",
        fit: BoxFit.fill,
      ),
      errorWidget: (_, __, ___) => Image.asset(
        "assets/images/QuicKart_New_Final.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
