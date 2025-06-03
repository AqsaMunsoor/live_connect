import 'package:flutter/material.dart';
import 'package:live_connect/configs/configs.dart';
import 'package:live_connect/router/routes.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

part '_data.dart';
part '_model.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = context.currentPath;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white900,
        border: Border(top: BorderSide(width: 1, color: AppColors.white300)),
        boxShadow: [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 30,
            offset: Offset(2, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children:
            _tabs.map((tab) {
              final isActive = tab.path == currentPath;
              final color =
                  isActive ? AppColors.neutral900 : AppColors.neutral300;

              return Expanded(
                child: InkWell(
                  onTap: () {
                    if (tab.path == currentPath) return;
                    tab.path.pushReplace(context);
                  },
                  child: Column(
                    children: [
                      Space.y.t16,
                      Icon(tab.icon, color: color, size: 24),
                      Space.y.t16,
                    ],
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
