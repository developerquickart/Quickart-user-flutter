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

import 'package:flutter/scheduler.dart';
import 'dart:async';

class SearchAnimationScreen extends StatefulWidget {
  const SearchAnimationScreen({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _SearchAnimationState createState() => _SearchAnimationState();
}

class _SearchAnimationState extends State<SearchAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  int _currentIndex = 0;

  final List<String> _texts = [
    'Farm Fresh Dairy',
    'Fresh Fruits & Vegetables',
    'Fresh Poultry',
    'Fresh Meat',
    'Fresh Curd',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 1), // Start off-screen below
      end: Offset(0, 0), // Slide into place
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    // Set up a periodic timer to change the text every 2.75 seconds
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(Duration(milliseconds: 2750), (Timer timer) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _texts.length;
        });
        _controller.reset();
        _controller.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width ?? 300,
        height: widget.height ?? 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xFFD3D3D3),
            width: 0.5,
          ),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.search,
                color: Color(0xFF57636C),
                size: 24.0,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    'Search for ',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0a0a0a),
                      fontFamily: 'Monteserrat',
                    ),
                  ),
                  Expanded(
                    child: ClipRect(
                      child: SlideTransition(
                        position: _animation,
                        child: Text(
                          _texts[_currentIndex],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF0a0a0a),
                            fontFamily: 'Monteserrat',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
