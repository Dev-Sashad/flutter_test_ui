import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_ui/constants/colors.dart';
import 'package:flutter_test_ui/constants/size_config.dart';

class CustomTextFormField extends StatelessWidget {
  final TextStyle textFormFieldStyle;
  final TextStyle labelTextStyle;
  final TextAlign textAlign;
  final BorderStyle borderStyle;
  final double borderRadius;
  final double borderWidth;
  final double contentPaddingHorizontal;
  final double contentPaddingVertical;
  final bool filled;
  final bool obscured;
  final TextInputType textInputType;
  final ValueChanged<String> onChanged;
  final int maxLength;
  final bool maxLengthEnforced;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController controller;
  final String label;
  final bool readOnly, enabled;

  CustomTextFormField(
      {this.textFormFieldStyle = const TextStyle(
          fontSize: 13,
          color: AppColors.primaryColor,
          letterSpacing: 1,
          fontWeight: FontWeight.bold),
      this.labelTextStyle = const TextStyle(
          fontSize: 10,
          letterSpacing: 3,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold),
      this.label,
      this.textAlign = TextAlign.start,
      this.borderStyle = BorderStyle.none,
      this.borderRadius = 10,
      this.borderWidth = 1.5,
      this.contentPaddingHorizontal = 4,
      this.contentPaddingVertical = 0,
      this.filled = true,
      this.obscured = false,
      this.textInputType,
      this.enabled,
      this.readOnly,
      this.onChanged,
      this.maxLength,
      this.maxLengthEnforced = false,
      this.validator,
      this.inputFormatters,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kwidth(3, context)),
      //child: Column(
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      // children: [
      //   if (label != null)
      //     Container(
      //       child: Text(label, style: labelTextStyle),
      //       width: kwidth(100, context),
      //       padding: EdgeInsets.fromLTRB(
      //           kwidth(contentPaddingHorizontal, context), 5, 0, 0),
      //       decoration: BoxDecoration(
      //           color: Colors.green[100],
      //           borderRadius: BorderRadius.only(
      //               topLeft: Radius.circular(borderRadius),
      //               topRight: Radius.circular(borderRadius))),
      //     ),
      //   Container(
      // height: kheight(5, context),
      child: TextFormField(
        readOnly: readOnly ?? false,
        enabled: enabled,
        controller: controller,
        style: textFormFieldStyle,
        keyboardType: textInputType,
        onChanged: onChanged,
        maxLength: maxLength,
        // maxLengthEnforcement: MaxLengthEnforcement.none,
        validator: validator,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: labelTextStyle,
            border: OutlineInputBorder(
              // borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(borderRadius),
              //     bottomRight: Radius.circular(borderRadius)),
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(borderRadius),
              //     bottomRight: Radius.circular(borderRadius)),
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(borderRadius),
              //     bottomRight: Radius.circular(borderRadius)),
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(borderRadius),
              //     bottomRight: Radius.circular(borderRadius)),
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: kwidth(contentPaddingHorizontal, context),
            ),
            filled: filled,
            fillColor: Colors.green[100],
            errorStyle: TextStyle(
              fontSize: 10,
              color: Colors.red,
            )),
        obscureText: obscured,
      ),
      //     ),
      //   ],
      // ),
    );
  }
}
