import 'package:flutter/material.dart';
import 'package:task_management/utls/textstyle.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.color ,
    required this.onTap,
    this.alinment = Alignment.center, this.borderColor,
  }) : super(key: key);
  // final Widget content;
  final Color? color;
  final Color? borderColor;
  final VoidCallback onTap;
  final String text;
  final AlignmentGeometry alinment;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      height: 56,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28),side: BorderSide(width: 1,color: borderColor??const Color(0xff246BFD))),
      color: color?? const Color(0xff246BFD),
      onPressed: onTap,
      child: Align(alignment: alinment, child: SubTitleText(text)),
    );
  }
}
