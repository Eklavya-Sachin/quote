import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'components/gradient_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black87,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                "Choose any one",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
            ),
            GradientButton(
              buttonText: 'Search Author Quote',
              onTap: controller.goToAuthorQuoteSearch,
              buttonGradientColors: const <Color>[
                Colors.black54,
                Color.fromARGB(255, 206, 112, 19),
              ],
            ),
            GradientButton(
              buttonText: 'Search Any Quote',
              onTap: controller.goToQuotesSearch,
              buttonGradientColors: const <Color>[
                Colors.black54,
                Color.fromARGB(255, 12, 43, 97)
              ],
            ),
            GradientButton(
              buttonText: 'Favourite Quote',
              onTap: controller.goToFavouriteQuotes,
              buttonGradientColors: const <Color>[
                Colors.black54,
                Color.fromARGB(255, 222, 45, 104)
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
