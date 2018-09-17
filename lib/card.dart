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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container( height: 170.0,
                  child:
                  Material(
                    elevation: 4.0,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset('assets/product_images/americano.png'),
                  )),
              Container(
                child: Material(
                  elevation: 4.0,
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'КАПУЧИНО',
                        style: TextStyle(
                            fontFamily: 'Play',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown[700]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            '250 мл',
                            style: TextStyle(
                                fontFamily: 'Play',
                                fontSize: 18.0,
                                color: Colors.green[700]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '60 руб',
                              style: TextStyle(
                                  fontFamily: 'Play',
                                  fontSize: 18.0,
                                  color: Colors.blue[700]),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Выбрать количество:',
                          style: TextStyle(
                              fontFamily: 'Play',
                              fontSize: 14.0,
                              color: Colors.brown),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.remove),
                            onPressed: () {},
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '0',
                              style: TextStyle(
                                fontFamily: 'Play',
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          IconButton(
                            color: Colors.green,
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          )
                        ],
                      ),
                      RaisedButton(
                        child: Text('В КОРЗИНУ: 0 руб'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
