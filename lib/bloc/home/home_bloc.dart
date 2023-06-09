
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pattern_bloc2/service/https_service.dart';

import '../../model/post_model.dart';
import '../../pages/create_page.dart';
import '../../pages/update_page.dart';
import '../create/create_bloc.dart';
import '../update/update_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc(): super(HomeIntialState()){
    on<LoadPostsEvent>(_onLoadPosts);
    on<DeletePostEvent>(_onDeletePost);
  }

  Future<void> _onLoadPosts(LoadPostsEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingState());
    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null){
      final posts = Network.parsePostList(response);
      emit(HomePostListState(posts));
    }else{
      emit(HomeErrorState("Could't fetch posts"));
    }
  }

  Future<void> _onDeletePost(DeletePostEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingState());
    final response = await Network.DELETE(Network.API_DELETE + event.post.id.toString(), Network.paramsEmpty());
    if(response != null){
      emit(HomePostDeleteState());
    }else{
      emit(HomeErrorState("Could't delete post"));
    }
  }

  void callCreatePage(BuildContext context) async{
    var results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CreateBloc(),
          child: CreatePage(),
        )
    ));
    if(results != null){
      add(LoadPostsEvent());
    }
  }

  void callUpdatePage(BuildContext context, Post post) async{
    var results = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => UpdateBloc(),
        child: UpdatePage(post: post),
      )
    ));
  }
}