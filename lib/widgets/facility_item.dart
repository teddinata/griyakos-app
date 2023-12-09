import 'package:flutter/material.dart';
import 'package:griyakos/theme.dart';

class FacilityItem extends StatelessWidget {
  final String? name;
  final String? imageUrl;
  final int total;

  FacilityItem({this.imageUrl, this.name, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl ??
              'default_image_path', // Memberikan nilai default jika imageUrl null
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '$total',
            style: purpleTextStyle.copyWith(
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: '$name' ??
                    'Default Name', // Memberikan nilai default jika name null
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
