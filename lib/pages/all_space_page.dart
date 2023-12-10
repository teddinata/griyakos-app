import 'package:flutter/material.dart';
import 'package:griyakos/models/space.dart';
import 'package:griyakos/provider/space_provider.dart';
import 'package:griyakos/theme.dart';
import 'package:griyakos/widgets/space_card.dart';
import 'package:griyakos/widgets/bottom_navbar_item.dart'; // Import the BottomNavbarItem widget
import 'package:provider/provider.dart';

class AllSpacesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

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
                'Daftar Semua Kos',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
              SizedBox(height: 2),
              Text(
                'Temukan Kos yang Tersedia',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(height: 30),
              Expanded(
                child: FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return Center(
                        child: Text('No data available'),
                      );
                    } else {
                      List<Space> spaces = snapshot.data as List<Space>;

                      return ListView.builder(
                        itemCount: spaces.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: SpaceCard(spaces[index]),
                          );
                        },
                      );
                    }
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
                imageUrl: 'assets/images/icon_mail_solid.png',
                isActive: true,
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
