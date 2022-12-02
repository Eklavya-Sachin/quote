import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.buttonGradientColors,
  });

  final String buttonText;
  final void Function() onTap;
  final List<Color> buttonGradientColors;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        height: Get.height * .2,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: buttonGradientColors,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
