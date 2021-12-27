class Mission {
  final String name;
  final String details;

  Mission({
    required this.name,
    required this.details,
  });

  @override
  String toString() {
    return 'Mission{name: $name, details: $details}';
  }
}
