import 'package:flutter/material.dart';

class dynamicWidget extends StatelessWidget {
  TextEditingController product = TextEditingController();
  TextEditingController price = TextEditingController();

  dynamicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(2.0),
      child:ListBody(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 200,
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: TextFormField(
                  controller: product,
                  decoration: const InputDecoration(
                      labelText: 'Particular',
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                width: 100,
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: TextFormField(
                  controller: price,
                  decoration: const InputDecoration(
                      labelText: 'Cost',
                      border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}