import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/theme/app_theme.dart';

class SaveIcon extends StatefulWidget {
  @override
  _SaveIconState createState() => _SaveIconState();
}

class _SaveIconState extends State<SaveIcon> {
  Color _iconColor = AppTheme.lightSecondaryColor;

  void _changeColor() {
    setState(() {
      _iconColor = AppTheme.lightPrimaryColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _changeColor();
      },
      icon: Icon(
        Icons.save,
        color: _iconColor,
      ),
    );
  }
}
