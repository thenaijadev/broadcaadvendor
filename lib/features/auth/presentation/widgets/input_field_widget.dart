import 'package:broadcaadvendor/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget(
      {super.key,
      this.label = "",
      required this.hintColor,
      this.initialValue,
      required this.hintText,
      this.hintSize = 14,
      required this.onChanged,
      this.validator,
      required this.textFieldkey,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixicon,
      // this.padding = const EdgeInsets.only(bottom: 10),
      this.onTap,
      this.maxLines = 1,
      this.fontWeight = FontWeight.w600,
      this.labelFontSize = 16,
      this.enabledBorderRadius = 30,
      this.verticalContentPadding = 0,
      this.controller,
      this.horizontalContentPadding = 25});
  final String label;
  final String hintText;
  final double hintSize;
  final void Function(String?) onChanged;
  final void Function()? onTap;

  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState> textFieldkey;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixicon;
  final String? initialValue;
  // final EdgeInsetsGeometry padding;
  final int? maxLines;
  final double enabledBorderRadius;
  final double verticalContentPadding;
  final FontWeight fontWeight;
  final Color hintColor;
  final double labelFontSize;
  final TextEditingController? controller;
  final double horizontalContentPadding;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextWidget(
          text: label,
          color: Colors.black,
          fontWeight: fontWeight,
          fontSize: labelFontSize,
        ),
        TextFormField(
          controller: controller,
          onTap: onTap,
          key: textFieldkey,
          initialValue: initialValue,
          onChanged: onChanged,
          maxLines: maxLines,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: prefixicon,
            filled: true,
            fillColor: Colors.white,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(
                color: hintColor,
                fontSize: hintSize,
                fontWeight: FontWeight.w300,
                fontFamily: 'Neue Plak'),
            contentPadding: EdgeInsets.symmetric(
                horizontal: horizontalContentPadding,
                vertical: verticalContentPadding),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 0, 0),
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 0, 0),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(0xff030E4F),
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xff030E4F), width: 0.5),
              borderRadius: BorderRadius.circular(enabledBorderRadius),
            ),
            hintText: hintText,
          ),
        ),
      ]),
    );
  }
}
