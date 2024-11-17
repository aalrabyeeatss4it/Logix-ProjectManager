import 'package:projectmanagers/Constants/Constants.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key, required this.text,  this.textStyle,
  }) : super(key: key);
  final String text;
  final TextStyle ?textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(text,style:textStyle?? Theme.of(context).textTheme.titleMedium!.copyWith(color:kColorsBlack),textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,maxLines: 3,);
  }
}