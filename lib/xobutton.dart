import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class xobutton extends StatelessWidget {
  final String symbol;
  final Function onclick;
  final int index;
  xobutton({required this.symbol,required this.onclick,required this.index});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
          onTap: (){
            onclick(index);

          },
          child: Container(
              padding: EdgeInsets.all(18),
              child: Center(child: Text(symbol,style:TextStyle(color: symbol=='o'?Colors.green:Colors.red,fontSize: 50,fontWeight: FontWeight.bold),)),),
        )

    );
  }
}