
import 'package:equatable/equatable.dart';
import 'package:flutter_pattern_bloc2/model/post_model.dart';

abstract class HomeState extends Equatable{}

class HomeIntialState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState{
  final String errorMessage;

  HomeErrorState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomePostListState extends HomeState{
  final List<Post> items;

  HomePostListState(this.items);

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}

class HomePostDeleteState extends HomeState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}