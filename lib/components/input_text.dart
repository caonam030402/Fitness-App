import 'package:fitness_app/styles/app_colors.dart';
import 'package:fitness_app/styles/app_styles.dart';
import 'package:fitness_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<String> list = <String>['Male', 'Female', 'Other'];

class InputText extends StatefulWidget {
  final TextInputType? keyboardType;
  final String icon;
  final String lable;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;

  final String? Function(String?)? validator;
  final bool hiddenValue;
  final bool? containerWidth;
  const InputText({
    super.key,
    required this.lable,
    required this.icon,
    this.keyboardType,
    this.hiddenValue = false,
    this.containerWidth = false,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.controller,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
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
              width: widget.containerWidth == false
                  ? (MediaQuery.of(context).size.width -
                      (AppStyles.paddingBothSidesPage * 2))
                  : (MediaQuery.of(context).size.width -
                      (AppStyles.paddingBothSidesPage * 2) -
                      58),
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
                    onChanged: widget.onChanged,
                    validator: (value) {
                      final error = widget.validator?.call(value);

                      setState(() {
                        _errorMessage = error;
                      });

                      return error;
                    },
                    style: AppText.small,
                    controller: widget.controller,
                    onSaved: widget.onSaved,
                    obscureText: widget.hiddenValue,
                    keyboardType: widget.keyboardType,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: error0 ? null : widget.lable,
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
