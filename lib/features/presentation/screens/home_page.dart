import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/features/presentation/screens/news_details_page.dart';

import '../../data/models/news_item_model.dart';
import '../widgets/custom_carousel_card.dart';
import '../widgets/recommendation_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            const CustomCarouselCard(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Recommendation',
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
            ...news
                .map(
                  (newsItem) => Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: InkWell(
                      onTap: () {
                        final index = news.indexOf(newsItem);
                        Navigator.of(context, rootNavigator: true)
                            .push(
                              CupertinoPageRoute(
                                builder: (_) => NewsDetailsPage(index: index),
                              ),
                            )
                            .then((value) => setState(
                                  () {},
                                ));
                      },
                      child: RecommendationListItem(newsItem: newsItem),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
