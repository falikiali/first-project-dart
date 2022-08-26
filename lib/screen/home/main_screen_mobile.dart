import 'package:app_watchink/model/kacamata.dart';
import 'package:app_watchink/screen/home/detail_kacamata_screen_mobile.dart';
import 'package:app_watchink/screen/home/list_kacamata_screen_mobile.dart';
import 'package:app_watchink/utils/brand.dart';
import 'package:app_watchink/utils/data_dummy.dart';
import 'package:app_watchink/utils/iklan.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainScreenMobile extends StatefulWidget {
  const MainScreenMobile({Key? key}) : super(key: key);

  @override
  State<MainScreenMobile> createState() => _MainScreenMobileState();
}

class _MainScreenMobileState extends State<MainScreenMobile> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      viewportFraction: 1.0
                    ),
                    items: iklanList.map((item) => ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                      ),
                    )).toList(), 
                  ),
                ),
                const SizedBox(height: 16.0,),
                Expanded(
                  flex: 1,
                  child: ListView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    scrollDirection: Axis.horizontal,
                    children: brandList.map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3, 1],
                            colors: [
                              Color.fromARGB(255, 0, 0, 0),
                              Color.fromARGB(136, 0, 0, 0),
                            ]
                          )
                        ),
                        child: Center(
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ahellya',
                              color: Colors.white
                            )
                          )
                        ),
                      ),
                    )).toList(),
                  ),
                ),
                const SizedBox(height: 16.0,),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      try {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const ListKacamataScreenMobile();
                        }));
                      } catch(e, s) {
                        Fluttertoast.showToast(
                          msg: "There is an error!",
                          toastLength: Toast.LENGTH_LONG,
                          fontSize: 12.0,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.grey,
                        );
                        print('Exception: $e');
                        print('Stack trace: $s');
                      }
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Subway',
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: ListView.builder(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final Kacamata item = listKacamata[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DetailKacamataScreenMobile(kacamata: item);
                          }));
                        },
                        child: SizedBox(
                          width: 200,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 6,
                                  child: Image.asset(
                                    item.thumbnail, 
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8.0,),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8.0,),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      item.price,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8.0,),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 15.0,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          "Rating ${item.rating} | Terjual ${item.terjual}",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 5,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}