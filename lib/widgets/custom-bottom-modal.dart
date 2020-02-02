import 'dart:math';

import 'package:flutter/material.dart';

class CustomBottomModal extends StatefulWidget {
  final Function onClose;
  final Widget child;

  CustomBottomModal({@required this.onClose, this.child});

  @override
  _CustomBottomModalState createState() => _CustomBottomModalState();
}

class _CustomBottomModalState extends State<CustomBottomModal> {
  double _pageholderHeight;
  bool _isInitialised = false;

  @override
  void initState() {
    _pageholderHeight = 0;
    super.initState();
  }

  void _initialise() async {
    // delay
    await Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _pageholderHeight = min(MediaQuery.of(context).size.height * 0.6, 400);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialised) {
      _initialise();

      setState(() {
        _isInitialised = true;
      });
    }

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _pageholderHeight = 0;
              });
              widget.onClose();
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              decoration: BoxDecoration(color: Colors.black12),
            ),
          ),
        ),
        Positioned(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _pageholderHeight,
            curve: Curves.fastOutSlowIn,
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            width: MediaQuery.of(context).size.width,
            child: widget.child,
          ),
          bottom: 0,
        )
      ],
    );
  }
}
