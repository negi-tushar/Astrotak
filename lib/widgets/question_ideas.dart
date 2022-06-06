import 'package:astrotak/constants/constants.dart';
import 'package:flutter/material.dart';

class QuestionIdeas extends StatefulWidget {
  const QuestionIdeas({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  State<QuestionIdeas> createState() => _QuestionIdeasState();
}

class _QuestionIdeasState extends State<QuestionIdeas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: questions.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.controller.text = questions[index];
                  });
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.question_mark,
                    color: Colors.orange,
                  ),
                  shape: const Border(bottom: BorderSide(color: Colors.grey)),
                  title: Text(questions[index]),
                ),
              );
            })));
  }
}
