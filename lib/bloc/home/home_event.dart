
import 'package:equatable/equatable.dart';
import 'package:flutter_pattern_bloc2/model/post_model.dart';

abstract class HomeEvent extends Equatable{
  const HomeEvent();
}

class LoadPostsEvent extends HomeEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeletePostEvent extends HomeEvent{
  final Post post;

  DeletePostEvent({required this.post});

  @override
  // TODO: implement props
  List<Object?> get props => [post];
}