import 'package:flutter/material.dart';
import 'package:griyakos/theme.dart';
import 'package:griyakos/widgets/bottom_navbar_item.dart'; // Assume you have a BottomNavbarItem widget
import 'package:griyakos/widgets/wishlist_item.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for wishlist spaces
    List<Map<String, dynamic>> dummyWishlist = [
      {
        'id': 1,
        'name': 'Cozy Room near Cilacap Square',
        'image': 'assets/images/kos1.png',
        'price': 350000,
        'city': 'Cilacap',
        'isPopular': false,
      },
      {
        'id': 2,
        'name': 'Simple Studio Apartment in Purwokerto',
        'image': 'assets/images/kos2.png',
        'price': 450000,
        'city': 'Purwokerto',
        'isPopular': false,
      },
      // Add more wishlist items as needed
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
                'Wishlist',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
              SizedBox(height: 2),
              Text(
                'Explore your saved spaces',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: dummyWishlist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: WishlistItem(
                        id: dummyWishlist[index]['id'],
                        name: dummyWishlist[index]['name'],
                        imageUrl: dummyWishlist[index]['image'],
                        price: dummyWishlist[index]['price'],
                        city: dummyWishlist[index]['city'],
                        isPopular: dummyWishlist[index]['isPopular'],
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
                imageUrl: 'assets/images/icon_card.png',
                isActive: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/wishlist', (route) => false);
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/images/Icon_love_solid.png',
                isActive: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
