import 'package:im_hungry/models/mood.dart';

class MoodCollection {
    static final List<Mood> _moods = [
    Mood(mood: "Em buồn ngủ", imgPath: "lib/assets/loading_cat.png"),
    Mood(mood: "Em đói", imgPath: "lib/assets/loading_cat.png"),
    Mood(mood: "Em chán", imgPath: "lib/assets/loading_cat.png"),
    Mood(mood: "Em dỗi", imgPath: "lib/assets/loading_cat.png"),
  ];

  get moods => _moods;
}