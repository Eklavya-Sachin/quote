import 'package:get/get.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final String title;
  final String text;
  final void Function() onFavoriteTap;

  const QuoteCard({
    super.key,
    required this.title,
    required this.text,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      width: Get.width,
      height: Get.height * .25,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: const DecorationImage(
          image: AssetImage(
            'images/quote_background.jpeg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: onFavoriteTap,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
