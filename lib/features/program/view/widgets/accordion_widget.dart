// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:sedekah_rombongan_flutter/core/models/program_model.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/widgets/donation_data.dart';

class AccordionWidget extends ConsumerStatefulWidget {
  final ProgramModel program;
  const AccordionWidget({
    super.key,
    required this.program,
  });

  @override
  ConsumerState<AccordionWidget> createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends ConsumerState<AccordionWidget> {
  final List<bool> _indexPage = [false, false];
  int coutnDonatur = 0;

  // void _writeCountDonatur(int val) {
  //   setState(() {
  //     coutnDonatur = val;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
              backgroundColor: Pallete.whiteColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return const ListTile(
                  title: Text(
                    "Keterangan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                );
              },
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: HtmlWidget(widget.program.deskripsi),
              ),
              isExpanded: _indexPage[0],
            ),
            ExpansionPanel(
              backgroundColor: Pallete.whiteColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return const ListTile(
                  title: Text(
                    "Donatur",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                );
              },
              body: const Padding(
                padding: EdgeInsets.all(20),
                child: DonationData(),
              ),
              isExpanded: _indexPage[1],
            ),
          ],
        ),
      ),
    );
  }
}
