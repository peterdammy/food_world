import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_world/model/food_carousel_model.dart';

final List<FoodCarouselModel> foodCarousel = [
  FoodCarouselModel(
    backgroundImage: 'assets/images/paneer.jpg',
    foodTitle: 'Chilli Paneer',
    numberofMins: '25 mins',
    numberofServing: '2 Serving',
  ),

  FoodCarouselModel(
    backgroundImage: 'assets/images/wrap.jpg',
    foodTitle: 'Mexican Wrap',
    numberofMins: '15 mins',
    numberofServing: '2 Serving',
  ),

  FoodCarouselModel(
    backgroundImage: 'assets/images/tea.jpg',
    foodTitle: 'Tea',
    numberofMins: '5 mins',
    numberofServing: '1 Serving',
  ),

  FoodCarouselModel(
    backgroundImage: 'assets/images/juice.jpg',
    foodTitle: 'Lemon Juice',
    numberofMins: '10 mins',
    numberofServing: '1 Serving',
  ),

  FoodCarouselModel(
    backgroundImage: 'assets/images/burger.jpg',
    foodTitle: 'Burger',
    numberofMins: '10 mins',
    numberofServing: '1 Serving',
  ),

  FoodCarouselModel(
    backgroundImage: 'assets/images/vegnoodles.jpg',
    foodTitle: 'Veg.Noodles',
    numberofMins: '10 mins',
    numberofServing: '3 Serving',
  ),
];

final foodCarouselProvider = Provider((ref) {
  return foodCarousel;
});
