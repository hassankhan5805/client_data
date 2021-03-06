import 'package:client_data/screens/supplier/supplier.dart';
import 'package:client_data/utils/supplier/model.dart';
import 'package:client_data/utils/supplier/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final DonaloPost product;
  final String currentUserID;
  ItemCard(
    this.currentUserID, {
    Key key,
    this.product,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
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
                        widget.currentUserID)
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
                  Text("${widget.product.cusName}"),
                  SizedBox(height: 5),
                  Text("Ports:" + widget.product.ports.toString()),
                  SizedBox(height: 5),
                  Text(widget.product.dest),
                  SizedBox(height: 5),
                  Text("Rate: ${widget.product.offeredRate.toString()}"),
                  Spacer(),
                  (FirebaseAuth.instance.currentUser.uid ==
                          widget.currentUserID)
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
                              PostData().deletePost(widget.product);
                              Navigator.push(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) => SupplierScreen(
                                          widget.currentUserID)));
                              print("delete");
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
