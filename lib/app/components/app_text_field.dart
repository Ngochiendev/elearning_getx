import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
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

  const AppTextField(
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
      Key? key})
      : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && widget.onEditingComplete != null) {
        widget.onEditingComplete!();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      decoration: BoxDecoration(boxShadow: _focusNode.hasFocus ? boxShadowFocus : boxShadow),
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
        // onEditingComplete: widget.onEditingComplete,
        onChanged: widget.onChanged,
        onSubmitted: (text) {
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

class BaseTextField extends StatefulWidget {
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

  const BaseTextField(
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
      Key? key})
      : super(key: key);

  @override
  _BaseTextFieldTextFieldState createState() => _BaseTextFieldTextFieldState();
}

class _BaseTextFieldTextFieldState extends State<BaseTextField> {
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
        color: colorNeutralGray5,
        borderRadius: new BorderRadius.circular(10.0),
        border: Border.all(width: 1, color: Color(0xFFD1D1D4)),
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
          _focusNode.unfocus();
        },
        onTap: widget.onTap,
        decoration: decorTextField.copyWith(
          fillColor: colorNeutralGray5,
          hintText: widget.hintText,
          errorText: widget.errorText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
