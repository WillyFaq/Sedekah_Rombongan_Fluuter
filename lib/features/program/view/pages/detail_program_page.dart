import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sedekah_rombongan_flutter/core/models/program_model.dart';
import 'package:sedekah_rombongan_flutter/core/providers/current_user_notifier.dart';
import 'package:sedekah_rombongan_flutter/core/providers/other_provider.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/loader.dart';
import 'package:sedekah_rombongan_flutter/features/auth/view/pages/login_page.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/pages/donation_page.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/widgets/accordion_widget.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/widgets/comment_data.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/widgets/donation_button.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/widgets/program_info.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/widgets/share_button.dart';
import 'package:sedekah_rombongan_flutter/features/program/viewmodel/detail_program_viewmodel.dart';
import 'package:share_plus/share_plus.dart';

class DetailProgramPage extends ConsumerStatefulWidget {
  const DetailProgramPage({super.key});

  @override
  ConsumerState<DetailProgramPage> createState() => _DetailProgramPageState();
}

class _DetailProgramPageState extends ConsumerState<DetailProgramPage> {
  late ScrollController _scrollController;
  Color _textColor = Colors.white;
  static const kExpandedHeight = 200.0;

  late ProgramModel detProg;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded
              ? Pallete.backgroundColor
              : Pallete.whiteColor;
        });
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserNotifierProvider);
    String slug = ref.watch(slugProgram);
    var isLoading = 1;
    final gdpp = ref.watch(getDetailProgramProvider(slug));
    gdpp.when(
      data: (data) {
        isLoading = 2;
        detProg = data;
      },
      error: (error, stackTrace) {
        isLoading = 0;
      },
      loading: () {
        isLoading = 1;
      },
    );
    return SafeArea(
      child: Scaffold(
        body: isLoading <= 1 ? stsPage(isLoading) : mainView(),
        bottomNavigationBar: isLoading <= 1
            ? null
            : BottomAppBar(
                color: Pallete.whiteColor,
                height: 68,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ShareButton(
                        onTap: () async {
                          String shr =
                              "${detProg.judul}\nDonasi Terkumpul ${detProg.idrJumlah} dari ${detProg.targetDana}\n";
                          await Share.share(
                            '$shr \nAyo Donasi Sekarang! \n https://sedekahrombongan.com/campaign/$slug',
                            subject: 'Ayo Donasi Sekarang!',
                          );
                        },
                      ),
                      DonationButton(
                        onTap: () {
                          if (detProg.jumlah >= detProg.targetDana) {
                            return;
                          }
                          if (currentUser == null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DonationPage(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget mainView() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          title: _isSliverAppBarExpanded
              ? Text(
                  detProg.judul,
                  style: const TextStyle(fontSize: 13),
                )
              : null,
          backgroundColor: Pallete.whiteColor,
          expandedHeight: 200,
          pinned: true,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            background: CachedNetworkImage(
              imageUrl: detProg.gambar,
              fit: BoxFit.cover,
            ),
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
            ],
          ),
          leadingWidth: 80.0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: Icon(
                Icons.home,
                color: _textColor,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProgramInfo(
                program: detProg,
              ),
              spacerman(),
              // ATabWidget(
              //   program: detProg,
              // ),
              AccordionWidget(program: detProg),
              spacerman(),
              const CommentData(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget spacerman() {
    return Container(
      height: 20,
      decoration: const BoxDecoration(
        color: Pallete.backgroundColor2,
      ),
    );
  }

  Widget stsPage(sts) {
    if (sts == 1) {
      return const Loader();
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Lottie.asset("assets/anim/error.json"),
        ],
      ),
    );
  }
}
