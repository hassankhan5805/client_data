import 'package:client_data/screens/clients/client.dart';
import 'package:client_data/utils/client%20utils/PostClient.dart';
import 'package:client_data/utils/client%20utils/modelclient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ItemCardClient extends StatefulWidget {
  final DonaloPostClient clientproduct;
  final String currentuserID;
  ItemCardClient(
    this.currentuserID, {
    Key key,
    this.clientproduct,
    DonaloPostClient DonaloPostClient,
  }) : super(key: key);

  @override
  State<ItemCardClient> createState() => _ItemCardClientState();
}

class _ItemCardClientState extends State<ItemCardClient> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: (FirebaseAuth.instance.currentUser.uid ==
                        widget.currentuserID)
                    ? Colors.blue
                    : Colors.cyan[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/client.jpg",
                    width: 50,
                    height: 40,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("${widget.clientproduct.cusName}"),
                  SizedBox(height: 5),
                  Text("Ports:" + widget.clientproduct.ports.toString()),
                  SizedBox(height: 5),
                  Text(widget.clientproduct.dest),
                  SizedBox(height: 5),
                  Text("Rate: ${widget.clientproduct.offeredRate.toString()}"),
                  Spacer(),
                  Spacer(),
                  (FirebaseAuth.instance.currentUser.uid ==
                          widget.currentuserID)
                      ? IconButton(
                          icon: Icon(Icons.delete_forever),
                          color: Colors.white,
                          highlightColor: Colors.red,
                          hoverColor: Colors.green,
                          focusColor: Colors.purple,
                          splashColor: Colors.yellow,
                          disabledColor: Colors.amber,
                          iconSize: 20,
                          onPressed: () {
                            setState(() {
                              PostDataClient().deletePost(widget.clientproduct);
                              Navigator.push(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ClientScreen(widget.currentuserID)));
                              print("delete client");
                            });
                          },
                        )
                      : Text(''),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
