import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/miscellaneous/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import '../cubit/app_cubit.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars=3;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder:(context, state) {
      DetailState detail= state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.places.img),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 70,
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      BlocProvider.of<AppCubits>(context).goHome();
                    }, icon: Icon(Icons.menu))
                  ],
                ),
              ),
              Positioned(
                top: 330,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: detail.places.name),
                          AppLargeText(text: "\$"+detail.places.price.toString())
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, color: Colors.indigo,),
                          AppText(text: detail.places.location, color: Colors.black,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index){
                              return Icon(Icons.star, color:index<detail.places.stars?Colors.amber:AppColors.textColor2,);
                            }),
                          ),
                          SizedBox(width: 5,),
                          AppText(text: "(5.0)", color:AppColors.textColor2,)
                        ],
                      ),
                      SizedBox(height: 25,),
                      AppLargeText(text: "People", color: Colors.indigo.shade900.withOpacity(0.8),size: 20),
                      SizedBox(height: 5,),
                      AppText(text: "Number of people in your group", color: AppColors.mainColor),
                      SizedBox(height: 10,),
                      Wrap(
                          children: List.generate(5, (index){
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  selectedIndex=index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: AppButtons(
                                    size: 58,
                                    color: selectedIndex==index?Colors.white:Colors.black,
                                    backgroundColor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                                    borderColor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                                    text:(index+1).toString()
                                ),
                              ),
                            );
                          })
                      ),
                      SizedBox(height: 20,),
                      AppLargeText(text: "Description", color: Colors.indigo.shade900.withOpacity(0.8), size: 10),
                      SizedBox(height: 5),
                      AppText(text: detail.places.description, color: AppColors.mainTextColor )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Positioned(
                  bottom: 5,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        size: 40,
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor2,
                        isIcon: true,
                        icon:Icons.favorite_border,
                      ),

                      ResponsiveButton(
                        isResponsive:true,
                      )
                    ],
                  )
              )
            ],

          ),
        ),
      );
    });
  }
}
