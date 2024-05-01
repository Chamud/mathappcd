import 'package:flutter/material.dart';
import 'package:mathappcd/constants/widgets_constants.dart';
import 'package:mathappcd/widgets/square_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('MathAppCD'),
        backgroundColor: WidgetConstants.shadowClr,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: Center(
              child: Text("Graph or somehting to show progress??"),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            padding: EdgeInsets.all(WidgetConstants.sqrBtnPadding),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            children: [
              SquareBtn(text: "Continue"),
              SquareBtn(text: "New Quiz"),
              SquareBtn(text: "Section A"),
              SquareBtn(text: "Section B"),
            ],
          ),
        ],
      ),
    );
  }
}
