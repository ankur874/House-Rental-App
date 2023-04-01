import 'package:flutter/material.dart';

import 'package:house_rental_app/Property-Service/PropertyResponse.dart';

import '../../Models/RequestModel.dart';


class RequestTile extends StatelessWidget {
  final Request request;
  const RequestTile({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 23,
            foregroundImage: NetworkImage(request.propertyId!.photos![0].url!),
          ),
          const SizedBox(
            width: 18,
          ),
          Text(
            request.propertyId!.title!,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ))
        ],
      ),
    );
  }
}
