import 'package:flutter/material.dart';

class ImputConfig extends StatelessWidget {
  final String label;
  final String hint;
  final Function controle;
  final String inicio;
  ImputConfig({
    Key key,
    this.label,
    this.hint,
    this.controle,
    this.inicio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _contro = TextEditingController(text: inicio);
    return Container(
      child: Column(
        children: [
          TextField(
            controller: _contro,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black54),
            decoration: InputDecoration(
              isDense: true,
              labelText: label,
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            onChanged: controle,
          ),
        ],
      ),
    );
  }
}
