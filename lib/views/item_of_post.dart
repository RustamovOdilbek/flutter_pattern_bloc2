import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pattern_bloc2/bloc/home/home_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../bloc/home/home_event.dart';
import '../model/post_model.dart';

Widget itemOfPost(BuildContext context, HomeBloc homeBloc, Post post) {
  return Slidable(
    startActionPane: ActionPane(
      motion: ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            homeBloc.callUpdatePage(context, post);
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: "Update",
        )
      ],
    ),
    endActionPane: ActionPane(
      motion: ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            homeBloc.add(DeletePostEvent(post: post));
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: "Delete",
        )
      ],
    ),
    child: Container(
      padding: EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        children: [
          Text(post.title!.toUpperCase()),
          SizedBox(
            height: 5,
          ),
          Text(post.body!)
        ],
      ),
    ),
  );
}