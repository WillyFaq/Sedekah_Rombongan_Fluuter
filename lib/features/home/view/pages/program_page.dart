import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/widgets/app_bar.dart';
import 'package:sedekah_rombongan_flutter/features/home/view/widgets/programlist_widget.dart';

class ProgramPage extends ConsumerWidget {
  const ProgramPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            // AppBar
            AppBarSR(),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Berikan Sedekah Terbaik!!!",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 20),
            ProgramlistWidget(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
