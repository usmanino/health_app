class Drug {
  final String name;
  final String image;
  final String tablet;
  final int price;

  Drug({this.name, this.image, this.price,this.tablet});
}

final drugList = [
  Drug(name: 'Ventolin', image: 'assets/images/inhaler.jpg', price: 100 ,tablet: "250mg"),
  Drug(name: 'Eye Drop', image: 'assets/images/eyedrop.png', price: 100, tablet: "250mg"),
  Drug(name: 'Cough Syrup', image: 'assets/images/cough.jpg', price: 100 ,tablet: "250mg"),
  Drug(name: 'Panadol', image: 'assets/images/panadol.jpg', price: 100 ,tablet: "250mg"),
  Drug(name: 'Ventolin', image: 'assets/images/inhaler.jpg', price: 100 ,tablet: "250mg"),
  Drug(name: 'Eye Drop', image: 'assets/images/eyedrop.png', price: 100, tablet: "250mg"),
  Drug(name: 'Cough Syrup', image: 'assets/images/cough.jpg', price: 100 ,tablet: "250mg"),
  Drug(name: 'Panadol', image: 'assets/images/panadol.jpg', price: 100 ,tablet: "250mg"),
];
