import 'package:flutter/material.dart';
import 'package:mathappcd/constants/widgets_constants.dart';

class SquareBtn extends StatefulWidget {
  final String text;
  final Widget directTo;
  final bool isAvailable;

  const SquareBtn({
    Key? key,
    required this.text,
    required this.directTo,
    this.isAvailable = false,
  }) : super(key: key);

  @override
  State<SquareBtn> createState() => _SquareBtnState();
}

class _SquareBtnState extends State<SquareBtn> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.isAvailable
          ? () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => widget.directTo,
                    transitionsBuilder: (_, a, __, c) =>
                        ScaleTransition(scale: a, child: c),
                    transitionDuration: const Duration(milliseconds: 200)),
              );
            }
          : null,
      onLongPress: () {},
      onHover: (hover) {},
      onFocusChange: (changed) {},
      style: ButtonStyle(
          backgroundColor: widget.isAvailable
              ? const MaterialStatePropertyAll(WidgetConstants.sqrBtnBgColor)
              : const MaterialStatePropertyAll(
                  WidgetConstants.sqrBtnBgColorDisabled),
          foregroundColor:
              const MaterialStatePropertyAll(WidgetConstants.sqrBtnFgColor),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(WidgetConstants.sqrBtnRadius))))),
      child: Stack(
        children: [
          Visibility(
            visible: !widget.isAvailable,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.lock,
                size: 50,
                color: Colors.grey,
              ),
            ),
          ),
          Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                color: WidgetConstants.sqrBtnTxtColor,
                fontSize: WidgetConstants.sqrBtnTxtSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
