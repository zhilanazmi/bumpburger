class BurgerMenu {
  final String name;
  final String image;
  final double price;

  BurgerMenu({required this.name, required this.image, required this.price});
}

List<BurgerMenu> burgerMenus = [
  BurgerMenu(name: 'The Bump', image: 'assets/the_bump.JPG', price: 50000),
  BurgerMenu(name: 'Formage', image: 'assets/formage.JPG', price: 55000),
  BurgerMenu(name: 'Big Boys', image: 'assets/big_boys.JPG', price: 70000),
  BurgerMenu(name: 'Bad Chick', image: 'assets/bad_chick.JPG', price: 45000),
];
