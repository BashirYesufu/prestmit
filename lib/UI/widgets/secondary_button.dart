import 'package:flutter/material.dart';

import '../../constants/text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final String? label;
  final Color? backgroundColor;
  final Color? textColor;
  final Color borderColor;
  final Function()? onTap;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const SecondaryButton({
    this.onTap,
    this.label,
    this.textColor,
    this.backgroundColor,
    this.borderColor = Colors.black,
    this.child,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Material(
          color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                color: borderColor,
                width: 1.0,
              )
          ),
          child: MaterialButton(
            splashColor: backgroundColor?.withOpacity(0.5) ?? Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
            onPressed: onTap,
            minWidth: double.infinity,
            height: 48,
            child:  child ?? Text(
                label ?? '',
                style: AppTextStyles.generic(size: 14, weight: FontWeight.w500, color: textColor ?? Colors.black)
            ),
          ),
        ),
      ),
    );
  }
}
