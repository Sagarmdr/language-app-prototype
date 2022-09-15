import 'dart:math';

class LanguageHelper {
  final rand = Random();

  final List<String> dataList = [
    'I see the food,Naa- dyu  ngununy,Naadyu ngununy',
    'I listened to/heard the water,Ngara- dya- wu badu,Ngaradyawu badugu',
    'The man speared the kangaroo,Mulla-da  buru  gamay-dya,Mullada buru gamaydya',
    'The women collected the fish,Dyin-a   magura  mana- dya,Dyina magura manadya',
    'You will see the water/river,Naa - ba- mi   badu,Naabami badu',
    'I am on country,Ngaya  nura -wa,Ngaya nurawa',
    'The fish is in the water,Magura badu-wa,Magura baduwa',
    'What is this?,Mii diyi?,Mii diyi?',
    'Big Ship,Marri -  nuwi,Marrinuw',
    'Beautiful wallaby,Warada ADJ barra,Warada barra',
    'That is a rock,Nanu  giba,Nanu giba',
    'That is a stick,Nanu  wadi,Nanu wadi',
    'I am good/well,Ngaya budyari,Ngaya budyari',
    'I saw the tree,naa- dya - wu   yarra,Naadyawu yarra',
    '‘You saw me’,naa-dya-   mi- nga,Naadyaminga',
    'I Speak,Baya- wu,Bayawu',
    'I drink water,Wida -wu badu,Widawu badu',
    'I go,Ngaya Yenma,Ngaya Yenma',
    'I will go tomorrow morning,Yena-ou mullna- oul,Yenaou mullnaoul',
    'I will cool myself in the rain,bayin-mi-lyi-ba-wu bana-wa,bayinmilyibawu banawa',
    '0I talk to myself,Baya-lyi ba-wu,Bayalyibawu',
    'Are you well/good?,ngiyini budyari,Ngiyini budyari',
    'Son are you  hungry?,Durung ngiyini  yuruwin,Durung ngiyini  yuruwin',
    'Drink tea?,Wida dyirang?,Wida dyirang?',
    'Why don’t you drink?,minyin DET bial widaV dyi,Minyin bial widadyimi?',
    'Whose feet?,Ngaan INT manduwi?,Ngaan manduwi?',
    'I cry because I have no water,Ngaya dugaV miS wida N-bunin NEG,Ngaya dugami widabunin',
    'You are sick,ngiyini mulali-dwara,ngiyini mulalidwara',
    '‘I don’t desire/want your company’,Wana- dya PAST wu-nya,Wanadya wunya',
    'The possum is in the tree,Wali yarra-wa LOC,Wali yarrawa',
    'The food is for the possum,ngununy wali-gu,ngununy waligu',
    'I see the woman’s stick,Naa-dyi-wu dyin- gu gani-bi,naadyiwu dyingu ganibi',
    'from/because of the cold,dagara-in,dagarain',
    'without food,biyal ngununy-gu,biyal ngununygu',
    'He gave pork and bread to the people,Ngwuya-yi PAST dali dyangu-ra PLUR bread-a PLUR yura,Nguwingi tali tyungora breada eora',
    'It was hurt/cut by an oyster shell during bathing,galabayi-dya-nga bidang-i bugi-dwara,galabayidyanga bidangi bugidwara',
  ];

  final dataMap = [
    {
      'english': 'I see the food',
      'pronunciation': 'Naa- dyu  ngununy',
      'dharug': 'Naadyu ngununy',
    },
    {
      'english': 'I listened to/heard the water',
      'pronunciation': 'Ngara- dya- wu badu',
      'dharug': 'Ngaradyawu badugu',
    },
    {
      'english': 'The man speared the kangaroo',
      'pronunciation': 'Mulla-da  buru  gamay-dya',
      'dharug': 'Mullada buru gamaydya',
    },
    {
      'english': 'The women collected the fish',
      'pronunciation': 'Dyin-a   magura  mana- dya',
      'dharug': 'Dyina magura manadya',
    },
    {
      'english': 'You will see the water/river',
      'pronunciation': 'Naa - ba- mi   badu',
      'dharug': 'Naabami badu',
    },
    {
      'english': 'I am on country',
      'pronunciation': 'Ngaya  nura -wa',
      'dharug': 'Ngaya nurawa',
    },
    {
      'english': 'The fish is in the water',
      'pronunciation': 'Magura badu-wa',
      'dharug': 'Magura baduwa',
    },
    {
      'english': 'What is this?',
      'pronunciation': 'Mii diyi?',
      'dharug': 'Mii diyi?',
    },
    {
      'english': 'Big Ship',
      'pronunciation': 'Marri -  nuwi',
      'dharug': 'Marrinuw',
    },
    {
      'english': 'Beautiful wallaby',
      'pronunciation': 'Warada ADJ barra',
      'dharug': 'Warada barra',
    },
    {
      'english': 'That is a rock',
      'pronunciation': 'Nanu  giba',
      'dharug': 'Nanu giba',
    },
    {
      'english': 'That is a stick',
      'pronunciation': 'Nanu  wadi',
      'dharug': 'Nanu wadi',
    },
    {
      'english': 'I am good/well',
      'pronunciation': 'Ngaya budyari',
      'dharug': 'Ngaya budyari',
    },
    {
      'english': 'I saw the tree',
      'pronunciation': 'naa- dya - wu   yarra',
      'dharug': 'Naadyawu yarra',
    },
    {
      'english': 'You saw me',
      'pronunciation': 'naa-dya-   mi- nga',
      'dharug': 'Naadyaminga',
    },
    {
      'english': 'I Speak',
      'pronunciation': 'Baya- wu',
      'dharug': 'Bayawu',
    },
    {
      'english': 'I drink water',
      'pronunciation': 'Wida -wu badu',
      'dharug': 'Widawu badu',
    },
    {
      'english': 'I go',
      'pronunciation': 'Ngaya Yenma',
      'dharug': 'Ngaya Yenma',
    },
    {
      'english': 'I will go tomorrow morning',
      'pronunciation': 'Yena-ou mullna- oul',
      'dharug': 'Yenaou mullnaoul',
    },
    {
      'english': 'I will cool myself in the rain',
      'pronunciation': 'bayin-mi-lyi-ba-wu bana-wa',
      'dharug': 'bayinmilyibawu banawa',
    },
    {
      'english': 'I talk to myself',
      'pronunciation': 'Baya-lyi ba-wu',
      'dharug': 'Bayalyibawu',
    },
    {
      'english': 'Are you well/good?',
      'pronunciation': 'ngiyini budyari',
      'dharug': 'Ngiyini budyari',
    },
    {
      'english': 'Son are you hungry?',
      'pronunciation': 'Durung ngiyini  yuruwin',
      'dharug': 'Durung ngiyini yuruwin',
    },
    {
      'english': 'Drink tea?',
      'pronunciation': 'Wida dyirang?',
      'dharug': 'Wida dyirang?',
    },
    {
      'english': 'Why don’t you drink?',
      'pronunciation': 'minyin DET bial widaV dyi',
      'dharug': 'Minyin bial widadyimi?',
    },
    {
      'english': 'Whose feet?',
      'pronunciation': 'Ngaan INT manduwi?',
      'dharug': 'Ngaan manduwi?',
    },
    {
      'english': 'I cry because I have no water',
      'pronunciation': 'Ngaya dugaV miS wida N-bunin NEG',
      'dharug': 'Ngaya dugami widabunin',
    },
    {
      'english': 'You are sick',
      'pronunciation': 'ngiyini mulali-dwara',
      'dharug': 'ngiyini mulalidwara',
    },
    {
      'english': 'I don’t desire/want your company',
      'pronunciation': 'Wana- dya PAST wu-nya',
      'dharug': 'Wanadya wunya',
    },
    {
      'english': 'The possum is in the tree',
      'pronunciation': 'Wali yarra-wa LOC',
      'dharug': 'Wali yarrawa',
    },
    {
      'english': 'The food is for the possum',
      'pronunciation': 'ngununy wali-gu',
      'dharug': 'ngununy waligu',
    },
    {
      'english': 'I see the woman’s stick',
      'pronunciation': 'Naa-dyi-wu dyin- gu gani-bi',
      'dharug': 'naadyiwu dyingu ganibi',
    },
    {
      'english': 'from/because of the cold',
      'pronunciation': 'dagara-in',
      'dharug': 'dagarain',
    },
    {
      'english': 'without food',
      'pronunciation': 'biyal ngununy-gu',
      'dharug': 'biyal ngununygu',
    },
    {
      'english': 'He gave pork and bread to the people',
      'pronunciation': 'Ngwuya-yi PAST dali dyangu-ra PLUR bread-a PLUR yura',
      'dharug': 'Nguwingi tali tyungora breada eora',
    },
    {
      'english': 'It was hurt/cut by an oyster shell during bathing',
      'pronunciation': 'galabayi-dya-nga bidang-i bugi-dwara',
      'dharug': 'galabayidyanga bidangi bugidwara',
    },
  ];

  final dharugWordsList = [
    'naadyu',
    'ngununy',
    'ngaradyawu',
    'badugu',
    'mullada',
    'buru',
    'gamaydya',
    'dyina',
    'magura',
    'manadya',
    'naabami',
    'badu',
    'ngaya',
    'nurawa',
    'magura',
    'baduwa',
    'mii',
    'diyi',
    'marrinuw',
    'warada',
    'barra',
    'nanu',
    'giba',
    'nanu',
    'wadi',
    'ngaya',
    'budyari',
    'naadyawu',
    'yarra',
    'naadyaminga',
    'bayawu',
    'widawu',
    'badu',
    'ngaya',
    'yenma',
    'yenaou',
    'mullnaoul',
    'bayinmilyibawu',
    'banawa',
    'bayalyibawu',
    'ngiyini',
    'budyari',
    'durung',
    'ngiyini',
    'yuruwin',
    'wida',
    'dyirang',
    'minyin',
    'bial',
    'widadyimi',
    'ngaan',
    'manduwi',
    'ngaya',
    'dugami',
    'widabunin',
    'ngiyini',
    'mulalidwara',
    'wanadya',
    'wunya',
    'wali',
    'yarrawa',
    'ngununy',
    'waligu',
    'naadyiwu',
    'dyingu',
    'ganibi',
    'dagarain',
    'biyal',
    'ngununygu',
    'nguwingi',
    'tali',
    'tyungora',
    'breada',
    'eora',
    'galabayidyanga',
    'bidangi',
    'bugidwara',
  ];

  final englishWordsList = [
    'I',
    'see',
    'the',
    'food',
    'I',
    'listened',
    'to/heard',
    'the',
    'water',
    'The',
    'man',
    'speared',
    'the',
    'kangaroo',
    'The',
    'women',
    'collected',
    'the',
    'fish',
    'You',
    'will',
    'see',
    'the',
    'water/river',
    'I',
    'am',
    'on',
    'country',
    'The',
    'fish',
    'is',
    'in',
    'the',
    'water',
    'What',
    'is',
    'this?',
    'Big',
    'Ship',
    'Beautiful',
    'wallaby',
    'That',
    'is',
    'a',
    'rock',
    'That',
    'is',
    'a',
    'stick',
    'I',
    'am',
    'good/well',
    'I',
    'saw',
    'the',
    'tree',
    'You',
    'saw',
    'me',
    'I',
    'Speak',
    'I',
    'drink',
    'water',
    'I',
    'go',
    'I',
    'will',
    'go',
    'tomorrow',
    'morning',
    'I',
    'will',
    'cool',
    'myself',
    'in',
    'the',
    'rain',
    'I',
    'talk',
    'to',
    'myself',
    'Are',
    'you',
    'well/good?',
    'Son',
    'are',
    'you',
    'hungry?',
    'Drink',
    'tea?',
    'Why',
    'don’t',
    'you',
    'drink?',
    'Whose',
    'feet?',
    'I',
    'cry',
    'because',
    'I',
    'have',
    'no',
    'water',
    'You',
    'are',
    'sick',
    'I',
    'don’t',
    'desire/want',
    'your',
    'company',
    'The',
    'possum',
    'is',
    'in',
    'the',
    'tree',
    'The',
    'food',
    'is',
    'for',
    'the',
    'possum',
    'I',
    'see',
    'the',
    'woman’s',
    'stick',
    'from/because',
    'of',
    'the',
    'cold',
    'without',
    'food',
    'He',
    'gave',
    'pork',
    'and',
    'bread',
    'to',
    'the',
    'people',
    'It',
    'was',
    'hurt/cut',
    'by',
    'an',
    'oyster',
    'shell',
    'during',
    'bathing',
  ];

  List<String> getRandomDharugWords(String sentence) {
    List<String> words = sentence.trim().split(' ');
    List<String> tempList = [];

    final wordPadding = words.length % 2 == 0 ? 2 : 3;
    final randomWordsLenght = words.length + wordPadding;
    while (tempList.length != randomWordsLenght) {
      final randomWord = dharugWordsList[rand.nextInt(dharugWordsList.length)];
      final flag = words.contains(randomWord);
      if (flag) {
        continue;
      } else {
        tempList.add(randomWord);
      }
    }
    tempList.addAll(words);
    tempList.shuffle();
    return tempList;
  }

  List<String> getRandomEnglislhWords(String sentence) {
    List<String> words = sentence.trim().split(' ');
    List<String> tempList = [];

    final wordPadding = words.length % 2 == 0 ? 2 : 3;
    final randomWordsLenght = words.length + wordPadding;
    while (tempList.length != randomWordsLenght) {
      final randomWord =
          englishWordsList[rand.nextInt(englishWordsList.length)];
      final flag = words.contains(randomWord);
      if (flag) {
        continue;
      } else {
        tempList.add(randomWord);
      }
    }
    tempList.addAll(words);
    tempList.shuffle();
    return tempList;
  }

  List<String> getRandomEnglishWords(String sentence) {
    List<String> words = sentence.trim().split(' ');
    List<String> tempList = [];

    final wordPadding = words.length % 2 == 0 ? 4 : 5;
    final randomWordsLenght = words.length + wordPadding;
    while (tempList.length != randomWordsLenght) {
      final randomWord =
          englishWordsList[rand.nextInt(englishWordsList.length)];
      final flag = words.contains(randomWord);
      if (flag) {
        continue;
      } else {
        tempList.add(randomWord);
      }
    }
    tempList.addAll(words);
    tempList.shuffle();
    return tempList;
  }

  Map getRandomPhrase() {
    final dataIndex = rand.nextInt(dataMap.length);
    return dataMap[dataIndex];
  }
}
