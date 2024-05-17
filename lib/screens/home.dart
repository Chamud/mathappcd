import 'package:flutter/material.dart';
import 'package:mathappcd/constants/string_constants.dart';
import 'package:mathappcd/constants/widgets_constants.dart';
import 'package:mathappcd/database/db.dart';
import 'package:mathappcd/screens/section.dart';
import 'package:mathappcd/screens/sub_section.dart';
import 'package:mathappcd/widgets/app_bar.dart';
import 'package:mathappcd/widgets/long_btn.dart';
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
  List<Widget> getSectionAItems() {
    return [
      LongBtn(text: "Q1", directTo: SubSection()),
      LongBtn(text: "Q2", directTo: SubSection()),
      LongBtn(text: "Q3", directTo: SubSection()),
      LongBtn(text: "Q4", directTo: SubSection()),
      LongBtn(text: "Q5", directTo: SubSection()),
      LongBtn(text: "Q6", directTo: SubSection()),
      LongBtn(text: "Q7", directTo: SubSection()),
    ];
  }

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
          children: [
            SquareBtn(
              text: "A",
              directTo: Section(heading: "SectionA", items: getSectionAItems()),
            ),
            SquareBtn(
              text: "B",
              directTo: Section(heading: "SectionB", items: getSectionAItems()),
            ),
            SquareBtn(
              text: "C",
              directTo: Section(heading: "SectionC", items: getSectionAItems()),
            ),
            TextButton(
                onPressed: () => {Database.setAllDB()},
                child: Text("Refresh DB"))
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
