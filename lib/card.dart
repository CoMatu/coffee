import 'package:flutter/material.dart';

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
    final _green = Colors.green[700];
    return Card(
      child: SizedBox(
        height: 170.0,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 100.0,
              width: 100.0,
              child: Image.asset(
                'assets/product_images/americano.png'
              ),
            ),
            Column(
              children: <Widget>[
                Text('КАПУЧИНО'),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      color: _green,
                      child: Text('250 ml'),
                      onPressed: (){

                      },
                    ),
                    Text('176 rub')
                  ],
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      color: _green,
                      child: Text('350 ml'),
                      onPressed: (){

                      },
                    ),
                    Text('176 rub')
                  ],
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      color: _green,
                      child: Text('450 ml'),
                      onPressed: (){

                      },
                    ),
                    Text('176 rub')
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }
}