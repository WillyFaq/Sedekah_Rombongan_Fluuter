// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sedekah_rombongan_flutter/core/widgets/loader.dart';
import 'package:sedekah_rombongan_flutter/core/models/program_model.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/load_more_button.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/widgets/program_card.dart';
import 'package:sedekah_rombongan_flutter/features/home/viewmodel/home_viewmodel.dart';

class ProgramlistWidget extends ConsumerStatefulWidget {
  final String kat;
  const ProgramlistWidget({super.key, String kate = "0"}) : kat = kate;

  @override
  ConsumerState<ProgramlistWidget> createState() => _ProgramlistWidgetState();
}

class _ProgramlistWidgetState extends ConsumerState<ProgramlistWidget> {
  int curpage = 1;
  int pp = 0;
  String cariQry = "";
  String cariQryOld = "";
  List<ProgramModel> programList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    pp = ref.watch(categoryForProgram);
    cariQry = ref.watch(cariQuery);
    final resAsync = ref.watch(GetAllProgramsProvider(pp, curpage, cariQry));

    return resAsync.when(
      data: (progs) {
        if (cariQry != cariQryOld) {
          cariQryOld = cariQry;
          programList.clear();
        }
        programList.addAll(progs.data);
        if (programList.isEmpty) {
          return notFound();
        }
        int isLod = programList.length >= progs.meta["total"] ? 2 : 1;
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
            itemCount: programList.length,
            itemBuilder: (context, index) {
              final prog = programList[index];
              List<String> ldonatur = List.empty();
              ldonatur = [
                ...prog.donatur,
                '${prog.donasi >= 100 ? '99' : prog.donasi.toString()}+'
              ];
              return ProgramCard(
                image: prog.gambar,
                slug: prog.slug,
                title: prog.judul,
                donation: prog.idrJumlah,
                progres: prog.jumlah / prog.targetDana,
                donasi: prog.donasi,
                donatur: ldonatur,
              );
            },
          ),
        ),
        bottomList(isloading),
        // isloading
        //     ? const SizedBox(
        //         height: 100,
        //         child: Loader(),
        //       )
        //     : LoadMoreButton(onTap: () {
        //         setState(() {
        //           curpage = curpage + 1;
        //         });
        //       }),
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
