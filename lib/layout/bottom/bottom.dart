import 'package:china/modules/business.dart';
import 'package:china/modules/science.dart';
import 'package:china/modules/sports.dart';
import 'package:china/network/remote/dio_helper.dart';
import 'package:china/shared/cubit/cubit.dart';
import 'package:china/shared/cubit/states.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class bottom extends StatelessWidget {
  @override
  var scaffoldkey = GlobalKey<ScaffoldState>;
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusiness(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = BlocProvider.of(context);
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  )
                ],
                centerTitle: true,
                title: Text(cubit.titles[cubit.counter]),
                backgroundColor: Colors.grey,
              ),
              body: cubit.screens[cubit.counter],
              bottomNavigationBar: ConvexAppBar(
                  initialActiveIndex: cubit.counter,
                  backgroundColor: Colors.grey,
                  elevation: 20,
                  activeColor: Colors.white,
                  color: Colors.black,
                  onTap: (value) {
                    cubit.change(value);
                  },
                  items: cubit.items),
            );
          }),
    );
  }
}
