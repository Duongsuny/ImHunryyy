import 'package:im_hungry/models/mood.dart';

class MoodCollection {
    final List<Mood> _moods = [
    Mood(mood: "Em đóiii", imgPath: "lib/assets/loading_cat.png"),
    Mood(mood: "Em dỗiii", imgPath: "lib/assets/loading_cat.png"),
    Mood(mood: "Em dỗiii", imgPath: "lib/assets/loading_cat.png"),
    Mood(mood: "Em dỗiii", imgPath: "lib/assets/loading_cat.png"),
  ];

  get moods => _moods;
}