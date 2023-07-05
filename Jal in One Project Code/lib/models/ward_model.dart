// Defining a class called "WardData"
class WardData {
  // Declaring instance variables
  final String wardNo; // The ward number
  final String officerContact; // The contact information of the officer
  final String officerName; // The name of the officer
  final String waterSupplyDate; // The date of water supply
  final String wardId; // The ID of the ward

  // Constructor for the WardData class
  WardData(
    {
      required this.wardNo, // Initializing the ward number
      required this.officerContact, // Initializing the officer's contact information
      required this.officerName, // Initializing the officer's name
      required this.waterSupplyDate, // Initializing the date of water supply
      required this.wardId, // Initializing the ward ID
    }
  );
}
