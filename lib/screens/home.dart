import 'package:flutter/material.dart';
import 'package:mathappcd/constants/widgets_constants.dart';
import 'package:mathappcd/screens/sectionA.dart';
import 'package:mathappcd/screens/sectionB.dart';
import 'package:mathappcd/widgets/app_bar.dart';
import 'package:mathappcd/widgets/square_btn.dart';

extension ContextExtension on BuildContext {
  bool get isSmallWidth =>
      MediaQuery.of(this).size.width < WidgetConstants.smallScreenWidthSize;
  bool get isSmallheight =>
      MediaQuery.of(this).size.height <
      WidgetConstants.bannerHeight + WidgetConstants.homeBtnsMaxHeight;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget getBanner() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(
            maxHeight: WidgetConstants.bannerHeight,
            minHeight: WidgetConstants.bannerHeight),
        child: const Center(
          child: Text(
            "Graph or something to show the progress",
          ),
        ),
      ),
    );
  }

  Widget getHomeButtons() {
    return Container(
      constraints: const BoxConstraints(
          minHeight: WidgetConstants.homeBtnsMinHeight,
          maxHeight: WidgetConstants.homeBtnsMaxHeight),
      child: Center(
        child: GridView.count(
          shrinkWrap: true,
          padding: const EdgeInsets.all(WidgetConstants.sqrBtnPadding),
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: context.isSmallWidth ? 2 : 4,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustAppBar(
        title: "App",
      ),
      body: context.isSmallheight
          ? ListView(
              children: [
                getBanner(),
                getHomeButtons(),
              ],
            )
          : Column(
              children: [
                Expanded(child: getBanner()),
                getHomeButtons(),
              ],
            ),
    );
  }
}
