class UserInformation {
  final String name;
  final String gender;
  final DateTime dateOfBirth;

  UserInformation({
    required this.name,
    required this.gender,
    required this.dateOfBirth
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "gender": gender,
      "dateOfBirth": dateOfBirth
    };
  }
}