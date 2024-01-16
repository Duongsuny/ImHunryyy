abstract class Person {
  String _name = "";
  String _nickName = "";
  String _alternateNickname = "";

  set name(String newName) {
    _name = newName;
  }

  set nickName(String newName) {
    _nickName = newName;
  }

  set altName(String newName) {
    _alternateNickname = newName;
  }
}
