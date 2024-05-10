import 'package:flutter/material.dart';
import 'package:mathappcd/constants/widgets_constants.dart';
import 'package:mathappcd/screens/sectionA.dart';
import 'package:mathappcd/screens/sectionB.dart';
import 'package:mathappcd/widgets/app_bar.dart';
import 'package:mathappcd/widgets/square_btn.dart';

extension ContextExtension on BuildContext {
  bool get isSmallScreen => MediaQuery.of(this).size.width < 600;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustAppBar(
        title: "App",
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height <
                    WidgetConstants.bannerMinHeight + 5
                ? WidgetConstants.bannerMinHeight + 100
                : MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                        minHeight: WidgetConstants.bannerMinHeight),
                    color: Colors.grey[200],
                    child: const Center(
                        child: Column(
                      children: [
                        Text("Graph"),
                      ],
                    )),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(WidgetConstants.sqrBtnPadding),
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: context.isSmallScreen ? 2 : 4,
                  children: const [
                    SquareBtn(
                      text: "A",
                      directTo: SectionA(),
                    ),
                    SquareBtn(
                      text: "B",
                      directTo: SectionB(),
                    ),
                    SquareBtn(
                      text: "C",
                      directTo: SectionA(),
                    ),
                    SquareBtn(
                      text: "D",
                      directTo: SectionB(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
