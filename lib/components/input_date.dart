import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class InputDate extends StatefulWidget {
  final icon;
  final label;
  final controller;
  final String? Function(String?)? validator;
  const InputDate(
      {super.key, this.icon, this.label, this.validator, this.controller});

  @override
  State<InputDate> createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  String? _errorMessage;
  @override
  Widget build(BuildContext context) {
    final error0 = _errorMessage != null;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 48,
              width: MediaQuery.of(context).size.width -
                  (AppStyles.paddingBothSidesPage * 2),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: error0
                          ? Colors.red.withOpacity(0.4)
                          : AppColors.white),
                  color:
                      error0 ? Colors.red.withOpacity(0.1) : AppColors.border,
                  borderRadius: BorderRadius.circular(14)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: SvgPicture.asset(widget.icon,
                        color: error0 ? Colors.red : AppColors.gray_1),
                  ),
                  Expanded(
                      child: TextFormField(
                    validator: (value) {
                      final error = widget.validator?.call(value);

                      setState(() {
                        _errorMessage = error;
                      });

                      return error;
                    },
                    style: AppText.small,
                    readOnly: true,
                    initialValue: null,
                    controller: widget.controller,
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1960),
                          lastDate: DateTime(2040));
                      if (pickeddate != null) {
                        setState(() {
                          widget.controller.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                    decoration: InputDecoration(
                        hintText: error0 ? null : widget.label,
                        errorStyle: const TextStyle(fontSize: 0.1, height: 0),
                        hintStyle: AppText.small.copyWith(
                            height: 2,
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray_2),
                        border: InputBorder.none),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 14,
              child: Text(
                error0 ? _errorMessage! : '',
                style: TextStyle(fontSize: error0 ? 12 : 0, color: Colors.red),
              ),
            )
          ],
        )
      ],
    );
  }
}
