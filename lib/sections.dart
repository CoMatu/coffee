import 'package:coffee/product.dart';
import 'package:flutter/material.dart';

const Color _brawn = Color(0xFF795548);
const Color _brawnLi = Color(0xFFFFCC80);
const Color _grey = Color(0xFFE0E0E0);
const Color _mySin = Color(0xFFA1887F);
const Color _amber = Color(0xFFFFF8E1);

class Section {
  const Section({
    this.title,
    this.backgroundAsset,
    this.leftColor,
    this.rightColor,
    this.details,
  });
  final String title;
  final String backgroundAsset;
  final Color leftColor;
  final Color rightColor;
  final List<Product> details;

  @override
  bool operator==(Object other) {
    if (other is! Section)
      return false;
    final Section otherSection = other;
    return title == otherSection.title;
  }

  @override
  int get hashCode => title.hashCode;
}

const Product _eyeglassesDetail = Product(
);

const Product _seatingDetail = Product(
  imageAsset: 'assets/background_images/coffee.png',
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const Product _decorationDetail = Product(
  imageAsset: ' ',
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const Product _protectionDetail = Product(
  imageAsset: 'assets/background_images/coffee.png',
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

final List<Section> allSections = <Section>[
  const Section(
    title: 'НАТУРАЛЬНЫЙ КОФЕ',
    leftColor: _mySin,
    rightColor: _brawn,
    details: <Product>[

    ],
  ),
  const Section(
    title: 'КОФЕЙНЫЕ НАПИТКИ',
    leftColor: _brawn,
    rightColor: _brawnLi,
    details: <Product>[

    ],
  ),
  const Section(
    title: 'МОЛОЧНЫЕ КОКТЕЙЛИ',
    leftColor: _brawn,
    rightColor: _grey,
    details: <Product>[

    ],
  ),
  const Section(
    title: 'ЧАЙ, ФРЭШ, ТОППИНГИ',
    leftColor: _brawn,
    rightColor: _amber,
    details: <Product>[

    ],
  ),
];