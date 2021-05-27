import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {

  ReusableRow({@required this.title , @required this.value}) ;
  final String title ;
  final String value ;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text( title, style: TextStyle(fontSize: 15),),
          Text(value)
        ],
      ),
    );
  }
}
