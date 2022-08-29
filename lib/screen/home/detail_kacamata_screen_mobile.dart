import 'package:app_watchink/model/kacamata.dart';
import 'package:flutter/material.dart';

class DetailKacamataScreenMobile extends StatefulWidget {
  final Kacamata kacamata;

  const DetailKacamataScreenMobile({Key? key, required this.kacamata}) : super(key: key);

  @override
  State<DetailKacamataScreenMobile> createState() => _DetailKacamataScreenMobileState();
}

class _DetailKacamataScreenMobileState extends State<DetailKacamataScreenMobile> {
  late bool _isAddOnCart;
  late int count;

  @override
  void initState() {
    _isAddOnCart = false;
    count = 1;
    super.initState();
  }

  void btnAddOnCart() {
    setState(() {
      _isAddOnCart = !_isAddOnCart;  
    });
  }

  void addCount() {
    setState(() {
      count++;
    });
  }

  void minCount() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(widget.kacamata.thumbnail),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  )
                )
              ],
            ),
            const SizedBox(height: 16,),
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: Text(
                widget.kacamata.price,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: Text(
                widget.kacamata.name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),
              ),
            ),
            const SizedBox(height: 8,),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(12))
                  ),
                  child: Text(
                    "Terjual ${widget.kacamata.terjual}"
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(12))
                  ),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.star,
                        size: 15.0,
                        color: Colors.yellow,
                      ),
                      Text(
                        "${widget.kacamata.rating} (${(widget.kacamata.terjual*0.6).toInt()})"
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            const Divider(
              color: Colors.grey,
              thickness: 12.0,
            ),
            const SizedBox(height: 16,),
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: const Text(
                "Deskripsi Produk",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
            const SizedBox(height: 8,),
            Container(
              margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Text(
                widget.kacamata.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black
                ),
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (count != 1) minCount();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(color: Colors.black)
                          ),
                        ),
                        child: const Icon(
                          Icons.horizontal_rule,
                          color: Colors.black,
                          size: 16,
                        )
                      ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        count.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (count != widget.kacamata.stock) addCount();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(color: Colors.black)
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 16,
                        )
                      ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          btnAddOnCart();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)
                          ),
                        ),
                        child: _isAddOnCart ? 
                          const Icon(Icons.check_outlined) 
                          : 
                          const Text(
                            "+ Keranjang",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ahellya',
                              fontSize: 18.0
                            ),
                          )
                      ),
                    ),
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