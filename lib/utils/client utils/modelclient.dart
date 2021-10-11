
class DonaloPostClient {
  final String postID;
  final String userID;
  final String cusName;
  final String offeredRate;
  final String ports;
  final String dest;

  DonaloPostClient({
    this.postID,
    this.userID,
    this.cusName,
    this.offeredRate,
    this.ports,
    this.dest,
  });
  DonaloPostClient.fromMap(Map<String, dynamic> map)
      : this(
            postID: map['postID'],
            userID: map['userID'],
            cusName: map['cusName'],
            offeredRate: map['offeredRate'],
            ports: map['ports'],
            dest: map['dest']);

  Map<String, dynamic> toMap() => {
        'postID': postID,
        'cusName': cusName,
        'userID': userID,
        'offeredRate': offeredRate,
        'ports': ports,
        'dest': dest,
      };
}
