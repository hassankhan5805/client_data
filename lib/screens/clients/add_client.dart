import 'package:client_data/screens/clients/client.dart';
import 'package:client_data/screens/users/UserScreen.dart';
import 'package:client_data/utils/client%20utils/PostClient.dart';
import 'package:client_data/utils/customs/appTextForm.dart';
import 'package:client_data/utils/customs/customButton.dart';
import 'package:client_data/utils/default/default.dart';
import 'package:client_data/utils/client%20utils/modelclient.dart';
import 'package:flutter/material.dart';

class addClient extends StatelessWidget {
  String currentUserID;
  addClient(this.currentUserID);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: missing_required_param
      body: DefaultWidget(addDetailClient(currentUserID), true, true, true),
    );
  }
} //store user,table,

TextEditingController name = TextEditingController();
TextEditingController ports = TextEditingController();
TextEditingController dest = TextEditingController();
TextEditingController offer = TextEditingController();

class addDetailClient extends StatefulWidget {
  String currentUserID;
  addDetailClient(this.currentUserID);
  @override
  State<addDetailClient> createState() => _addDetailClientState();
}

class _addDetailClientState extends State<addDetailClient>
    with TickerProviderStateMixin {
  AnimationController controller;
  bool inProgress = false;
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  Widget build(BuildContext context) {
    print("add client : " + widget.currentUserID);
    void func() async {
      inProgress = true;
      var x = DonaloPostClient(
          cusName: name.text,
          offeredRate: int.parse(offer.text),
          ports: double.parse(ports.text),
          dest: dest.text);
      await PostDataClient().post(x).then((value) {
        print('$value');
        Navigator.push(
            (context),
            MaterialPageRoute(
                builder: (context) => ClientScreen(widget.currentUserID)));
        inProgress = false;
      });
    }

    return Column(
      children: [
        AppTextForm(cont: name, s: "Enter client name", obscure: false),
        SizedBox(height: 30),
        AppTextForm(cont: ports, s: "Available ports", obscure: false),
        SizedBox(height: 30),
        AppTextForm(cont: dest, s: "Destination", obscure: false),
        SizedBox(height: 30),
        AppTextForm(cont: offer, s: "offered rate", obscure: false),
        SizedBox(height: 30),
        SizedBox(height: 40),
        CustomButton(
            inProgress
                ? CircularProgressIndicator(
                    value: controller.value,
                    semanticsLabel: "Linear progress indicator",
                  )
                : Text("Add new Customer"),
            func)
      ],
    );
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }
}