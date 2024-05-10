import 'package:flutter/material.dart';
import 'package:mathappcd/constants/widgets_constants.dart';

class SquareBtn extends StatefulWidget {
  final String text;
  final Widget directTo;

  const SquareBtn({
    Key? key,
    required this.text,
    required this.directTo,
  }) : super(key: key);

  @override
  State<SquareBtn> createState() => _SquareBtnState();
}

class _SquareBtnState extends State<SquareBtn> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => widget.directTo,
              transitionsBuilder: (_, a, __, c) =>
                  ScaleTransition(scale: a, child: c),
              transitionDuration: const Duration(milliseconds: 200)),
        );
      },
      onLongPress: () {},
      onHover: (hover) {},
      onFocusChange: (changed) {},
      style: const ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(WidgetConstants.sqrBtnBgColor),
          foregroundColor:
              MaterialStatePropertyAll(WidgetConstants.sqrBtnFgColor),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(WidgetConstants.sqrBtnRadius))))),
      child: Text(
        widget.text,
        style: TextStyle(
            color: WidgetConstants.sqrBtnTxtColor,
            fontSize: WidgetConstants.sqrBtnTxtSize),
      ),
    );
  }
}
