import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sedekah_rombongan_flutter/core/providers/current_user_notifier.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';
import 'package:sedekah_rombongan_flutter/core/utils.dart';
import 'package:sedekah_rombongan_flutter/features/program/viewmodel/detail_program_viewmodel.dart';

class CommentForm extends ConsumerStatefulWidget {
  final String slug;
  const CommentForm({
    super.key,
    required this.slug,
  });

  @override
  ConsumerState<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends ConsumerState<CommentForm> {
  final doaController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool sedekaholic = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    doaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserNotifierProvider);
    return currentUser == null
        ? const SizedBox(height: 20)
        : Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 4,
                    controller: doaController,
                    decoration: const InputDecoration(
                      hintText: "Tuliskan pesan atau doa disini",
                      contentPadding: EdgeInsets.all(15),
                    ),
                    validator: (val) {
                      if (val!.trim().isEmpty) {
                        return "Pesan is missing!";
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sembunyikan nama saya (Sedekaholic)",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Switch(
                        activeColor: Pallete.greenColor,
                        splashRadius: 50.0,
                        value: sedekaholic,
                        onChanged: (val) {
                          setState(() {
                            sedekaholic = val;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await ref.read(aminCommentProvider.notifier).goComment(
                              slug: widget.slug,
                              doa: doaController.text,
                              anonim: sedekaholic,
                              token: currentUser.token,
                            );
                        doaController.text = "";
                      } else {
                        showSnackBar(context, 'Missing fields!');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      backgroundColor: Pallete.mainColor,
                    ),
                    child: const Text(
                      "Kirim",
                      style: TextStyle(
                        color: Pallete.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
