import 'package:flutter/material.dart';
import 'package:sedekah_rombongan_flutter/core/models/donation_model.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';

class DonationCard extends StatelessWidget {
  final DonationModel data;
  const DonationCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Pallete.whiteColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Pallete.greyColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.user,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    data.waktu,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: "Berdonasi sebesar ",
                    style: const TextStyle(
                      color: Pallete.backgroundColor,
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                    children: [
                      TextSpan(
                        text: data.idrJumlah,
                        style: const TextStyle(
                          color: Pallete.backgroundColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
