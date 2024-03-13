import 'package:fgitapp/utils/app_colors_constant.dart';
import 'package:fgitapp/utils/app_icons.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? showBackButton;
  final Widget? child;
  final Widget? leadingWidget;
  final List<Widget>? trailing;
  final double? height;
  final double? elevation;
  final Color? colors;
  final Widget? title;
  final String? navigate;
  final Widget? bottom;
  final Color? appBarColor;
  final bool? centerTitle;

  const CustomAppBar(
      {Key? key,
      this.title,
      this.showBackButton,
      this.child,
      this.leadingWidget,
      this.trailing,
      this.height,
      this.elevation,
      this.colors,
      this.navigate,
      this.bottom,
      this.appBarColor,
      this.centerTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
      elevation: elevation ?? .5,
      backgroundColor: colors ?? AppColors.appThemeColor,
      centerTitle: centerTitle ?? false,
      title: title ?? const Text(''),
      leading: showBackButton == false
          ? leadingWidget
          : Builder(
              builder: (BuildContext context) => IconButton(
                  onPressed: () {
                    navigate != null
                        ? Navigator.pushNamed(context, navigate!)
                        : Navigator.pop(context);
                  },
                  icon: leadingWidget ?? AppIcons.backButton),
            ),
      actions: trailing ?? [const Text('')],
      bottom: bottom == null
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: bottom ?? const Text('')),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
