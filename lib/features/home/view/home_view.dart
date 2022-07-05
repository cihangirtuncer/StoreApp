import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/bloc/home_bloc.dart';

import '../../../core/constants/api_constants.dart';
import '../model/product_model.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Example"),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeFailed) {
              return const Center(
                child: Text('Failed to load'),
              );
            }

            if (state is HomeLoaded) {
              return ListView.builder(
                  itemCount: state.products?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (() {}),
                      child: Card(
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.account_circle_outlined),
                          ),
                          title: Text(
                              "${state.products?[index].title ?? "nullllll"}"),
                        ),
                      ),
                    );
                  });
            } else {
              return Text("Some Error");
            }
          },
        ));
  }
}
