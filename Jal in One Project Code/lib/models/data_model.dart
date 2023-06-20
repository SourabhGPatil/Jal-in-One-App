class Ward {
  final String wardNo;
  final String ownerName;
  final String tapNo;
  final double billDue;
  final String noOfTaps;
  final String seqNo;
  final String tapSize;
  final String tapType;
  final String tapUsage;
  final String userId;



  Ward(
    {
      required this.wardNo,
      required this.userId,
      required this.ownerName,
      required this.tapNo,
      required this.tapUsage,
      required this.tapType,
      required this.tapSize,
      required this.seqNo,
      required this.noOfTaps,
      required this.billDue,
    }
  );
}

