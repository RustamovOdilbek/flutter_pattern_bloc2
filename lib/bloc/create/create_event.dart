
import 'package:equatable/equatable.dart';
import 'package:flutter_pattern_bloc2/model/post_model.dart';

abstract class CreateEvent extends Equatable{
  const CreateEvent();
}

class CreatePostEvent extends CreateEvent{
  final Post post;

  CreatePostEvent(this.post);

  @override
  // TODO: implement props
  List<Object?> get props => [post];
}

