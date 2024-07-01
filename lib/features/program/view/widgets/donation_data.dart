import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/core/models/donation_model.dart';
import 'package:sedekah_rombongan_flutter/core/providers/other_provider.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/load_more_button.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/loader.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/widgets/donation_card.dart';
import 'package:sedekah_rombongan_flutter/features/program/viewmodel/detail_program_viewmodel.dart';

class DonationData extends ConsumerStatefulWidget {
  const DonationData({
    super.key,
  });

  @override
  ConsumerState<DonationData> createState() => _DonationDataState();
}

class _DonationDataState extends ConsumerState<DonationData> {
  int curpage = 1;
  int odlCurpage = 0;
  List<DonationModel> donationList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String slug = ref.watch(slugProgram);
    final resAsync = ref.watch(GetDonationsProvider(slug, curpage));
    Widget dataw = resAsync.when(
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: dataw,
      ),
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
              final cmn = donationList[index];
              return DonationCard(
                data: cmn,
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
