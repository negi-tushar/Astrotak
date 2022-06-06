import 'package:astrotak/constants/constants.dart';
import 'package:astrotak/screens/profile_screen.dart';
import 'package:astrotak/widgets/custom_drop_down.dart';
import 'package:astrotak/widgets/question_ideas.dart';
import 'package:flutter/material.dart';

class AskQuestionScreen extends StatefulWidget {
  const AskQuestionScreen({Key? key}) : super(key: key);
  static const String id = '/AskQuestionScreen';
  @override
  State<AskQuestionScreen> createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  String dropDownSelectedvalue = "Love";
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const Image(
          image: AssetImage(
            'assets/images/hamburger.png',
          ),
        ),
        title: const Image(
          image: AssetImage('assets/images/icon.png'),
          width: 60,
          height: 60,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProfileScreen.id);
              },
              child: const Image(
                image: AssetImage('assets/images/profile.png'),
                width: 30,
                height: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 36, 144, 232),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Wallet Balance : ₹0',
                  style: kWitelabbel,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, minimumSize: const Size(30, 25)),
                  child: const Text(
                    'Add Money',
                    style: TextStyle(
                      color: Color.fromARGB(255, 28, 121, 198),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ask a Question',
                        style: kHeading,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is  related to love, self, life, business, money, education or work, our astrologers will do and in depth study of your birth chart to provide personalized responses along wiht remedies.',
                        style: TextStyle(wordSpacing: 2),
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Choose Category',
                        style: kHeading,
                      ),
                      DropdownButton(
                        value: dropDownSelectedvalue,

                        isExpanded: true,
                        //  borderRadius: BorderRadius.circular(10),
                        items: dropdownItems,
                        onChanged: (val) {
                          setState(() {
                            dropDownSelectedvalue = val as String;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _controller,
                        maxLength: 150,
                        // inputFormatters: [LengthLimitingTextInputFormatter(150)],
                        maxLines: 3,
                        decoration: const InputDecoration(
                            hintText: 'Type a question here',
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Ideas what to Ask (Select Any)',
                        style: kHeading,
                      ),
                      QuestionIdeas(
                        controller: _controller,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologets to know what future has in store for you.',
                        style: TextStyle(wordSpacing: 2),
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Color.fromARGB(255, 246, 221, 184),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: const [
                              Text(
                                '• Presonalized response provided by our team of Vedic astrologers within 24 hours.',
                                style: kBottomStyle,
                              ),
                              Text(
                                '• Qualified and experienced astrologers will look into your birth chart and provide the right guidance.',
                                style: kBottomStyle,
                              ),
                              Text(
                                '• You can seek answers to any part of your life and for most pressing issues.',
                                style: kBottomStyle,
                              ),
                              Text(
                                '• Our Team of Vedic astrologers will not just provide answers but also suggets a remedial solutions.',
                                style: kBottomStyle,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(255, 36, 144, 232),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  '₹ 150( ! Question on Love)',
                  style: kWitelabbel,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, minimumSize: const Size(30, 25)),
                  child: const Text(
                    'Ask Now',
                    style: TextStyle(
                      color: Color.fromARGB(255, 28, 121, 198),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
