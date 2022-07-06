import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
         onTap: (){
          Navigator.pop(context);
         },
          child: Icon(CupertinoIcons.back, size: 100.sp,)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Container(
              height: 700.h,
              color: Colors.white,
              child: Image.network(
                  "${widget.state.products?[widget.index].image}"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.fromLTRB(17.w, 65.h, 17.w, 19.h),
                child: Text(
                  "PRICE: £${widget.state.products?[widget.index].price}",
                  style:
                      TextStyle(fontSize: 60.sp, fontWeight: FontWeight.bold),
                ),
              ),
              HomeDetailTitleWidget(stateName: widget.state.products![widget.index].title.toString(),  title: "TITLE"),
      
          
              HomeDetailTitleWidget(stateName: widget.state.products![widget.index].description.toString(), title: "DESCRIPTION")
            ],
          )
        ],
      ),
    );
  }
}
