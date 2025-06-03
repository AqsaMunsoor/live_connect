import 'package:flutter/material.dart';
import 'package:live_connect/configs/configs.dart';

enum AppButtonState { filled, outlined }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final AppButtonState state;
  final Widget? leading;
  final Color? color; // <-- new parameter

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.state = AppButtonState.filled,
    this.leading,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isOutlined = state == AppButtonState.outlined;

    final backgroundColor =
        isOutlined ? Colors.white : color ?? AppColors.neutral900;
    final borderColor =
        isOutlined ? color ?? AppColors.white300 : Colors.transparent;
    final textColor = isOutlined ? color ?? AppColors.neutral500 : Colors.white;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 44,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(color: borderColor, width: 1),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 8)],
            Flexible(
              child: Text(
                label,
                style:
                    isOutlined
                        ? AppText.bodyRegular.copyWith(color: textColor)
                        : AppText.bodyMedium.copyWith(color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
