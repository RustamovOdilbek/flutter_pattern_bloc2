
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pattern_bloc2/bloc/create/create_event.dart';
import 'package:flutter_pattern_bloc2/bloc/create/create_state.dart';
import 'package:flutter_pattern_bloc2/service/https_service.dart';

import '../../model/post_model.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState>{
  
  CreateBloc(): super(CreateInitialState()){
    on<CreatePostEvent>(_onCreatePost);
  }

  Future _onCreatePost(CreatePostEvent event, Emitter<CreateState> emit) async{
    emit(CreateLoadingState());
    final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(event.post));
    if(response != null){
      emit(CreatedPostState());
    }else{
      emit(CreateErrorState("Couldn't create post"));
    }
  }
  
}