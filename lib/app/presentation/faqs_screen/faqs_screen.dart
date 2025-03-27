import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spicypickles/app/core/utils/dummy_data/faqs_data.dart';
import 'package:spicypickles/app/core/utils/util_exports.dart';
import 'package:spicypickles/app/model/model_exports.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen();
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  late FaqModel faqModel;

  @override
  void initState() {
    super.initState();
    faqModel = faqModelFromJson(json.encode(FAQSData.faqsData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          title: Text("FAQ's Screen", style: context.textStyle?.labelLarge?.copyWith(fontSize: 18)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Handle more options
              },
            ),
          ],
        ),
      body: ListView.builder(
        itemCount: faqModel.faQs?.length ?? 0,
        itemBuilder: (context, outerIndex) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  faqModel.faQs?[outerIndex].section ?? "",
                  style: context.textStyle?.headlineSmall,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Important to disable inner list scrolling
                itemCount: faqModel.faQs?[outerIndex].questions?.length ?? 0, // Number of items in each inner list
                itemBuilder: (context, innerIndex) {
                  return ExpansionTile(
                    backgroundColor: AppColors.white,
                    collapsedBackgroundColor: AppColors.white,
                    title: Text(faqModel.faQs?[outerIndex].questions![innerIndex].question ?? ""),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(faqModel.faQs?[outerIndex].questions![innerIndex].answer ?? ""),
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      )
    );
  }
}