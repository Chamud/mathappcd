import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mathappcd/constants/string_constants.dart';
import 'package:mathappcd/models/question.dart';
import 'package:mathappcd/models/questionset.dart';
import 'package:mathappcd/models/section.dart';
import 'package:mathappcd/models/subquestion.dart';
import 'package:mathappcd/models/subsection.dart';

class Database {
  static late List<ModelSection> database1;
  static late List<ModelSection> database2;
  static late List<ModelSection> database3;
  static late List<ModelSection> databaseA;
  static late List<ModelSection> databaseB;

  static Future<List<ModelSection>> getDB(String filePath) async {
    final jsonString = await rootBundle.loadString(filePath);

    List<ModelSection> data = [];

    final jsonData = jsonDecode(jsonString);

    if (jsonData != null && jsonData is List) {
      _parseSections(data, jsonData);
      data.sort((a, b) => a.number.compareTo(b.number));
    }

    // printData(filePath, data);

    return data;
  }

  static void _parseSections(List<ModelSection> list, dynamic elements) {
    for (var element in elements) {
      ModelSection section = ModelSection(
          id: element[SC.id],
          number: element[SC.number],
          name: element[SC.name]);

      dynamic childElements = element[SC.subSections];

      if (childElements != null && childElements is List) {
        _parseSubSections(section, childElements);
        section.sortChildren();
      }

      list.add(section);
    }
  }

  static void _parseSubSections(ModelSection list, dynamic elements) {
    for (var subElement in elements) {
      ModelSubSection subsection = ModelSubSection(
          id: subElement[SC.id],
          number: subElement[SC.number],
          name: subElement[SC.name]);

      dynamic childElements = subElement[SC.questionSets];

      if (childElements != null && childElements is List) {
        _parseQuestionSets(subsection, childElements);
        subsection.sortChildren();
      }

      list.addChild(subsection);
    }
  }

  static void _parseQuestionSets(ModelSubSection list, dynamic elements) {
    for (var subElement in elements) {
      ModelQuestionSet questionSet = ModelQuestionSet(
          id: subElement[SC.id],
          number: subElement[SC.number],
          name: subElement[SC.name]);

      dynamic childElements = subElement[SC.questions];

      if (childElements != null && childElements is List) {
        _parseQuestions(questionSet, childElements);
        questionSet.sortChildren();
      }

      list.addChild(questionSet);
    }
  }

  static void _parseQuestions(ModelQuestionSet list, dynamic elements) {
    for (var subElement in elements) {
      ModelQuestion question = ModelQuestion(
          id: subElement[SC.id],
          number: subElement[SC.number],
          question: subElement[SC.question],
          advanced: subElement[SC.advanced]);

      dynamic childElements = subElement[SC.subQuestions];

      if (childElements != null && childElements is List) {
        _parseSubQuestions(question, childElements);
        question.sortChildren();
      }

      list.addChild(question);
    }
  }

  static void _parseSubQuestions(ModelQuestion list, dynamic elements) {
    for (var subElement in elements) {
      ModelSubQuestion subQuestion = ModelSubQuestion(
          id: subElement[SC.id],
          number: subElement[SC.number],
          question: subElement[SC.question],
          answer: subElement[SC.answer]);

      list.addChild(subQuestion);
    }
  }

  static Future<void> setAllDB() async {
    database1 = await getDB(SC.db1);
    database2 = await getDB(SC.db2);
    database3 = await getDB(SC.db3);
    databaseA = await getDB(SC.dbA);
    databaseB = await getDB(SC.dbB);
  }

  static void printData(filePath, data) {
    if (kDebugMode) {
      print("===========================================================");
      print("DB: $filePath");
      for (var section in data) {
        print("Section: ${section.id}, ${section.number}, ${section.name}");
        for (var subsection in section.subsections) {
          print(
              "  Subsection: ${subsection.id}, ${subsection.number}, ${subsection.name}");
          for (var questionSet in subsection.questionSets) {
            print(
                "    Question Set: ${questionSet.id}, ${questionSet.number}, ${questionSet.name}");
            for (var question in questionSet.questions) {
              print(
                  "      Question: ${question.id}, ${question.number}, ${question.question}");
              for (var subQuestion in question.subQuestions) {
                print(
                    "        Subquestion: ${subQuestion.id}, ${subQuestion.number}, ${subQuestion.question}");
              }
            }
          }
        }
      }
    }
  }
}
