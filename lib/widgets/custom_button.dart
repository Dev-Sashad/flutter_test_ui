import 'package:flutter/material.dart';
import 'package:flutter_test_ui/constants/colors.dart';
import 'package:flutter_test_ui/constants/size_config.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    @required this.title,
    this.onPressed,
    this.width,
    this.online = true,
    this.height = 5.0,
    this.elevation = 2.0,
    this.margin = 10,
    this.borderRadius = 8.0,
    this.color = AppColors.primaryColor,
    this.textStyle = const TextStyle(
      color: AppColors.white,
      letterSpacing: 5,
      fontWeight: FontWeight.w700,
      fontSize: 15.0,
    ),
  });

  final VoidCallback onPressed;
  final double width;
  final double height;
  final double elevation;
  final double margin;
  final double borderRadius;
  final String title;
  final Color color;
  final bool online;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: online ? onPressed : () {},
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: kheight(margin, context)),
        height: kheight(height, context),
        width: width ??
            kwidth(100, context), // If width is null, use size of screen
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                  color: Colors.green[200],
                  offset: Offset(5.0, 5.0),
                  blurRadius: 10,
                  spreadRadius: 4)
            ],
            color: color),
        child: Center(
          child: Text(
            title,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
