import 'package:flutter/material.dart';
import 'package:mathappcd/constants/string_constants.dart';
import 'package:mathappcd/database/db.dart';
import 'package:mathappcd/screens/home.dart';

void main() {
  runApp(const MathAppCD());
}

class MathAppCD extends StatelessWidget {
  const MathAppCD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Database.setAllDB(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: SC.mathAppTitle,
            theme: ThemeData(fontFamily: 'NotoSansSC'),
            home: const HomePage(),
          );
        } else {
          // Make a loading screenr
          return const MaterialApp(
            title: SC.mathAppTitle,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
