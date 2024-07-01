import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:sedekah_rombongan_flutter/core/models/comment_model.dart';
import 'package:sedekah_rombongan_flutter/core/providers/other_provider.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/core/utils.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/load_more_button.dart';
import 'package:sedekah_rombongan_flutter/core/widgets/loader.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/widgets/comment_card.dart';
import 'package:sedekah_rombongan_flutter/features/program/view/widgets/comment_form.dart';
import 'package:sedekah_rombongan_flutter/features/program/viewmodel/detail_program_viewmodel.dart';

class CommentData extends ConsumerStatefulWidget {
  const CommentData({super.key});

  @override
  ConsumerState<CommentData> createState() => _CommentDataState();
}

class _CommentDataState extends ConsumerState<CommentData> {
  int curpage = 1;
  int oldCurpage = 0;
  int totData = 0;
  List<CommentModel> commentList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    String slug = ref.watch(slugProgram);
    final resAsync = ref.watch(GetCommentsProvider(slug, curpage));

    ref.listen(aminCommentProvider, (_, next) {
      next?.when(
        data: (data) {
          bool nofound = true;
          for (int i = 0; i < commentList.length; i++) {
            if (commentList[i].id == data.id) {
              setState(() {
                commentList[i] = data;
              });
              nofound = false;
              break;
            }
          }
          if (nofound) {
            setState(() {
              commentList.insert(0, data);
            });
          }
        },
        error: (error, st) {
          showSnackBar(context, error.toString());
        },
        loading: () {},
      );
    });

    Widget dataw = resAsync.when(
      data: (progs) {
        print("WHEN DATA ------------>");
        if (curpage != oldCurpage) {
          oldCurpage = curpage;
          commentList.addAll(progs.data);
        }
        if (commentList.isEmpty) {
          return notFound();
        }
        setState(() {
          totData = progs.meta["total"];
        });
        int isLod = commentList.length >= progs.meta["total"] ? 2 : 1;
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
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                (totData > 0)
                    ? "Doa-doa orang baik (${totData.toString()})"
                    : "Doa-doa orang baik",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Pallete.backgroundColor4,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: dataw,
            ),
          ),
          CommentForm(
            slug: slug,
          ),
        ],
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
            itemCount: commentList.length,
            itemBuilder: (context, index) {
              final cmn = commentList[index];
              return CommentCard(
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

  String buildTitle() {
    if (totData == 0) {
      return "Doa-doa orang baik";
    }
    return "Doa-doa orang baik ($totData)";
  }
}
