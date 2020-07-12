class Exercise {
  String id;
  String name;
  int difficulty;
  List<String> explanation;
  List<String> equipment;
  List<String> tags;
  List<String> related;

  String get difficultyName {
    switch (difficulty) {
      case 0:
      case 1:
        return 'Muy fácil';
      case 2:
        return 'Fácil';
      case 3:
        return 'Normal';
      case 4:
        return 'Intermedio';
      case 5:
        return 'Difícil';
      case 6:
        return 'Muy difícil';
      default:
        return 'No clasificado';
    }
  }

  Exercise.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        difficulty = json['difficulty'],
        equipment = (json['equipment'] ?? []).map<String>((v) => v.toString()).toList(),
        tags = (json['tags'] ?? []).map<String>((v) => v.toString()).toList(),
        related = (json['related'] ?? []).map<String>((v) => v.toString()).toList(),
        explanation = (json['explanation'] ?? []).map<String>((v) => v.toString()).toList();
}
