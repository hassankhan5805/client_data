import 'package:cloud_firestore/cloud_firestore.dart';

class DonaloPost {
  final String postID;
  final String userID;
  final String cusName;
  final int offeredRate;
  final double ports;
  final String dest;

  DonaloPost({
    this.postID,
    this.userID,
    this.cusName,
    this.offeredRate,
    this.ports,
    this.dest,
  });
  DonaloPost.fromMap(Map<String, dynamic> map)
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
