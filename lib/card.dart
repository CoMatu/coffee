import 'package:flutter/material.dart';

const Color _brawn = Color(0xFF795548);
const Color _brawnLi = Color(0xFFFFCC80);
const Color _grey = Color(0xFFE0E0E0);
const Color _mySin = Color(0xFFA1887F);
const Color _amber = Color(0xFFFFF8E1);
const Color _green = Color(0xFF00BFA5);

class ProductCard extends StatefulWidget {

  @override
  ProductCardState createState() {
    return ProductCardState();
  }
}

class ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        color: _amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 170.0,
                child: Image.asset(
                  'assets/product_images/americano.png'
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('КАПУЧИНО',
                      style: TextStyle(
                        color: _brawn,
                        fontSize: 24.0
                      ),),
                    ),
                    Row(
                      children: <Widget>[
                        RaisedButton(
                          color: _green,
                          child: Text('250 мл',
                          style: TextStyle(
                            color: _brawn,
                            fontSize: 18.0
                          ),
                          ),
                          onPressed: (){

                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text('60 руб.',
                          style: TextStyle(
                            fontFamily: 'Lobster'
                          ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        RaisedButton(
                          color: _green,
                          child: Text('350 мл',
                            style: TextStyle(
                                color: _brawn,
                              fontSize: 18.0
                            ),
                          ),
                          onPressed: (){

                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text('110 руб.',
                            style: TextStyle(
                                fontFamily: 'Lobster'
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        RaisedButton(
                          color: _green,
                          child: Text('450 мл',
                            style: TextStyle(
                                color: _brawn,
                              fontSize: 18.0
                            ),
                          ),
                          onPressed: (){

                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text('165 руб.',
                            style: TextStyle(
                                fontFamily: 'Lobster'
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}