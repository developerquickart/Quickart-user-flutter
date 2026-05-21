// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';

const String _kLocationServicesDisabledMessage =
    'Location services are disabled.';
const String _kPermissionDeniedMessage = 'Permission denied.';
const String _kPermissionDeniedForeverMessage = 'Permission denied forever.';
const String _kPermissionGrantedMessage = 'Permission granted.';

final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
final List<_PositionItem> _positionItems = <_PositionItem>[];

Future currentLocation() async {
  // Add your function code here!
  _getCurrentPosition();
}

Future<void> _getCurrentPosition() async {
  final hasPermission = await _handlePermission();

  if (!hasPermission) {
    return;
  }

  final position = await _geolocatorPlatform.getCurrentPosition();
  FFAppState().gLatitude = position.latitude;
  FFAppState().gLongitude = position.longitude;
  _updatePositionList(
    _PositionItemType.position,
    position.toString(),
  );
}

Future<bool> _handlePermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
  if (!serviceEnabled) {
    _updatePositionList(
      _PositionItemType.log,
      _kLocationServicesDisabledMessage,
    );

    return false;
  }

  permission = await _geolocatorPlatform.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await _geolocatorPlatform.requestPermission();
    if (permission == LocationPermission.denied) {
      _updatePositionList(
        _PositionItemType.log,
        _kPermissionDeniedMessage,
      );

      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    _updatePositionList(
      _PositionItemType.log,
      _kPermissionDeniedForeverMessage,
    );

    return false;
  }
  _updatePositionList(
    _PositionItemType.log,
    _kPermissionGrantedMessage,
  );
  return true;
}

void _updatePositionList(_PositionItemType type, String displayValue) {
  _positionItems.add(_PositionItem(type, displayValue));
}

enum _PositionItemType {
  log,
  position,
}

class _PositionItem {
  _PositionItem(this.type, this.displayValue);

  final _PositionItemType type;
  final String displayValue;
}
