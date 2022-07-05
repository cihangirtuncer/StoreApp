import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/bloc/home_bloc.dart';

class HomeDetailView extends StatefulWidget {
  final HomeLoaded state;
  final int index;
  const HomeDetailView({Key? key, required this.state, required this.index})
      : super(key: key);

  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        leading: InkWell(
         onTap: (){
          Navigator.pop(context);
         },
          child: Icon(CupertinoIcons.back)),
      ),
      backgroundColor: Colors.amber[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Container(
                height: 400,
                width: 500,
                color: Colors.white,
                child: Image.network(
                    "${widget.state.products?[widget.index].image}"),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Price: £${widget.state.products?[widget.index].price}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Title: ${widget.state.products?[widget.index].title}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Description: ${widget.state.products?[widget.index].description}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
