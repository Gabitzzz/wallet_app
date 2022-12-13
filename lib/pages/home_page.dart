import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/util/my_button.dart';
import 'package:wallet_app/util/my_card.dart';
import 'package:wallet_app/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(Icons.monetization_on, size: 32,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home, size: 32, color: Colors.pink[200],),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings, size: 32,),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),

                  // plus button
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.grey[400], shape: BoxShape.circle),
                      child: Icon(Icons.add)),
                ],
              ),
            ),

            SizedBox(height: 25),

            // cards
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.deepPurple[400],
                  ),
                  MyCard(
                    balance: 9420.90,
                    cardNumber: 2222566,
                    expiryMonth: 04,
                    expiryYear: 23,
                    color: Colors.blue[400],
                  ),
                  MyCard(
                    balance: 485.12,
                    cardNumber: 44440000,
                    expiryMonth: 02,
                    expiryYear: 26,
                    color: Colors.green[400],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade800),
            ),

            SizedBox(
              height: 25,
            ),

            // 3 buttons -> SEND + PAY + BILLS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // send button
                  MyButton(
                    iconImagePath: 'lib/images/send-money.png',
                    buttonText: 'Send',
                  ),

                  // pay button
                  MyButton(
                    iconImagePath: 'lib/images/credit-card.png',
                    buttonText: 'Pay',
                  ),

                  // bills button
                  MyButton(
                    iconImagePath: 'lib/images/invoice.png',
                    buttonText: 'Bills',
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),

            // column -> stats + transactions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  // statistics
                  MyListTile(
                    iconImagePath: 'lib/images/analysis.png',
                    tileTitle: 'Statistics',
                    tileSubtitle: 'Payments and Income',
                  ),

                  // transaction history
                  MyListTile(
                    iconImagePath: 'lib/images/cash-flow.png',
                    tileTitle: 'Transactions',
                    tileSubtitle: 'Transaction History',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
