import 'package:flutter/material.dart';

class MensagemErro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning_amber_rounded,
          color: Colors.amber,
          size: 35,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Falta alguns dados",
          style: TextStyle(fontSize: 30),
        )
      ],
    );
  }
}
