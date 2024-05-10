import 'package:flutter/material.dart';
import 'package:mathappcd/screens/home.dart';
import 'package:mathappcd/widgets/app_bar.dart';
import 'package:mathappcd/widgets/long_btn.dart';

class SectionA extends StatefulWidget {
  const SectionA({Key? key}) : super(key: key);

  @override
  State<SectionA> createState() => _SectionAState();
}

class _SectionAState extends State<SectionA> {
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
        title: "Section A",
      ),
      body: ListView(
        children: [
          LongBtn(text: "Q1", directTo: HomePage()),
          LongBtn(text: "Q2", directTo: HomePage()),
          LongBtn(text: "Q3", directTo: HomePage()),
          LongBtn(text: "Q4", directTo: HomePage()),
          LongBtn(text: "Q5", directTo: HomePage()),
          LongBtn(text: "Q6", directTo: HomePage()),
          LongBtn(text: "Q7", directTo: HomePage()),
        ],
      ),
    );
  }
}
