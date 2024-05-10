import 'package:flutter/material.dart';
import 'package:mathappcd/constants/widgets_constants.dart';

class LongBtn extends StatefulWidget {
  final String text;
  final Widget directTo;

  const LongBtn({
    Key? key,
    required this.text,
    required this.directTo,
  }) : super(key: key);

  @override
  State<LongBtn> createState() => _LongBtnState();
}

class _LongBtnState extends State<LongBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: WidgetConstants.lngBtnHeight,
        padding: const EdgeInsets.all(WidgetConstants.lngBtnPadding),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => widget.directTo,
                transitionsBuilder: (_, a, __, c) => SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(2.0, 0.0),
                      end: Offset.zero,
                    ).animate(a),
                    child: c),
              ),
            );
          },
          onLongPress: () {},
          onHover: (hover) {},
          onFocusChange: (changed) {},
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(WidgetConstants.lngBtnBgColor),
              foregroundColor:
                  MaterialStatePropertyAll(WidgetConstants.lngBtnFgColor),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(WidgetConstants.lngBtnRadius))))),
          child: Text(
            widget.text,
            style: const TextStyle(
                color: WidgetConstants.lngBtnTxtColor,
                fontSize: WidgetConstants.lngBtnTxtSize),
          ),
        ));
  }
}
