import 'package:flutter/material.dart';
import 'package:yummie/screens/home_page.dart';
import 'package:yummie/widgets/page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void nextPage() {
    if (_currentPage < 2) {
      // Toplam sayfa sayısından bir eksik
      _pageController.nextPage(
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  void continueToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

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
                  _currentPage = page;
                });
              },
              children: <Widget>[
                OnboardingPage(
                  image: 'assets/slide1.png',
                  width: 300,
                  height: 300,
                  title: 'Delicious Dishes',
                  description:
                      'Experience a variety of amazing dishes from different cultures around the world.',
                ),
                OnboardingPage(
                  image: 'assets/slide2.png',
                  width: 250,
                  height: 300,
                  title: 'World-Class Chefs',
                  description: 'Our dishes are prepared by only the best.',
                ),
                OnboardingPage(
                  image: 'assets/slide3.png',
                  width: 300,
                  height: 300,
                  title: 'Fine Dining',
                  description:
                      'Enjoy fine dining experience with our exclusive services.',
                ),
              ],
            ),
          ),
          PageIndicator(currentValue: _currentPage),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed:
                      _currentPage == 2 ? continueToNextScreen : nextPage,
                  child: Text(_currentPage == 2 ? 'Continue' : 'Next'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final String title;
  final String description;

  OnboardingPage(
      {required this.image,
      required this.width,
      required this.height,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Spacer(),
        Image.asset(image, width: width, height: height),
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
