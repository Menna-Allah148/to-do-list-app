import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
   static const String routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          Container(
            padding: EdgeInsets.only(top: 40, bottom: 8),
            
            child: Image.asset(
              alignment:Alignment.topLeft ,
              'lib/images/route.png', 
              height: 30,
              
            ),
          ),
          
          Container(
         
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'what do you search for?',
                       border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.blue, // Color of the border
                        width: 2.0,        // Width of the border
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.blue, // Color of the enabled border
                        width: 2.0,        // Width of the enabled border
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.blueAccent, // Color of the focused border
                        width: 2.0,              // Width of the focused border
                      ),
                       ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Icon(Icons.search, color: Colors.blue),
                  ),
                ),
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart_checkout_outlined, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ),
         
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               const Text(
                                  'UP TO ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),const Text(
                                  '25%  OFF ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              const   SizedBox(height: 8),
                              const  Text(
                                  'For all Headphones & AirPods',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF004182),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Text('Shop Now'),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'lib/images/headphone2.png',
                            height: 100,
                            width: 300,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Categories
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'view all',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Categories List
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          categoryItem(
                              'Women\'s fashion', 'lib/images/laptop.jpg'),
                          categoryItem(
                              'Men\'s fashion', 'lib/images/laptop.jpg'),
                          categoryItem('Laptops & Electronics',
                              'lib/images/laptop.jpg'),
                          categoryItem(
                              'Baby Toys', 'lib/images/laptop.jpg'),
                          categoryItem('Beauty', 'lib/images/laptop.jpg'),
                          categoryItem(
                              'Headphones', 'lib/images/laptop.jpg'),
                          categoryItem('Skincare', 'lib/images/laptop.jpg'),
                          categoryItem('Camera', 'lib/images/laptop.jpg'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Home Appliance
                    Text(
                      'Home Appliance',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    // Appliance Grid
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        applianceItem('lib/images/laptop.jpg'),
                        applianceItem('lib/images/laptop.jpg'),
                        applianceItem('lib/images/laptop.jpg'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
         backgroundColor: Color(0xFF004182),
          currentIndex: 0,
          selectedItemColor: Colors.white, 
          unselectedItemColor: Colors.white70, 
                
        
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
         const BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: '',
          ),
         const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
        const  BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget categoryItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget applianceItem(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(imagePath),
      ),
    );
  }
}