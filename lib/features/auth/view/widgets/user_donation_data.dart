import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/core/models/donation_model.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/load_more_button.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/loader.dart';
import 'package:sedekah_rombongan_flutter/features/auth/view/widgets/user_donation_card.dart';
import 'package:sedekah_rombongan_flutter/features/auth/viewmodel/auth_viewmodel.dart';

class UserDonationData extends ConsumerStatefulWidget {
  const UserDonationData({super.key});

  @override
  ConsumerState<UserDonationData> createState() => _UserDonationDataState();
}

class _UserDonationDataState extends ConsumerState<UserDonationData> {
  int curpage = 1;
  int odlCurpage = 0;
  List<DonationModel> donationList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    final resAsync = ref.watch(GetUserDonationsProvider(curpage));
    return resAsync.when(
      data: (progs) {
        if (curpage != odlCurpage) {
          odlCurpage = curpage;
          donationList.addAll(progs.data);
        }
        if (donationList.isEmpty) {
          return notFound();
        }
        int isLod = donationList.length >= progs.meta["total"] ? 2 : 1;
        return genList(isLod);
      },
      error: (error, st) {
        return Text(
          error.toString(),
        );
      },
      loading: () {
        return genList(0);
      },
    );
  }

  Widget genList(isloading) {
    return Column(
      children: [
        SizedBox(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: donationList.length,
            itemBuilder: (context, index) {
              final dataDons = donationList[index];
              return UserDonationCard(
                data: dataDons,
              );
            },
          ),
        ),
        bottomList(isloading),
      ],
    );
  }

  Widget bottomList(st) {
    if (st == 0) {
      return const Padding(
        padding: EdgeInsets.all(30),
        child: SizedBox(
          height: 200,
          child: Loader(),
        ),
      );
    } else if (st == 1) {
      return LoadMoreButton(onTap: () {
        setState(() {
          curpage = curpage + 1;
        });
      });
    } else {
      return const SizedBox(
        height: 100,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "No more data.",
          ),
        ),
      );
    }
  }

  Widget notFound() {
    return const SizedBox(
      height: 100,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "No data Found.",
        ),
      ),
    );
  }
}
