

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pattern_bloc2/bloc/home/home_bloc.dart';
import 'package:flutter_pattern_bloc2/bloc/home/home_event.dart';
import 'package:flutter_pattern_bloc2/bloc/home/home_state.dart';
import 'package:flutter_pattern_bloc2/model/post_model.dart';

import '../views/item_of_post.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(LoadPostsEvent());
    homeBloc.stream.listen((state) {
      if(state is HomePostDeleteState){
        homeBloc.add(LoadPostsEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc 2"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state){
          if(state is HomeErrorState){
            return viewOfError(state.errorMessage);
          }

          if(state is HomePostListState){
            return viewOfAPostList(state.items);
          }

          return viewOfLoading();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          homeBloc.callCreatePage(context);
        },
        backgroundColor:Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget viewOfError(String error){
    return Center(
      child: Text(error),
    );
  }

  Widget viewOfLoading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget viewOfAPostList(List<Post> items){
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index){
        Post post = items[index];
        return itemOfPost(ctx, homeBloc, post);
      },
    );
  }
}
