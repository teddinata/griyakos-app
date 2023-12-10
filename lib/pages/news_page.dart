import 'package:flutter/material.dart';
import 'package:griyakos/theme.dart';
import 'package:griyakos/widgets/news_card.dart'; // Assume you have a NewsCard widget
import 'package:griyakos/widgets/bottom_navbar_item.dart'; // Assume you have a BottomNavbarItem widget

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for news articles
    List<Map<String, dynamic>> dummyNews = [
      {
        'id': 1,
        'title': 'Exploring Backpacker-Friendly Accommodations in Cilacap',
        'image': 'assets/images/city1.png',
        'date': 'December 15, 2023',
        'content':
            'Discover budget-friendly accommodations for backpackers in Cilacap. From cozy hostels to affordable guesthouses, find the perfect place for your stay.'
      },
      {
        'id': 2,
        'title': 'Top 5 Must-Visit Spots for Backpackers in Cilacap',
        'image': 'assets/images/city2.png',
        'date': 'December 18, 2023',
        'content':
            'Explore the hidden gems of Cilacap! From picturesque landscapes to vibrant markets, these are the must-visit spots for backpackers.'
      },
    ];

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(edge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: edge),
              Text(
                'News & Blogs',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
              SizedBox(height: 2),
              Text(
                'Explore the latest updates on travel and accommodations in Cilacap for backpackers.',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: dummyNews.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: NewsCard(
                        id: dummyNews[index]['id'],
                        title: dummyNews[index]['title'],
                        image: dummyNews[index]['image'],
                        date: dummyNews[index]['date'],
                        content: dummyNews[index]['content'],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/images/Icon_home_solid.png',
                isActive: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/all-spaces', (route) => false);
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/images/icon_mail.png',
                isActive: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/news', (route) => false);
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/images/Icon_card_solid.png',
                isActive: true,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/wishlist', (route) => false);
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/images/icon_love.png',
                isActive: false,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
