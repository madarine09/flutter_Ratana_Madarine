void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];
  
  // Filter scores where the value is 50 or higher
  var passingScores = scores.where((score) => score >= 50);
  
  // Print the filtered list using toList() to show the scores
  print(passingScores.toList());
  
  // Print the count of students who passed using .length
  print('${passingScores.length} students passed');
}
