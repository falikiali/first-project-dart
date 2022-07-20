import 'package:app_watchink/utils/brand.dart';
import 'package:app_watchink/utils/iklan.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainScreenMobile extends StatefulWidget {
  const MainScreenMobile({Key? key}) : super(key: key);

  @override
  State<MainScreenMobile> createState() => _MainScreenMobileState();
}

class _MainScreenMobileState extends State<MainScreenMobile> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 230, 230, 230),
                          hintText: "Search",
                          hintStyle: const TextStyle(
                            fontFamily: 'Ahellya',
                            fontSize: 14.0
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 230, 230, 230)
                            )
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2
                            )
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                          )
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0,),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Icon(
                              Icons.shopping_cart,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16.0,),
              Expanded(
                flex: 5,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 16/9,
                    enlargeCenterPage: true,
                  ),
                  items: iklanList.map((item) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )).toList(), 
                ),
              ),
              const SizedBox(height: 16.0,),
              Expanded(
                flex: 1,
                child: ListView(
                  children: brandList.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey
                      ),
                      child: Center(
                        child: Text(
                          e,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ahellya',
                            color: Colors.white
                          )
                        )
                      ),
                    ),
                  )).toList(),
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 16.0,),
              Expanded(
                flex: 7,
                child: ListView(
                  children: brandList.map((e) => Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(e),
                  )).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}