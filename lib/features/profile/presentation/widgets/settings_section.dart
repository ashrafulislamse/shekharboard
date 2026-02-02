import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Settings item model
class SettingsItem {
  final String id;
  final IconData icon;
  final String label;
  final Color iconBgColor;
  final Color iconColor;
  final bool isToggle;
  final bool? toggleValue;
  final String? subtitle;
  final bool isLocked;
  final bool isPremium;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onToggleChanged;

  const SettingsItem({
    required this.id,
    required this.icon,
    required this.label,
    required this.iconBgColor,
    required this.iconColor,
    this.isToggle = false,
    this.toggleValue,
    this.subtitle,
    this.isLocked = false,
    this.isPremium = false,
    this.onTap,
    this.onToggleChanged,
  });
}

/// Settings section with list tiles
class SettingsSection extends StatelessWidget {
  final List<SettingsItem> items;

  const SettingsSection({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'সেটিংস',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          
          SizedBox(height: 16.h),
          
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: Colors.grey.shade50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Column(
                children: items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isLast = index == items.length - 1;
                  
                  return _SettingsTile(
                    item: item,
                    showDivider: !isLast && !item.isPremium,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatefulWidget {
  final SettingsItem item;
  final bool showDivider;

  const _SettingsTile({
    required this.item,
    this.showDivider = true,
  });

  @override
  State<_SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<_SettingsTile> {
  late bool _toggleValue;

  @override
  void initState() {
    super.initState();
    _toggleValue = widget.item.toggleValue ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.item.isToggle
              ? null
              : () {
                  HapticFeedback.lightImpact();
                  widget.item.onTap?.call();
                },
          child: Container(
            padding: EdgeInsets.all(16.w),
            color: widget.item.isPremium
                ? const Color(0xFFF3E5F5) // purple-50
                : Colors.transparent,
            child: Row(
              children: [
                // Icon
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: widget.item.iconBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    widget.item.icon,
                    size: 20.sp,
                    color: widget.item.iconColor,
                  ),
                ),
                
                SizedBox(width: 12.w),
                
                // Label
                Expanded(
                  child: Text(
                    widget.item.label,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: widget.item.isPremium
                          ? const Color(0xFF4A148C) // purple-900
                          : Colors.grey.shade700,
                    ),
                  ),
                ),
                
                // Trailing
                _buildTrailing(),
              ],
            ),
          ),
        ),
        if (widget.showDivider)
          Divider(
            height: 1,
            indent: 68.w,
            color: Colors.grey.shade100,
          ),
      ],
    );
  }

  Widget _buildTrailing() {
    if (widget.item.isToggle) {
      return GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          setState(() {
            _toggleValue = !_toggleValue;
          });
          widget.item.onToggleChanged?.call(_toggleValue);
        },
        child: Container(
          width: 48.w,
          height: 28.h,
          decoration: BoxDecoration(
            color: _toggleValue
                ? const Color(0xFF7FBA96)
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            alignment:
                _toggleValue ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.all(2.w),
              width: 24.w,
              height: 24.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      );
    }

    if (widget.item.isLocked) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.item.subtitle != null)
            Text(
              widget.item.subtitle!,
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade400,
              ),
            ),
          SizedBox(width: 8.w),
          Icon(
            Icons.lock_rounded,
            size: 16.sp,
            color: Colors.grey.shade300,
          ),
        ],
      );
    }

    if (widget.item.subtitle != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.item.subtitle!,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          SizedBox(width: 4.w),
          Icon(
            Icons.chevron_right_rounded,
            size: 18.sp,
            color: AppColors.primary,
          ),
        ],
      );
    }

    return Icon(
      Icons.chevron_right_rounded,
      size: 20.sp,
      color: widget.item.isPremium
          ? const Color(0xFF9575CD) // purple-400
          : Colors.grey.shade400,
    );
  }
}
