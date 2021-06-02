import 'package:flutter/material.dart';

class ContSwitch extends StatelessWidget {
  final Function but_mais;
  final Function but_menos;
  final int cont;
  const ContSwitch({
    Key key,
    this.but_mais,
    this.but_menos,
    this.cont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: but_menos,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(120),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      offset: Offset(3, 4),
                      color: Colors.black26)
                ],
                color: Theme.of(context).accentColor,
              ),
              child: Icon(
                Icons.remove_rounded,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      offset: Offset(3, 4),
                      color: Colors.black26)
                ],
                color: Colors.white),
            child: Text(
              cont.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 20,
          ),
          GestureDetector(
            onTap: but_mais,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(120),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      offset: Offset(3, 4),
                      color: Colors.black26)
                ],
                color: Theme.of(context).accentColor,
              ),
              child: Icon(
                Icons.add_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
