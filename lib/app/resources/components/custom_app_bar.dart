import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:updatingnewz/app/resources/assets/fonts/app_fonts.dart';
import 'package:updatingnewz/app/resources/colors/colors.dart';
import 'package:updatingnewz/app/screens/home_screen;.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    this.onLeadingTap,
    this.onTrailingTap,
  });

  final String title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onTrailingTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(


      backgroundColor: AppColors.white,
      title: Text(
        title,
        style: TextStyle(
            fontFamily: AppFonts.poppins,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp),
      ),
      centerTitle: true,
      leading: GestureDetector(onTap: onLeadingTap, child: leading),
      actions: [
        if (trailing != null) ...[
          GestureDetector(onTap: onTrailingTap, child: trailing!),
          const SizedBox(width: 10),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
