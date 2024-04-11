import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? errorText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? autofocus;
  final bool? readOnly;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final Function()? onTap;
  final ValueChanged<String>? onSubmitted;
  const AppTextFormField(
      {this.controller,
      this.hintText,
      this.errorText,
      this.obscureText,
      this.keyboardType,
      this.textInputAction,
      this.maxLength,
      this.prefixIcon,
      this.suffixIcon,
      this.autofocus,
      this.readOnly,
      this.onEditingComplete,
      this.onChanged,
      this.onTap,
      this.onSubmitted,
      Key? key})
      : super(key: key);

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: colorNeutralGray40),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: TextField(
        readOnly: widget.readOnly ?? false,
        focusNode: _focusNode,
        controller: widget.controller,
        style: styleTextField,
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        autofocus: widget.autofocus ?? false,
        autocorrect: false,
        maxLines: widget.keyboardType == TextInputType.multiline ? 4 : 1,
        onEditingComplete: widget.onEditingComplete,
        onChanged: widget.onChanged,
        onSubmitted: (text) {
          // widget.onSubmitted!(text);
          _focusNode.unfocus();
        },
        onTap: widget.onTap,
        decoration: decorTextField.copyWith(
          hintText: widget.hintText,
          errorText: widget.errorText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
