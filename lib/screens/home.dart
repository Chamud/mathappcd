import 'package:flutter/material.dart';
import 'package:mathappcd/constants/string_constants.dart';
import 'package:mathappcd/constants/widgets_constants.dart';
import 'package:mathappcd/database/db.dart';
import 'package:mathappcd/screens/section.dart';
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
          children: [
            SquareBtn(
              text: SC.section1,
              isAvailable: Database.database1.isNotEmpty,
              directTo:
                  Section(heading: SC.section1, items: Database.database1),
            ),
            SquareBtn(
              text: SC.sectionA,
              isAvailable: Database.databaseA.isNotEmpty,
              directTo:
                  Section(heading: SC.sectionA, items: Database.databaseA),
            ),
            SquareBtn(
              text: SC.section2,
              isAvailable: Database.database2.isNotEmpty,
              directTo:
                  Section(heading: SC.section2, items: Database.database2),
            ),
            SquareBtn(
              text: SC.section3,
              isAvailable: Database.database3.isNotEmpty,
              directTo:
                  Section(heading: SC.section3, items: Database.database3),
            ),
            SquareBtn(
              text: SC.sectionB,
              isAvailable: Database.databaseB.isNotEmpty,
              directTo:
                  Section(heading: SC.sectionB, items: Database.databaseA),
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
        title: SC.mathAppTitle,
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
                Expanded(
                  child: getBanner(),
                ),
                getHomeButtons(),
              ],
            ),
    );
  }
}
