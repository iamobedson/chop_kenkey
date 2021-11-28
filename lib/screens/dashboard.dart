// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chop_kenkey/blocs/category/category_bloc.dart';
import 'package:chop_kenkey/blocs/product/product_bloc.dart';
import 'package:chop_kenkey/menu_pages/privacy_policy.dart';
import 'package:chop_kenkey/menu_pages/send_feedback.dart';
import 'package:chop_kenkey/menu_pages/settings.dart';
import 'package:chop_kenkey/screens/profile.dart';
import 'package:chop_kenkey/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_screen.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "/dashboard";

  const Dashboard({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => Dashboard(),
    );
  }

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final orangeColor = Color(0xffe8730d);
  @override
  Widget build(BuildContext context) {
    //final List<ItemCard> itemslist = ItemCard.items.where((items) => items == ItemCard.items).toList();
    return Scaffold(
      appBar: CustomAppBar(title: 'Dashboard'),
      drawer: Drawer(
        child: Material(
          color: Colors.grey[200],
          child: ListView(
            children: [
              MyHeaderDrawer(),
              SizedBox(height: 10),
              buildmenuItem(
                icon: Icons.people,
                text: 'Profile',
                onClicked: () => selectedItem(context, 0),
              ),
              SizedBox(height: 10),
              buildmenuItem(
                icon: Icons.shopping_cart_outlined,
                text: 'Cart',
                onClicked: () => selectedItem(context, 1),
              ),
              SizedBox(height: 10),
              buildmenuItem(
                icon: Icons.settings,
                text: 'Settings',
                onClicked: () => selectedItem(context, 2),
              ),
              SizedBox(height: 10),
              buildmenuItem(
                icon: Icons.feedback_outlined,
                text: 'Send Feedback',
                onClicked: () => selectedItem(context, 3),
              ),
              SizedBox(height: 10),
              buildmenuItem(
                icon: Icons.policy_outlined,
                text: 'Privacy Policy',
                onClicked: () => selectedItem(context, 4),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.8,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: state.categories
                      .map((category) => HeroCarouselCard(category: category))
                      .toList(),
                );
              } else {
                return Text('Something went wrong.');
              }
            },
          ),
          SectionTitle(title: 'RECCOMENDED'),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products
                      .where((product) => product.isRecommended)
                      .toList(),
                );
              } else {
                return Text('Something went wrong.');
              }
            },
          ),
          SectionTitle(title: 'POPULAR'),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products
                      .where((product) => product.isPopular)
                      .toList(),
                );
              } else {
                return Text('Something went wrong.');
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  buildmenuItem({String? text, IconData? icon, VoidCallback? onClicked}) {
    final color = Colors.black;
    final hoverColor = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text!, style: TextStyle(fontSize: 16.0, fontFamily: 'Trueno')),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Profile(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CartScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Settings(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SendFeedback(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PrivacyPolicy(),
        ));
        break;
    }
  }
}
