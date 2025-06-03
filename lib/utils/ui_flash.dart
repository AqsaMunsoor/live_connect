// lib/ui/widgets/ui_flash.dart
import 'package:flutter/material.dart';
import 'package:live_connect/configs/configs.dart'; // Ensure this path is correct
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

enum UiFlashType { success, error, info }

// Renamed UiFlashHelper to _UiFlashContentWidget to indicate it's an internal widget
class _UiFlashContentWidget extends StatelessWidget {
  final String message;
  final UiFlashType type;
  final bool showCloseButton;

  const _UiFlashContentWidget({
    // super.key, // Key is not strictly necessary for internal widgets if not identified
    required this.message,
    required this.type,
    this.showCloseButton = true,
  });

  Color _getBackgroundColor() {
    switch (type) {
      case UiFlashType.success:
        return AppColors.green800; // Ensure AppColors.green800 is defined
      case UiFlashType.error:
        return AppColors.red800; // Ensure AppColors.red800 is defined
      case UiFlashType.info:
        return AppColors.neutral900; // Ensure AppColors.neutral900 is defined
    }
  }

  Color _getForegroundColor() {
    // Assuming all foregrounds are white based on your previous code
    return AppColors.white100; // Ensure AppColors.white100 is defined
  }

  IconData _getIconData() {
    switch (type) {
      case UiFlashType.success:
        return FeatherIcons
            .checkCircle; // Using checkCircle for more prominence
      case UiFlashType.error:
        return FeatherIcons.alertCircle;
      case UiFlashType.info:
        return FeatherIcons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final foregroundColor = _getForegroundColor();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(8.0),
        // Optional: border, if you want it
        // border: Border.all(color: foregroundColor.withOpacity(0.5), width: 1),
      ),
      child: Row(
        children: [
          Icon(_getIconData(), color: foregroundColor, size: 24.0),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              message,
              style: AppText.bodyRegular.copyWith(
                color: foregroundColor,
                fontSize: 15,
              ), // Using AppText for consistency
              softWrap: true,
            ),
          ),
          if (showCloseButton) ...[
            const SizedBox(width: 8.0),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    FeatherIcons.x, // Using FeatherIcons.x for close
                    color: foregroundColor.withOpacity(0.7),
                    size: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// This is now the main class you will interact with
class UiFlash {
  // Private constructor to prevent instantiation
  UiFlash._();

  static void show(
    BuildContext context, {
    required String message,
    required UiFlashType type,
    Duration duration = const Duration(seconds: 4),
    bool showCloseButton = true,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry? margin = const EdgeInsets.fromLTRB(
      16,
      0,
      16,
      24,
    ), // Adjusted margin for floating
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _UiFlashContentWidget(
          // Using the internal widget here
          message: message,
          type: type,
          showCloseButton: showCloseButton,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: duration,
        behavior: behavior,
        margin: margin,
        padding: EdgeInsets.zero,
      ),
    );
  }

  static void success(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
    bool showCloseButton = true,
  }) {
    show(
      context,
      message: message,
      type: UiFlashType.success,
      duration: duration,
      showCloseButton: showCloseButton,
    );
  }

  static void error(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 5),
    bool showCloseButton = true,
  }) {
    show(
      context,
      message: message,
      type: UiFlashType.error,
      duration: duration,
      showCloseButton: showCloseButton,
    );
  }

  static void info(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
    bool showCloseButton = true,
  }) {
    show(
      context,
      message: message,
      type: UiFlashType.info,
      duration: duration,
      showCloseButton: showCloseButton,
    );
  }
}
