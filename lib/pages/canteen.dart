import 'package:flutter/material.dart';

class CanteenPage extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: ListView(controller: _scrollController, children: [
          _buildChineseSection(),
          _buildSandwichAndBurgersSection(),
          _buildSouthIndianSection(),
          _buildNorthIndianSection(),
          _buildLunchSection(),
          _buildEggSection(),
          _buildChatSection(),
          _buildDrinksSection(),
        ]));
  }

  Widget _buildFoodTile(String name, int price, {bool isFav = false}) {
    return ListTile(
        // dense: true,
        title: Row(children: [
          Text(
            name + " ",
          ),
          isFav
              ? Icon(
                  Icons.favorite,
                  size: 15,
                  color: Colors.pink,
                )
              : Container()
        ]),
        trailing: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.green),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text(
            '₹' + price.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  Widget _buildChineseSection() {
    return ExpansionTile(
        title: Text(
          "Chinese",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        children: [
          _buildFoodTile('Chinese Bhel', 30),
          _buildFoodTile('Manchurian', 30),
          _buildFoodTile('Fried Rice', 30),
          _buildFoodTile('Hakka Rice', 50),
          _buildFoodTile('Chinese Bhel', 30),
          _buildFoodTile('Bombay Bhel', 30, isFav: true),
          _buildFoodTile('Singapore Rice', 30),
          _buildFoodTile('Shezwan Rice', 30),
          _buildFoodTile('American Chopsy', 30),
          _buildFoodTile('Paneer Chilly', 40, isFav: true),
          _buildFoodTile('Triple Rice', 50),
        ]);
  }

  Widget _buildSandwichAndBurgersSection() {
    return ExpansionTile(
        title: Text(
          "Sandwiches & Burgers",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        children: [
          _buildFoodTile('Bread Butter', 10),
          _buildFoodTile('Veg Sandwich', 30),
          _buildFoodTile('Veg Grill Sandwich', 40),
          _buildFoodTile('Burger', 50),
          _buildFoodTile('Pizza', 55),
          _buildFoodTile('Vada Pav', 10, isFav: true),
          _buildFoodTile('Veg Puff', 10),
        ]);
  }

  Widget _buildSouthIndianSection() {
    return ExpansionTile(
        title: Text(
          "South Indian",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        children: [
          _buildFoodTile('Idly Sambhar', 20),
          _buildFoodTile('Vada Sambhar', 20),
          _buildFoodTile('Sada Dosa', 15),
          _buildFoodTile('Masala Dosa', 25),
          _buildFoodTile('Rava Sada Dosa', 30),
          _buildFoodTile('Rava Masala Dosa', 30),
          _buildFoodTile('Mysore Masala Dosa', 30, isFav: true),
          _buildFoodTile('Sada Uttapa', 30),
          _buildFoodTile('Tomato Uttapa', 30),
          _buildFoodTile('Onion Uttapa', 30),
          _buildFoodTile('Masala Uttapa', 35),
        ]);
  }

  Widget _buildNorthIndianSection() {
    return ExpansionTile(
        title: Text(
          "North Indian",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        children: [
          _buildFoodTile('Samosa', 10),
          _buildFoodTile('Kachori', 15),
          _buildFoodTile('Ragada Samosa', 15, isFav: true),
          _buildFoodTile('Sambhar Samosa', 15),
          _buildFoodTile('Chole Bhature', 30),
          _buildFoodTile('Khaman', 10),
          _buildFoodTile('Pohe', 10),
        ]);
  }

  Widget _buildLunchSection() {
    return ExpansionTile(
        title: Text(
          "Lunch",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        children: [
          _buildFoodTile('Lunch Plate', 35),
          _buildFoodTile('Roti Sabji', 20),
          _buildFoodTile('Dal Rice', 20),
        ]);
  }

  Widget _buildEggSection() {
    return ExpansionTile(
        title: Text(
          "Egg",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        children: [
          _buildFoodTile('Bread Omlet', 20),
          _buildFoodTile('Egg Bhurji', 20),
          _buildFoodTile('Egg Toast', 20),
          _buildFoodTile('Egg Half Fry', 20),
          _buildFoodTile('Egg Full Fry', 20),
          _buildFoodTile('Egg Noodles', 30),
          _buildFoodTile('Egg Rice', 40, isFav: true),
        ]);
  }

  Widget _buildChatSection() {
    return ExpansionTile(
        title: Text(
          "Chat",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        children: [
          ListTile(
            title: Text("RIP 😞"),
          )
        ]);
  }

  Widget _buildDrinksSection() {
    return ExpansionTile(
        title: Text(
          "Drinks",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        children: [
          _buildFoodTile('Tea', 5),
          _buildFoodTile('Coffee', 10),
          _buildFoodTile('Cold Drink', 15),
          _buildFoodTile('Bottled Water', 20),
        ]);
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: Icon(Icons.fastfood),
      backgroundColor: Color(0xff352245),
      title: Text(
        'Canteen',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
