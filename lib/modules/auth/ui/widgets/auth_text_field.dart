import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isObscurely;
  final TextInputType textInputType;
  final FocusNode focusNode;
  final String? errorText;
  final String? Function(String?)? validator;
  const AuthTextField({
    super.key,
    this.isObscurely = false,
    required this.controller,
    required this.label,
    required this.focusNode,
    required this.validator,
    this.errorText,
    this.textInputType = TextInputType.emailAddress,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  bool isObscure = true;

  Widget? getSuffixIcon() {
    if (widget.isObscurely) {
      return IconButton(
        onPressed: () {
          isObscure = !isObscure;
          setState(() {});
        },
        icon: isObscure
            ? const Icon(
                CupertinoIcons.eye_slash_fill,
              )
            : const Icon(
                CupertinoIcons.eye_fill,
              ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: TextFormField(
        keyboardType: widget.textInputType,
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: widget.isObscurely ? isObscure : false,
        style: const TextStyle(color: Colors.white),
        validator: widget.validator,
        decoration: InputDecoration(
          suffixIcon: getSuffixIcon(),
          labelStyle: TextStyle(
            color: widget.focusNode.hasFocus
                ? const Color(0xffD0FD3E)
                : Colors.white,
          ),
          errorText: widget.errorText,
          labelText: widget.label,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff2C2C2E),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}