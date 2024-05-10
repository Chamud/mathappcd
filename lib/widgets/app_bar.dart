import 'package:flutter/material.dart';
import 'package:mathappcd/constants/widgets_constants.dart';

class CustAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CustAppBar({Key? key, required this.title}) : super(key: key);

  @override
  CustAppBarState createState() => CustAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustAppBarState extends State<CustAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: WidgetConstants.appBarBgClr,
    );
  }
}
