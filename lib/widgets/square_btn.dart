import 'package:flutter/material.dart';
import 'package:mathappcd/constants/widgets_constants.dart';

class SquareBtn extends StatefulWidget {
  final String text;

  const SquareBtn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<SquareBtn> createState() => _SquareBtnState();
}

class _SquareBtnState extends State<SquareBtn> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
