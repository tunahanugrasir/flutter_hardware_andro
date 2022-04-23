import 'package:flutter/material.dart';

class MyCollections extends StatefulWidget {
  const MyCollections({Key? key}) : super(key: key);

  @override
  State<MyCollections> createState() => _MyCollectionsState();
}

class _MyCollectionsState extends State<MyCollections> {
  late List<ProductModel> _items;
  @override
  void initState() {
    super.initState();
    _items = ProductModelItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return _ProductCard(model: _items[index]);
      },
    ));
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    Key? key,
    required ProductModel model,
  })  : _model = model,
        super(key: key);

  final ProductModel _model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height,
              child: Card(
                elevation: 70,
                color: const Color(0xffF6F6F6),
                child: Image.asset(
                  _model.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
              flex: ProductCardsElevationAndFlex().minFlex,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: Card(
                  elevation: ProductCardsElevationAndFlex().smallElevation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          _model.productName,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Text('${_model.productPrice.toString()} \$', style: Theme.of(context).textTheme.headline6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: ProductCardsElevationAndFlex().normalFlex,
                            child: Card(
                                elevation: ProductCardsElevationAndFlex().smallElevation,
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {},
                                )),
                          ),
                          Text('1', style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.blue[900])),
                          Expanded(
                            flex: ProductCardsElevationAndFlex().normalFlex,
                            child: Card(
                                elevation: ProductCardsElevationAndFlex().smallElevation,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {},
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class ProductModel {
  final String imagePath;
  final String productName;
  final double productPrice;

  ProductModel({required this.imagePath, required this.productName, required this.productPrice});
}

class ProductModelItems {
  late List<ProductModel> items;
  ProductModelItems() {
    items = [
      ProductModel(imagePath: ProductImagePath.image1, productName: 'Nike C2d12', productPrice: 350),
      ProductModel(imagePath: ProductImagePath.image2, productName: 'Nike d109', productPrice: 230),
      ProductModel(imagePath: ProductImagePath.image3, productName: 'Nike ascı1', productPrice: 550),
      ProductModel(imagePath: ProductImagePath.image4, productName: 'Nike yesMan', productPrice: 679),
    ];
  }
}

class ProductImagePath {
  static const String image1 = 'assets/png/image_nike.webp';
  static const String image2 = 'assets/png/image_nike2.webp';
  static const String image3 = 'assets/png/image_nike3.webp';
  static const String image4 = 'assets/png/image_nike4.webp';
}

class ProductCardsElevationAndFlex {
  final double smallElevation = 3;
  final double mediumElevation = 7;
  final double maxElevation = 70;
  final int minFlex = 1;
  final int normalFlex = 2;
}

class ProductPadding {
  final normalPadding = const EdgeInsets.all(10);
}
