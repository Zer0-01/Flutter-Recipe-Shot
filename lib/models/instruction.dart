class Instruction {
  final int stepNumber;
  final String description;

  Instruction({
    required this.stepNumber,
    required this.description,
  });

  // Factory constructor to create an Instruction from a JSON map
  factory Instruction.fromJson(Map<String, dynamic> json) {
    return Instruction(
      stepNumber: json['stepNumber'],
      description: json['description'],
    );
  }

  // Method to convert an Instruction instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'stepNumber': stepNumber,
      'description': description,
    };
  }
}
