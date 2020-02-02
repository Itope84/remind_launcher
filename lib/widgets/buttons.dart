import 'package:flutter/material.dart';

class StyledBlockButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Color color, disabledColor;

  StyledBlockButton(
      {this.child, this.onPressed, this.color, this.disabledColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: RaisedButton(
              child: child,
              onPressed: onPressed,
              color: color != null ? color : Theme.of(context).primaryColor,
              textColor: Colors.white,
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              elevation: 1.0,
              disabledColor: disabledColor != null
                  ? disabledColor
                  : Theme.of(context).accentColor.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
