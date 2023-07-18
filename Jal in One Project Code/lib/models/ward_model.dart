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

/*
* The code defines a Dart class called "WardData" that represents data about a ward.

* It contains instance variables to store various attributes of the ward data, such as ward number, officer's contact information, officer's name, water supply date, and ward ID.

* The class also has a constructor that initializes these variables using named parameters.

* The "required" keyword ensures that these parameters are mandatory while creating an instance of the "WardData" class.
*/