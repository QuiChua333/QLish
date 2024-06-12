import 'package:qlish/src/data/models/word.dart';
import 'package:qlish/src/data/models/wordTopic.dart';

class WordTopicWithSavedCount {
  final WordTopicModel wordTopic;
  List<WordModel> listWords;

  WordTopicWithSavedCount({
    required this.wordTopic,
    required this.listWords
  });
}