import 'package:flutter/material.dart';
import 'package:mathappcd/widgets/app_bar.dart';

class Section extends StatefulWidget {
  final List<Widget> items;
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
    return Scaffold(
      appBar: CustAppBar(
        title: widget.heading,
      ),
      body: ListView(
        children: widget.items,
      ),
    );
  }
}
