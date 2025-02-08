part of 'offer_categories_cubit.dart';

abstract class OfferCategoriesState {}

class OfferCategoriesInitial extends OfferCategoriesState {}

class OfferCategoriesLoading extends OfferCategoriesState {}

class OfferCategoriesLoaded extends OfferCategoriesState {
  final List<SubCategoriesModel> categories;
  OfferCategoriesLoaded(this.categories);
}

class OfferCategoriesError extends OfferCategoriesState {
  final String message;
  OfferCategoriesError(this.message);
}
