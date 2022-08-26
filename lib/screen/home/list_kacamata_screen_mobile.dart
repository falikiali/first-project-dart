import 'package:flutter/material.dart';

import '../../utils/data_dummy.dart';
import 'detail_kacamata_screen_mobile.dart';

class ListKacamataScreenMobile extends StatefulWidget {
  const ListKacamataScreenMobile({Key? key}) : super(key: key);

  @override
  State<ListKacamataScreenMobile> createState() => _ListKacamataScreenMobileState();
}

class _ListKacamataScreenMobileState extends State<ListKacamataScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kacamata"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 2,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: listKacamata.map((item) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailKacamataScreenMobile(kacamata: item);
                  }));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Image.asset(
                          item.thumbnail,
                          width: 400,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      Padding(
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
                      const SizedBox(height: 8.0,),
                      Padding(
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
                      const SizedBox(height: 8.0,),
                      Padding(
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
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}