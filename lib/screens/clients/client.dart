import 'package:client_data/screens/clients/add_client.dart';
import 'package:client_data/screens/supplier/supplier.dart';
import 'package:client_data/utils/client%20utils/PostClient.dart';
import 'package:client_data/utils/card.dart';
import 'package:client_data/utils/default/default.dart';
import 'package:client_data/utils/client%20utils/itemCardClient.dart';
import 'package:client_data/utils/client%20utils/modelclient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ClientScreen extends StatelessWidget {
  ClientScreen(this.currentUserID);
  final String currentUserID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultWidget(
          Client(currentUserID: currentUserID), false, true, true, true),
    );
  }
}

BuildContext globalContext;

class Client extends StatelessWidget {
  Client({this.currentUserID});
  final String currentUserID;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            (FirebaseAuth.instance.currentUser.uid == currentUserID)
                ? MaterialButton(
                    color: Colors.cyan,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    onPressed: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => AddClient(currentUserID)));
                    },
                    child: Text(
                      " Add  Client ",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Text(''),
            SizedBox(
              width: 50,
            ),
            MaterialButton(
              color: Colors.cyan,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {
                Navigator.push(
                    (context),
                    MaterialPageRoute(
                        builder: (context) => ClientScreen(currentUserID)));
              },
              child: Text(
                "Client",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            MaterialButton(
              color: Colors.cyan[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {
                Navigator.push(
                    (context),
                    MaterialPageRoute(
                        builder: (context) => SupplierScreen(currentUserID)));
              },
              child: Text(
                "Supplier",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: cards.length * 110.0,
                child: StreamBuilder(
                  stream: PostDataClient().getPosts(
                      flag: true, filter: "userID", key: currentUserID),
                  builder: (context,
                      AsyncSnapshot<List<DonaloPostClient>> snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return GridView.builder(
                          itemCount: data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: width > 1000
                                ? 4
                                : width > 800
                                    ? 3
                                    : width > 600
                                        ? 2
                                        : 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: width > 700
                                ? width / 1000 * 0.5
                                : width / 1000 * 1.5,
                          ),
                          itemBuilder: (context, index) => ItemCardClient(
                                currentUserID,
                                clientproduct: data[index],
                              ));
                    } else {
                      return Center(
                        child: Text('Loading...'),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  void func() {
    Navigator.push((globalContext),
        MaterialPageRoute(builder: (context) => AddClient(currentUserID)));
  }
}
