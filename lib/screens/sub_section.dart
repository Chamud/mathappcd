import 'package:flutter/material.dart';
import 'package:mathappcd/models/subsection.dart';
import 'package:mathappcd/screens/home.dart';
import 'package:mathappcd/widgets/app_bar.dart';
import 'package:mathappcd/widgets/long_btn.dart';

class SubSection extends StatefulWidget {
  final String title;
  final List<ModelSubSection> items;

  const SubSection({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  State<SubSection> createState() => _SubSectionState();
}

class _SubSectionState extends State<SubSection> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  List<Widget> getListItems(List<ModelSubSection> sections) {
    List<LongBtn> btns = [];
    for (var each in sections) {
      LongBtn btn = LongBtn(
        number: each.number,
        text: each.name,
        directTo: HomePage(),
        // directTo: QuestionSet(
        //   items: each.questionSets,
        //   title: "${each.number} ${each.name}",)
      );
      btns.add(btn);
    }
    return btns;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustAppBar(
        title: widget.title,
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
