class Products{
  final String image;
  final String title;
  final String description;
  final double price;


  Products({
    required this.title,
    required this.image,
    required this.description,
    required this.price
});


  factory Products.fromApi(Map<String, dynamic> json){
    return Products(
        title: json ['title'],
        image: json ['image'],
        description: json ['description'],
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
    );
  }
}


