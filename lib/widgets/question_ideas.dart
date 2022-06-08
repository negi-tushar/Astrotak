import 'package:astrotak/constants/constants.dart';
import 'package:astrotak/data/model/category.dart';
import 'package:flutter/material.dart';

class QuestionIdeas extends StatefulWidget {
  const QuestionIdeas({
    Key? key,
    required this.controller,
    required this.list,
    required this.itemIndex,
  }) : super(key: key);
  final TextEditingController controller;
  final List<Datum> list;
  final int itemIndex;
  @override
  State<QuestionIdeas> createState() => _QuestionIdeasState();
}

class _QuestionIdeasState extends State<QuestionIdeas> {
  @override
  Widget build(BuildContext context) {
    //final categorydata = Provider.of<Categoryprovider>(context).category.data;

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.list[widget.itemIndex].suggestions.length,
            itemBuilder: ((context, index) {
              var questions = widget.list[widget.itemIndex].suggestions;
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
                  title: Text(
                    questions[index],
                    style: kNormaltext,
                  ),
                ),
              );
            })));
  }
}
