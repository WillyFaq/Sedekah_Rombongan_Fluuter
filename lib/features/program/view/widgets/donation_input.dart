import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:sedekah_rombongan_flutter/core/theme/app_pallete.dart';

class DonationInput extends StatefulWidget {
  final MoneyMaskedTextController jmlController;
  final Function(double) onChangeInput;
  const DonationInput({
    super.key,
    required this.jmlController,
    required this.onChangeInput,
  });

  @override
  State<DonationInput> createState() => _DonationInputState();
}

class _DonationInputState extends State<DonationInput> {
  int indexBtn = 2;

  @override
  void initState() {
    super.initState();
    widget.jmlController.updateValue(100000);
    widget.jmlController.addListener(() {
      widget.onChangeInput(widget.jmlController.numberValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            BtnChoose(
              onClick: () => _setIndexBtn(1),
              selected: indexBtn == 1,
              title: "Rp 50rb",
            ),
            BtnChoose(
              onClick: () => _setIndexBtn(2),
              selected: indexBtn == 2,
              title: "Rp 100rb",
              subTitle: "sering dipilih",
            ),
            BtnChoose(
              onClick: () => _setIndexBtn(3),
              selected: indexBtn == 3,
              title: "Rp 500rb",
            ),
            BtnChoose(
              onClick: () => _setIndexBtn(4),
              selected: indexBtn == 4,
              title: "Rp 1jt",
            ),
            BtnChoose(
              onClick: () => _setIndexBtn(5),
              selected: indexBtn == 5,
              title: "Nominal",
              subTitle: "lainnya",
            ),
          ],
        ),
        const SizedBox(height: 20),
        Visibility(
          maintainSize: false,
          maintainAnimation: true,
          maintainState: true,
          visible: indexBtn == 5,
          child: TextFormField(
            controller: widget.jmlController,
            decoration: const InputDecoration(
              hintText: "Masukan Nominal",
              contentPadding: EdgeInsets.all(15),
            ),
            validator: (val) {
              if (val!.trim().isEmpty) {
                return "nominal is missing!";
              }
              if (widget.jmlController.numberValue < 10000) {
                return "Mohon maaf,";
              }
              return null;
            },
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  _setIndexBtn(int i) {
    setState(() {
      indexBtn = i;
      double valtochange = 0;
      if (i == 1) {
        valtochange = 50000;
      } else if (i == 2) {
        valtochange = 100000;
      } else if (i == 3) {
        valtochange = 500000;
      } else if (i == 4) {
        valtochange = 1000000;
      } else {
        valtochange = 100000;
      }
      widget.jmlController.updateValue(valtochange);
      widget.onChangeInput(valtochange);
    });
  }
}

class BtnChoose extends StatelessWidget {
  final VoidCallback onClick;
  final bool selected;
  final String title;
  final String? subTitle;
  const BtnChoose({
    super.key,
    required this.onClick,
    required this.selected,
    required this.title,
    this.subTitle = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          height: 60,
          width: 110,
          decoration: BoxDecoration(
            color: Pallete.whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: selected
                ? Border.all(
                    width: 2,
                    color: Pallete.greenColor,
                  )
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: 2,
                top: 2,
                child: checkIcon(),
              ),
              Center(
                child: genTitle(),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: genTitle(),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget checkIcon() {
    if (!selected) {
      return const SizedBox();
    }
    return const CircleAvatar(
      radius: 8,
      backgroundColor: Pallete.greenColor,
      child: Icon(
        Icons.check,
        color: Pallete.whiteColor,
        size: 10,
      ),
    );
  }

  Widget genTitle() {
    if (subTitle == "") {
      return Text(
        title,
        style: const TextStyle(
          color: Pallete.backgroundColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      );
    }
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: title,
        style: const TextStyle(
          color: Pallete.backgroundColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: "\n$subTitle",
            style: const TextStyle(
              color: Pallete.greyColor,
              fontWeight: FontWeight.normal,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
