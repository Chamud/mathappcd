import 'package:flutter/material.dart';
import 'package:mathappcd/widgets/app_bar.dart';

class SectionB extends StatefulWidget {
  const SectionB({Key? key}) : super(key: key);

  @override
  State<SectionB> createState() => _SectionBState();
}

class _SectionBState extends State<SectionB> {
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
      appBar: const CustAppBar(
        title: "Section B",
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
