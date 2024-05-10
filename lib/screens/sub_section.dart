import 'package:flutter/material.dart';
import 'package:mathappcd/widgets/app_bar.dart';

class SubSection extends StatefulWidget {
  const SubSection({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustAppBar(
        title: "Sub Section",
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
