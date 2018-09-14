import 'package:flutter/material.dart';

const Color _brawn = Color(0xFF795548);
const Color _brawnLi = Color(0xFFFFCC80);
const Color _grey = Color(0xFFE0E0E0);
const Color _mySin = Color(0xFFA1887F);
const Color _amber = Color(0xFFFFF8E1);

class SectionDetail {
  const SectionDetail({
    this.title,
    this.subtitle,
    this.imageAsset,
  });
  final String title;
  final String subtitle;
  final String imageAsset;
}

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
  final List<SectionDetail> details;

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

// TODO(hansmuller): replace the SectionDetail images and text. Get rid of
// the const vars like _eyeglassesDetail and insert a variety of titles and
// image SectionDetails in the allSections list.

const SectionDetail _eyeglassesDetail = SectionDetail(
  imageAsset: 'assets/product_images/americano.png',
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const SectionDetail _eyeglassesImageDetail = SectionDetail(
  imageAsset: 'assets/product_images/americano.png',
);

const SectionDetail _seatingDetail = SectionDetail(
  imageAsset: 'assets/background_images/coffee.png',
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const SectionDetail _seatingImageDetail = SectionDetail(
  imageAsset: 'assets/background_images/coffee.png',
);

const SectionDetail _decorationDetail = SectionDetail(
  imageAsset: 'assets/background_images/coffee.png',
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const SectionDetail _decorationImageDetail = SectionDetail(
  imageAsset: 'assets/background_images/coffee.png',
);

const SectionDetail _protectionDetail = SectionDetail(
  imageAsset: 'assets/background_images/coffee.png',
  title: 'Flutter enables interactive animation',
  subtitle: '3K views - 5 days',
);

const SectionDetail _protectionImageDetail = SectionDetail(
  imageAsset: 'assets/background_images/coffee.png',
);

final List<Section> allSections = <Section>[
  const Section(
    title: 'НАТУРАЛЬНЫЙ КОФЕ',
    leftColor: _mySin,
    rightColor: _brawn,
    backgroundAsset: 'assets/background_images/coffee.png',
    details: <SectionDetail>[
      _eyeglassesDetail,
      _eyeglassesImageDetail,
      _eyeglassesDetail,
      _eyeglassesDetail,
      _eyeglassesDetail,
      _eyeglassesDetail,
    ],
  ),
  const Section(
    title: 'КОФЕЙНЫЕ НАПИТКИ',
    leftColor: _brawn,
    rightColor: _brawnLi,
    backgroundAsset: 'assets/background_images/coffee.png',
    details: <SectionDetail>[
      _seatingDetail,
      _seatingImageDetail,
      _seatingDetail,
      _seatingDetail,
      _seatingDetail,
      _seatingDetail,
    ],
  ),
  const Section(
    title: 'МОЛОЧНЫЕ КОКТЕЙЛИ',
    leftColor: _brawn,
    rightColor: _grey,
    backgroundAsset: 'assets/background_images/coffee.png',
    details: <SectionDetail>[
      _decorationDetail,
      _decorationImageDetail,
      _decorationDetail,
      _decorationDetail,
      _decorationDetail,
      _decorationDetail,
    ],
  ),
  const Section(
    title: 'ЧАЙ, ФРЭШ, ТОППИНГИ',
    leftColor: _brawn,
    rightColor: _amber,
    backgroundAsset: 'assets/background_images/coffee.png',
    details: <SectionDetail>[
      _protectionDetail,
      _protectionImageDetail,
      _protectionDetail,
      _protectionDetail,
      _protectionDetail,
      _protectionDetail,
    ],
  ),
];