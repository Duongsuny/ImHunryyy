class UserInformation {
  final String name;
  final String dateOfBirth;

  UserInformation({
    required this.name,
    required this.dateOfBirth
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "dateOfBirth": dateOfBirth
    };
  }
}