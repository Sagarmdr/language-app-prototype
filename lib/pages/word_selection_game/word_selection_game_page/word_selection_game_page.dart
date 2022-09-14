import 'package:flutter/material.dart';
import 'package:sample_language_app/data/language_helper.dart';
import 'package:sample_language_app/global_constants.dart';
import 'package:sample_language_app/main.dart';
import 'package:sample_language_app/widgets/neu_button.dart';
import 'package:sample_language_app/widgets/neu_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordSelectionGamePage extends StatefulWidget {
  const WordSelectionGamePage({Key? key}) : super(key: key);

  @override
  State<WordSelectionGamePage> createState() => _WordSelectionGamePageState();
}

class _WordSelectionGamePageState extends State<WordSelectionGamePage> {
  final LanguageHelper _helper = LanguageHelper();
  Map data = {
    'english': '',
    'pronunciation': '',
    'dharug': '',
  };

  List<String> selectOptions = []; //has the random word
  List<String> showingOptions = []; //used only for showing options data in UI
  List<String> selectedAnswer = []; //the selected data as answer by user

  List<String> answer = []; //answer derieved from the data
  bool? answerResult;

  int correctAnswerStreak = 0;

  void clearAnswer() {
    setState(() {
      selectedAnswer.clear();
      showingOptions = List.from(selectOptions);
      answerResult = null;
    });
  }

  void addToAnswer(String word) {
    setState(() {
      selectedAnswer.add(word);
      showingOptions.remove(word);
    });
  }

  void checkAnswer() {
    setState(() {
      answerResult = compareList();
      showSnackBar();
      if (answerResult == true) {
        correctAnswerStreak += 1;
        checkHighScoreAndSave();
        getRandomData();
      } else {
        correctAnswerStreak = 0;
      }
    });
  }

  void checkHighScoreAndSave() async {
    final prefs = await SharedPreferences.getInstance();
    int? temp = prefs.getInt(kHighScoreKey);
    // print()
    int flag = temp ?? 0;
    if (correctAnswerStreak > flag) {
      prefs.setInt(kHighScoreKey, correctAnswerStreak);
    }
  }

  bool compareList() {
    if (answer.length == selectedAnswer.length) {
      for (int i = 0; i < answer.length; i++) {
        if (answer[i] == selectedAnswer[i]) {
          continue;
        } else {
          return false;
        }
      }
      return true;
    } else {
      return false;
    }
  }

  void getRandomData() {
    setState(() {
      data = _helper.getRandomPhrase();
      selectOptions = _helper.getRandomDharugWords(data['dharug']);
      showingOptions = List.from(selectOptions);
      selectedAnswer.clear();
      answer = data['dharug'].trim().split(' ');
      answerResult = null;
    });
  }

  Future showSnackBar() async {
    return kScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: answerResult! ? Colors.green : Colors.red,
        content: Text(
          answerResult! ? 'Correct' : 'Incorrect',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  void initState() {
    getRandomData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('COMMON PHRASES'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data['english'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const Text(
                'ANSWER',
                style: TextStyle(letterSpacing: 5),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: NeuContainer(
                  alignment: Alignment.center,
                  child: Wrap(
                    children: [
                      for (final word in selectedAnswer) Text('$word '),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 12,
                    children: [
                      for (final option in showingOptions)
                        ActionChip(
                          label: Text(option),
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          onPressed: () => addToAnswer(option),
                        ),
                    ],
                  ),
                ),
              ),
              Text(
                'Correct Answer Streak : $correctAnswerStreak',
                style: const TextStyle(
                  fontSize: 16,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NeuButton(
                      iconData: Icons.navigate_next,
                      tooltip: 'Next Phrase',
                      onTap: getRandomData,
                    ),
                    NeuButton(
                      iconData: Icons.refresh,
                      tooltip: 'Clear Answer',
                      onTap: clearAnswer,
                    ),
                    NeuButton(
                      iconData: Icons.check,
                      tooltip: 'Check Answer',
                      onTap: checkAnswer,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
