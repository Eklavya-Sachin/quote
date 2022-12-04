import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final void Function(String) search;
  final void Function()? onCancellingSearch;
  final bool readOnly;
  final bool isAlsoSearchOnChange;
  final String? hintText;
  final TextEditingController controller;
  final RxBool _isShowClearTextIcon = false.obs;
  final TextInputType? keyboardType;

  SearchTextField({
    Key? key,
    required this.search,
    this.readOnly = false,
    this.isAlsoSearchOnChange = false,
    this.hintText,
    this.onCancellingSearch,
    required this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      readOnly: readOnly,
      cursorColor: Colors.black,
      onFieldSubmitted: search,
      onChanged: (value) {
        if (isAlsoSearchOnChange) {
          search(value);
        }
        if (value.isNotEmpty) {
          _isShowClearTextIcon.value = true;
        } else {
          _isShowClearTextIcon.value = false;
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: .3, color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: .3, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: .3, color: Colors.black),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintText: hintText ?? 'Search...',
        suffixIcon: Obx(
          () => SizedBox(
            width: Get.width * .35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_isShowClearTextIcon.value)
                  IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.black.withOpacity(.7),
                    ),
                    onPressed: () {
                      controller.clear();
                      _isShowClearTextIcon.value = false;
                      FocusManager.instance.primaryFocus!.unfocus();
                      if (onCancellingSearch != null) {
                        onCancellingSearch!();
                      }
                    },
                  ),
                if (_isShowClearTextIcon.value)
                  Container(
                    width: 1,
                    height: 25,
                    color: Colors.black.withOpacity(.5),
                  ),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    FocusManager.instance.primaryFocus!.unfocus();
                    search(controller.text);
                  },
                ),
                const SizedBox(width: 5)
              ],
            ),
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
