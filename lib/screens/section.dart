import 'package:flutter/material.dart';
import 'package:mathappcd/models/section.dart';
import 'package:mathappcd/screens/sub_section.dart';
import 'package:mathappcd/widgets/app_bar.dart';
import 'package:mathappcd/widgets/long_btn.dart';

class Section extends StatefulWidget {
  final List<ModelSection> items;
  final String heading;

  const Section({Key? key, required this.heading, required this.items})
      : super(key: key);

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> getListItems(List<ModelSection> sections) {
      List<LongBtn> btns = [];
      for (var each in sections) {
        LongBtn btn = LongBtn(
            number: each.number,
            text: each.name,
            directTo: SubSection(
              items: each.subsections,
              title: "${each.number}  -  ${each.name}",
            ));
        btns.add(btn);
      }
      return btns;
    }

    return Scaffold(
      appBar: CustAppBar(
        title: widget.heading,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: getListItems(widget.items),
        ),
      ),
    );
  }
}
