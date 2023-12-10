import 'package:flutter/material.dart';
import 'package:griyakos/theme.dart';
import 'package:griyakos/widgets/bottom_navbar_item.dart'; // Assume you have a BottomNavbarItem widget

class WishlistItem extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  final int price;
  final String city;
  final bool isPopular;

  WishlistItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.city,
    required this.isPopular,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '$city - \$${price.toString()}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for wishlist spaces
    List<Map<String, dynamic>> dummyWishlist = [
      {
        'id': 1,
        'name': 'Cozy Room near Cilacap Square',
        'image': 'assets/images/space1.jpg',
        'price': 350000,
        'city': 'Cilacap',
        'isPopular': false,
      },
      {
        'id': 2,
        'name': 'Simple Studio Apartment in Purwokerto',
        'image': 'assets/images/space2.jpg',
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
      bottomNavigationBar: Container(
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
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_home.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_card.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}
