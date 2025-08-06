import 'package:flutter/material.dart';
import 'package:fitquest/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final VoidCallback? onToggleObscure;
  final bool hasSuffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onToggleObscure,
    this.hasSuffixIcon = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: widget.controller,
      cursorColor: AppColors.primaryGreen,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: _isFocused ? AppColors.primaryGreen : AppColors.gray,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryGreen, width: 2),
        ),
        filled: true,
        fillColor: AppColors.white,
        suffixIcon: widget.hasSuffixIcon
            ? IconButton(
                icon: Icon(
                  widget.obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: widget.onToggleObscure,
              )
            : null,
      ),
    );
  }
}
