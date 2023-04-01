import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:house_rental_app/Constants.dart';
import 'package:house_rental_app/Profile-Service/Views/shared/PurchaseCard.dart';

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: const Text(
          "Purchase History",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {},
                        child: Container(
                            height: 180,
                            margin: EdgeInsets.only(
                                top: 30, left: 10, bottom: 10, right: 10),
                            child: PurchaseCard()));
                  }))
        ],
      ),
    );
  }
}
