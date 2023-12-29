import 'package:flutter/material.dart';
import 'package:griyakos/models/space.dart';
import 'package:griyakos/models/tips.dart';
import 'package:griyakos/models/city.dart';
import 'package:griyakos/provider/space_provider.dart';
import 'package:griyakos/theme.dart';
import 'package:griyakos/widgets/bottom_navbar_item.dart';
import 'package:griyakos/widgets/city_card.dart';
import 'package:griyakos/widgets/space_card.dart';
import 'package:griyakos/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            // NOTE : TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Temukan Kos Cozy Untukmu',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            // NOTE : POPULAR CITY

            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Kota Populer',
                style: regulerTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Cilacap',
                      imageUrl: 'assets/images/city1.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Purwokerto',
                      imageUrl: 'assets/images/city2.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Kebumen',
                      imageUrl: 'assets/images/city3.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 4,
                      name: 'Purbalingga',
                      imageUrl: 'assets/images/city4.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 5,
                      name: 'Banjarnegara',
                      imageUrl: 'assets/images/city5.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 6,
                      name: 'Pemalang',
                      imageUrl: 'assets/images/city6.png',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            //RECOMMENDED SPACE

            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Kos Rekomendasi',
                style: regulerTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Return a loading indicator while waiting for data
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    // Handle the error state
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    // Handle the case where data is not available
                    return Center(
                      child: Text('No data available'),
                    );
                  } else {
                    // Data is available, display it
                    List<Space> data = snapshot.data as List<Space>;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE : TIPS AND GUIDANCE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips',
                style: regulerTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      title: 'Cilacap Guidelines',
                      description:
                          'This is the description for Cilacap Guidelines.',
                      imageUrl: 'assets/images/tips1.png',
                      updatedAt: '28 Februari 2021',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 2,
                      title: 'Wisata di Cilacap',
                      description: 'Explore the beautiful places in Cilacap.',
                      imageUrl: 'assets/images/tips2.png',
                      updatedAt: '28 Februari 2021',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120 + edge,
            ),
          ],
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
                imageUrl: 'assets/images/icon_home.png',
                isActive: true,
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
