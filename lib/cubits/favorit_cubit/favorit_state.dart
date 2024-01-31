part of 'favorit_cubit.dart';

@immutable
abstract class FavoritState {}

class FavoritInitial extends FavoritState {}

class avoritLoadingState extends FavoritState {}

class avoritSuccessState extends FavoritState {}

class avoritFauler extends FavoritState {}
