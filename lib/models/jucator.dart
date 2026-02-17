class Jucator {
  String nume;
  int puncte;

  Jucator({required this.nume, this.puncte = 0});

  Map<String, dynamic> toMap() => {'nume': nume, 'puncte': puncte};

  factory Jucator.fromMap(Map<dynamic, dynamic> map) {
    return Jucator(
      nume: map['nume'] as String,
      puncte: (map['puncte'] ?? 0) as int,
    );
  }
}
