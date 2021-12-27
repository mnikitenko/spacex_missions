String findMissionByName(String name) {
  final String query = """
query {
 launches(limit: 10, offset: 0, find: {mission_name: "$name"}) {
    mission_name
    details
  }
}
""";
  return query;
}
