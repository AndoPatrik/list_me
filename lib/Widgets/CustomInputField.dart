import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final IconData _icon;
  final bool _secret;
  final String _hintText;
  final Color _color;
  final Function onChanged;

  CustomInputField(this._icon, this._secret, this._hintText, this._color, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom:
              BorderSide(color: _color, width: 0.5, style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 0.0),
            child: Icon(
              _icon,
              color: _color,
            ),
          ),
          new Expanded(
            child: TextField(
              obscureText: _secret,
              onChanged: onChanged,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: _hintText,
                hintStyle: TextStyle(color: _color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
