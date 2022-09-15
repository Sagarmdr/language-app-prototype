import 'package:flutter/material.dart';
import 'package:sample_language_app/data/language_helper.dart';
import 'package:sample_language_app/global_constants.dart';
import 'package:sample_language_app/main.dart';
import 'package:sample_language_app/widgets/neu_container.dart';
import 'package:sample_language_app/widgets/select_game_widgets/select_game_correct_answer_streak_widget.dart';
import 'package:sample_language_app/widgets/select_game_widgets/select_game_option_buttons.dart';
import 'package:sample_language_app/widgets/select_game_widgets/select_game_question_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/select_game_widgets/select_game_answer_options_widget.dart';

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

  List<String> answerOptions = []; //has the random word
  List<String> showingOptions = []; //used only for showing options data in UI
  List<String> selectedAnswer = []; //the selected data as answer by user

  List<String> answer = []; //answer derieved from the data
  bool? answerResult;

  int correctAnswerStreak = 0;

  void clearAnswer() {
    setState(() {
      selectedAnswer.clear();
      showingOptions = List.from(answerOptions);
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
    int? temp = prefs.getInt(kHighScoreKeyWordSelectionGame);
    // print()
    int flag = temp ?? 0;
    if (correctAnswerStreak > flag) {
      prefs.setInt(kHighScoreKeyWordSelectionGame, correctAnswerStreak);
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
      answerOptions = _helper.getRandomDharugWords(data['dharug']);
      showingOptions = List.from(answerOptions);
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
                child: SelectGameQuestionWidget(
                  question: data['english'],
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
                child: SelectGameAnswerOptionsWdiget(
                  showingOptions: showingOptions,
                  onChipPressed: (value) => addToAnswer(value),
                ),
              ),
              SelectGameAnswerStreakWidget(
                correctAnswerStreak: correctAnswerStreak,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SelectGameOptionButtons(
                  onNext: getRandomData,
                  onClear: clearAnswer,
                  onCheck: checkAnswer,
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
