import 'package:flutter/material.dart';
import 'package:yummie/widgets/page_indicator.dart'; // Doğru yolu sağladığınızdan emin olun

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0; // Sayfa durumunu tutacak değişken

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page; // Sayfa değiştiğinde durumu güncelle
                });
              },
              children: <Widget>[
                OnboardingPage(
                  image: 'assets/slide1.png', // Hamburger image
                  title: 'Delicious Dishes',
                  description: 'Experience a variety of amazing dishes from different cultures around the world.',
                ),
                OnboardingPage(
                  image: 'assets/slide2.png', // Chef image
                  title: 'World-Class Chefs',
                  description: 'Our dishes are prepared by only the best.',
                ),
                OnboardingPage(
                  image: 'assets/slide3.png', // Table setting image
                  title: 'Fine Dining',
                  description: 'Enjoy fine dining experience with our exclusive services.',
                ),
              ],
            ),
          ),
          PageIndicator(currentValue: _currentPage), // PageIndicator'a geçerli sayfa bilgisini gönder
          SizedBox(height: 20),
          // NextButton() ve diğer elemanlar burada olabilir
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  OnboardingPage({
    required this.image,
    required this.title, 
    required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Spacer(),
        Image.asset(image, height: 300),
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
