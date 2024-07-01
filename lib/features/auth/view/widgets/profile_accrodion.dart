import 'package:flutter/material.dart';
import 'package:sedekah_rombongan_flutter/core/models/user_model.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/auth/view/widgets/user_donation_data.dart';

class ProfileAccrodion extends StatefulWidget {
  final UserModel currentUser;
  const ProfileAccrodion({
    super.key,
    required this.currentUser,
  });

  @override
  State<ProfileAccrodion> createState() => _ProfileAccrodionState();
}

class _ProfileAccrodionState extends State<ProfileAccrodion> {
  final List<bool> _indexPage = [false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Pallete.whiteColor,
      ),
      child: ExpansionPanelList(
        elevation: 0,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _indexPage[index] = isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return const ListTile(
                title: Text(
                  "Detail",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              );
            },
            body: Container(
              decoration: const BoxDecoration(
                color: Pallete.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _genField("Nomor Telepon", widget.currentUser.nomorTelepon),
                    const SizedBox(height: 20),
                    _genField("Alamat", widget.currentUser.alamat),
                  ],
                ),
              ),
            ),
            isExpanded: _indexPage[0],
          ),
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return const ListTile(
                title: Text(
                  "Donasi",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              );
            },
            body: Container(
              decoration: const BoxDecoration(
                color: Pallete.whiteColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: UserDonationData(),
              ),
            ),
            isExpanded: _indexPage[1],
          ),
        ],
      ),
    );
  }

  Widget _genField(String label, String val) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 14,
              color: Pallete.greyColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            val,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
