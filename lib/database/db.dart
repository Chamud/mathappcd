import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mathappcd/constants/string_constants.dart';
import 'package:mathappcd/models/question.dart';
import 'package:mathappcd/models/questionset.dart';
import 'package:mathappcd/models/section.dart';
import 'package:mathappcd/models/subquestion.dart';
import 'package:mathappcd/models/subsection.dart';

class Database {
  static late dynamic database1;
  static late dynamic database2;
  static late dynamic database3;
  static late dynamic databaseA;
  static late dynamic databaseB;

  static Future<List<ModelSection>> getDB(String filePath) async {
    final jsonString = await rootBundle.loadString(filePath);

    List<ModelSection> data = [];

    final jsonData = jsonDecode(jsonString);

    if (jsonData != null && jsonData is List) {
      for (var element in jsonData) {
        ModelSection section = ModelSection(
            id: element[SC.id],
            number: element[SC.number],
            name: element[SC.name]);

        if (element[SC.subSections] != null &&
            element[SC.subSections] is List) {
          for (var subSectionElement in element[SC.subSections]) {
            ModelSubSection subsection = ModelSubSection(
                id: subSectionElement[SC.id],
                number: subSectionElement[SC.number],
                name: subSectionElement[SC.name]);

            if (subSectionElement[SC.questionSets] != null &&
                subSectionElement[SC.questionSets] is List) {
              for (var questionSetElement
                  in subSectionElement[SC.questionSets]) {
                ModelQuestionSet questionSet = ModelQuestionSet(
                    id: questionSetElement[SC.id],
                    number: questionSetElement[SC.number],
                    name: questionSetElement[SC.name]);

                if (questionSetElement[SC.questions] != null &&
                    questionSetElement[SC.questions] is List) {
                  for (var questionElement
                      in questionSetElement[SC.questions]) {
                    ModelQuestion question = ModelQuestion(
                        id: questionElement[SC.id],
                        number: questionElement[SC.number],
                        question: questionElement[SC.question],
                        advanced: questionElement[SC.advanced]);

                    if (questionElement[SC.subQuestions] != null &&
                        questionElement[SC.subQuestions] is List) {
                      for (var subQuestionElement
                          in questionElement[SC.subQuestions]) {
                        ModelSubQuestion subQuestion = ModelSubQuestion(
                            id: subQuestionElement[SC.id],
                            number: subQuestionElement[SC.number],
                            question: subQuestionElement[SC.question],
                            answer: subQuestionElement[SC.answer]);

                        question.addChild(subQuestion);
                      }
                      question.sortChildren();
                    }

                    questionSet.addChild(question);
                  }
                  questionSet.sortChildren();
                }

                subsection.addChild(questionSet);
              }
              subsection.sortChildren();
            }

            section.addChild(subsection);
          }
          section.sortChildren();
        }

        data.add(section);
      }
      data.sort((a, b) => a.number.compareTo(b.number));
    }

    // for (var section in data) {
    //   print("Section: ${section.id}, ${section.number}, ${section.name}");
    //   for (var subsection in section.subsections) {
    //     print(
    //         "  Subsection: ${subsection.id}, ${subsection.number}, ${subsection.name}");
    //     for (var questionSet in subsection.questionSets) {
    //       print(
    //           "    Question Set: ${questionSet.id}, ${questionSet.number}, ${questionSet.name}");
    //       for (var question in questionSet.questions) {
    //         print(
    //             "      Question: ${question.id}, ${question.number}, ${question.question}");
    //         for (var subQuestion in question.subQuestions) {
    //           print(
    //               "        Subquestion: ${subQuestion.id}, ${subQuestion.number}, ${subQuestion.question}");
    //         }
    //       }
    //     }
    //   }
    // }

    return data;
  }

  static void setAllDB() async {
    database1 = await getDB(SC.db1);
    database2 = await getDB(SC.db2);
    database3 = await getDB(SC.db3);
    databaseA = await getDB(SC.dbA);
    databaseB = await getDB(SC.dbB);
  }
}
