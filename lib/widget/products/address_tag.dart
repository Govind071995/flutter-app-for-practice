import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  final String address; 
  AddressTag(this.address);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
              child: Text(address)),
        );
  }
}