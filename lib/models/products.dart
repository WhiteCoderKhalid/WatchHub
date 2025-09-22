class Product {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavorite;
  final String description;

  const Product({
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    this.isFavorite = false,
  });

}


final List<Product> products = [
  const Product(
    name: 'Explorer',
    category: 'ROLEX',
    price: 150.00,
    oldPrice: 189.00,
    isFavorite: true,
    imageUrl: 'assets/images/rolex2.jpg',
    description: 'The EXPLORER – a durable, waterproof dive watch that balances luxury and everyday use.',
  ),
  const Product(
    name: 'Opera Scarface',
    category: 'JACOB@CO',
    price: 790.00,
    oldPrice: 900.00,
    isFavorite: true,
    imageUrl: 'assets/images/jacob4.jpg', 
    description: "The Opera Scarface  – a 3D rotating tourbillon watch that looks like art on the wrist.",
  ),
  const Product(
    name: 'RM 27-03',
    category: 'RICHARD MILLE',
    price: 900.00,
    oldPrice: 995.0,
     imageUrl: 'assets/images/richard1.jpg', 
    description: "The RM 27-03 Nadal – an ultra-light sports watch built to handle extreme shocks..",
  ),
  const Product(
  name: 'Astronomia Solar',
  category: 'JACOB@CO',
  price: 720.00,
  oldPrice: 799.00,
  isFavorite: false,
  imageUrl: 'assets/images/jacob1.jpg',
  description: "The Astronomia Solar – a cosmic-inspired masterpiece featuring a rotating sun, earth, and moon in motion.",
),

];