class Product {
  final String title;
  final String subTitle;
  final String imageAssets;
  final double price;
  final int volume;
  final String unit;

  const Product(this.title, this.subTitle, this.imageAssets,
      {this.price, this.volume, this.unit});
}

List<Product> coffee = [
  Product('Эспрессо', 'Бодрящий и ароматный',
      'assets/background_images/coffee.png'),
  Product('Американо', 'Бодрящий и ароматный',
      'assets/background_images/coffee.png'),
  Product('Капучино', 'Бодрящий и ароматный',
      'assets/background_images/coffee.png'),
  Product('Латте', 'Бодрящий и ароматный',
      'assets/background_images/coffee.png'),
];