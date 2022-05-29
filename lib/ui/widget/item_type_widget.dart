import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTypeWidget extends StatelessWidget {
  String type;
  ItemTypeWidget({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5,right: 10),
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        type,
        style: TextStyle(

          color: Colors.white,
        ),
      ),
    );
  }
}
