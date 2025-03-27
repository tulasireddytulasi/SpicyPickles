import 'dart:convert';

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  List<Faq>? faQs;

  FaqModel({
    this.faQs,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
    faQs: json["FAQs"] == null ? [] : List<Faq>.from(json["FAQs"]!.map((x) => Faq.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "FAQs": faQs == null ? [] : List<dynamic>.from(faQs!.map((x) => x.toJson())),
  };
}

class Faq {
  String? section;
  List<Question>? questions;

  Faq({
    this.section,
    this.questions,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
    section: json["section"],
    questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "section": section,
    "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x.toJson())),
  };
}

class Question {
  String? question;
  String? answer;

  Question({
    this.question,
    this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question: json["question"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answer": answer,
  };
}
