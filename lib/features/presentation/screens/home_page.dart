import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
  ];

  double currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Breaking News',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'View All',
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index, int realIdx) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    images[index],
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                height: 300,
                aspectRatio: 16 / 9,
                viewportFraction:
                    0.8, // increase the viewportFraction to make the carousel wider
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndexPage = index.toDouble();
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            DotsIndicator(
              dotsCount: images.length,
              position: currentIndexPage,
              decorator: DotsDecorator(
                size: const Size.square(8),
                activeSize: const Size(20, 8),
                color: Colors.grey,
                activeColor: Colors.blue,
                shape: const Border(),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
