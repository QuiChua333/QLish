import 'package:qlish/src/data/models/word.dart';
import 'package:qlish/src/data/models/wordTopic.dart';

class WordTopicWithLearntCount {
  final WordTopicModel wordTopic;
  List<WordModel> listWords;

  WordTopicWithLearntCount({
    required this.wordTopic,
    required this.listWords
  });
}