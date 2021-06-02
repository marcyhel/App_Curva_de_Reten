import 'package:flutter/material.dart';

class TextTabela extends StatelessWidget {
  String text;
  TextTabela({
    Key key,
    this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 20,
          ),
          Text(text),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
