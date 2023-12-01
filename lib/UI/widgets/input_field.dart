import 'package:flutter/material.dart';

import '../../constants/text_styles.dart';

class InputField extends StatefulWidget {
  const InputField({
    this.controller,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.readOnly = false,
    this.isCurrency = false,
    this.maxLength,
    this.hintText,
    this.onCard = false,
    this.enabled = true,
    this.canClear = false,
    this.prefixText,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.backgroundColor,
    this.borderColor,
    this.padding,
    this.maxLines = 1,
    Key? key
  }) : super(key: key);

  final TextEditingController? controller;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final bool readOnly;
  final bool isCurrency;
  final bool onCard;
  final bool canClear;
  final bool enabled;
  final int? maxLength;
  final String? hintText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextInputType keyboardType;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final int maxLines;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool get isDark  => Theme.of(context).brightness == Brightness.dark;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label.isNotEmpty ? Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
              widget.label,
              style: Theme.of(context).textTheme.titleMedium
          ),
        ) :  SizedBox(),
        Container(
          height: 48 * widget.maxLines.toDouble(),
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: widget.borderColor ?? Colors.black,
              )
          ),
          child: Padding(
            padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              enabled: widget.enabled,
              maxLines: widget.maxLines,
              controller: widget.controller,
              style: Theme.of(context).textTheme.titleMedium,
              onChanged: widget.onChanged,
              onEditingComplete: widget.onEditingComplete,
              onTapOutside: (PointerDownEvent event){
                FocusManager.instance.primaryFocus?.unfocus();
              },
              readOnly: widget.readOnly,
              keyboardType: widget.keyboardType,
              textCapitalization: TextCapitalization.none,
              cursorColor: Colors.grey,
              maxLength: widget.maxLength,

              decoration: InputDecoration(
                counterText: '',
                hintText: widget.hintText ?? widget.label,
                prefixText: widget.prefixText,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                hintStyle: AppTextStyles.generic(size: 14),
                filled: false,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
