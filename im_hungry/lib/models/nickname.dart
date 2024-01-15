class NickName {
  String _me = "Anh";
  String _partner = "Em";

  String me() {return _me;}
  String partner() {return _partner;}

  void changeMyNickName(String newName) {
    _me = newName;
  }

  void changePartnerName(String newPartnerName) {
    _partner = newPartnerName;
  }
}