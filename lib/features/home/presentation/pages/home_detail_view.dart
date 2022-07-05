import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:store_app/features/home/presentation/widgets/home_detail_title_widget.dart';

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
          child: Icon(CupertinoIcons.back, color: Colors.black, size: 30,)),
      ),
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
              height: 500,
              width: 500,
             decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
             ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                    child: Text(
                      "Price: £${widget.state.products?[widget.index].price}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  HomeDetailTitleWidget(stateName: widget.state.products![widget.index].title.toString(),  title: "Title"),

              
                  HomeDetailTitleWidget(stateName: widget.state.products![widget.index].description.toString(), title: "Description")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
