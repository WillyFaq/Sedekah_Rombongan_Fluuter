import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:sedekah_rombongan_flutter/core/models/program_model.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/widgets/donation_data.dart';

class ATabWidget extends StatefulWidget {
  final ProgramModel program;
  const ATabWidget({
    super.key,
    required this.program,
  });

  @override
  State<ATabWidget> createState() => _ATabWidgetState();
}

class _ATabWidgetState extends State<ATabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    // _tabController.addListener(() {
    // if (!_tabController.indexIsChanging) {
    // }
    //   setState(() {
    //     print("STATE CHANGE ${_tabController.index}");
    //     _selectedTab = _tabController.index;
    //   });
    // });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.program.deskripsi);
    final String desk = widget.program.deskripsi;
    // print(desk);
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (BuildContext context) {
          _tabController.addListener(() {
            if (!_tabController.indexIsChanging) {
              setState(() {
                _selectedTab = _tabController.index;
              });
            }
          });

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: TabBar(
                    unselectedLabelColor: Colors.blue,
                    labelColor: Colors.blue,
                    indicatorColor: Colors.white,
                    controller: _tabController,
                    labelPadding: const EdgeInsets.all(0.0),
                    tabs: [
                      _getTab(0, const Text("Keterangan")),
                      // _getTab(1, const Text("Kabar Terbaru")),
                      _getTab(1, const Text("Donatur")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: HtmlWidget(desk),
                        ),
                      ),
                      const DonationData(),
                      // Text(desk),
                      // Center(child: Text('Inbox Page')),
                      // const Center(child: Text('Archived Page')),
                      // Center(child: Text('Archived Page')),
                      // const SizedBox(height: 900)
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _getTab(index, child) {
    return Tab(
      child: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            // borderRadius: _generateBorderRadius(index),
            border: _generateBorder(index),
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }

  _generateBorder(index) {
    if (index == _selectedTab) {
      return const Border(
        top: BorderSide(width: 1, color: Pallete.greyColor),
        right: BorderSide(width: 1, color: Pallete.greyColor),
        left: BorderSide(width: 1, color: Pallete.greyColor),
      );
    } else {
      return null;
    }
  }
}
