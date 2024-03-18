import 'package:im_hungry/models/mood.dart';

class MoodCollection {
    static final List<Mood> _moods = [
    Mood(mood: "buồn ngủ", imgPath: "lib/assets/loading_cat.png"),
    Mood(mood: "đói", imgPath: "lib/assets/loading_cat.png"),
    Mood(mood: "chán", imgPath: "lib/assets/loading_cat.png"),
    Mood(mood: "dỗi", imgPath: "lib/assets/loading_cat.png"),
  ];

  get moods => _moods;
}