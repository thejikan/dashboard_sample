import 'package:dashboard/model/skeleton_base.dart';
import 'package:dashboard/presentation/registration/bloc/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationSkeletonView extends StatelessWidget {
  const RegistrationSkeletonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationViewCubit, RegistrationViewState>(
      builder: (context, state) {
        return _skeletonCheck();
      },
    );
  }
}

Widget _skeletonCheck(){
  return Scaffold(
    appBar: AppBar(
      title: const SkeletonBase(shape: BoxShape.rectangle, width: 130,),
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    // backgroundColor: Colors.grey[50],
    body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: SkeletonBase(shape: BoxShape.rectangle, width: 120,)),
                    // Center(child: Text('Entry ${state.last3Days[index].date}')),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 36, top: 20),
                      child: SkeletonBase(shape: BoxShape.rectangle, height: 80, width: 80,),
                    ),
                    const Center(
                        child: SkeletonBase(shape: BoxShape.rectangle, width: 230,)),
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 20, bottom: 12),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: const [
                          SkeletonBase(shape: BoxShape.rectangle, width: 120,),
                          SkeletonBase(shape: BoxShape.rectangle, width: 120,),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        SkeletonBase(shape: BoxShape.rectangle, width: 80,),
                        SkeletonBase(shape: BoxShape.rectangle, width: 80,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}

