// Defining a class called "Ward"
class Ward {
  // Declaring instance variables
  final String wardNo; // The ward number
  final String ownerName; // The name of the owner
  final String tapNo; // The tap number
  final double billDue; // The amount of bill due
  final String noOfTaps; // The number of taps
  final String seqNo; // The sequence number
  final String tapSize; // The size of the tap
  final String tapType; // The type of the tap
  final String tapUsage; // The usage of the tap
  final String userId; // The user ID

  // Constructor for the Ward class
  Ward(
    {
    required this.wardNo, // Initializing the ward number
    required this.userId, // Initializing the user ID
    required this.ownerName, // Initializing the owner name
    required this.tapNo, // Initializing the tap number
    required this.tapUsage, // Initializing the tap usage
    required this.tapType, // Initializing the tap type
    required this.tapSize, // Initializing the tap size
    required this.seqNo, // Initializing the sequence number
    required this.noOfTaps, // Initializing the number of taps
    required this.billDue, // Initializing the bill due
    }
  );
}
