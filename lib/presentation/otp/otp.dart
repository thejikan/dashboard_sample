import 'package:dashboard/model/constants.dart';
import 'package:dashboard/presentation/otp/bloc/otp_cubit.dart';
import 'package:dashboard/presentation/otp/otp_skeleton.dart';
import 'package:dashboard/service/detailsService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtpViewCubit>(
      create: (context) => OtpViewCubit(context.read<DetailsService>()),
      child: _OtpView(),
    );
  }
}

class _OtpView extends StatelessWidget {
  _OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpViewCubit, OtpViewState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading) {
          return const OtpSkeletonView();
        }
        return Scaffold(
          // backgroundColor: Colors.grey[400],
          // appBar: AppBar(
          //   elevation: 0,
          //   title: const Text(
          //     'Weather Report',
          //     style: TextStyle(
          //         color: Colors.black87,
          //         fontSize: 20,
          //         fontWeight: FontWeight.w700),
          //   ),
          //   backgroundColor: Colors.grey[50],
          // ),
          // body: ListView.builder(
          //     padding: const EdgeInsets.all(8),
          //     itemCount: state.last3Days.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Container(
          //           decoration: const BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.all(Radius.circular(20.0)),
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 16, vertical: 20),
          //             child: Column(
          //               children: [
          //                 Align(
          //                     alignment: Alignment.centerLeft,
          //                     child: Text(
          //                       (index == 0)
          //                           ? 'Today'
          //                           : state.last3Days[index].date,
          //                       style: TextStyle(
          //                           fontSize: SpacingsEnum.spacingLLL,
          //                           fontWeight: FontWeight.w500,
          //                           color: Colors.grey[600]),
          //                     )),
          //                 // Center(child: Text('Entry ${state.last3Days[index].date}')),
          //                 Padding(
          //                   padding: const EdgeInsets.only(bottom: 36),
          //                   child: Icon(
          //                     SelectWeatherIcon(
          //                         state.last3Days[index].weatherCode),
          //                     size: 52,
          //                   ),
          //                 ),
          //                 Center(
          //                     child: Text(
          //                         SelectWeatherDetails(
          //                             state.last3Days[index].weatherCode),
          //                         style: TextStyle(
          //                             fontSize: SpacingsEnum.spacingLL,
          //                             fontWeight: FontWeight.w500,
          //                             color: Colors.grey[600]))),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.only(top: 20, bottom: 12),
          //                   child: Row(
          //                     mainAxisAlignment:
          //                         MainAxisAlignment.spaceAround,
          //                     children: [
          //                       Text('Max Temperature',
          //                           style: TextStyle(
          //                               fontSize: SpacingsEnum.spacingL,
          //                               fontWeight: FontWeight.w400,
          //                               color: Colors.grey[800])),
          //                       Text('Max Temperature',
          //                           style: TextStyle(
          //                               fontSize: SpacingsEnum.spacingL,
          //                               fontWeight: FontWeight.w400,
          //                               color: Colors.grey[800])),
          //                     ],
          //                   ),
          //                 ),
          //                 Row(
          //                   mainAxisAlignment:
          //                       MainAxisAlignment.spaceAround,
          //                   children: [
          //                     Text(
          //                         '${state.last3Days[index].minTemperature} \u2103',
          //                         style: TextStyle(
          //                             fontSize: SpacingsEnum.spacingL,
          //                             fontWeight: FontWeight.w400,
          //                             color: Colors.grey[800])),
          //                     Text(
          //                         '${state.last3Days[index].maxTemperature} \u2103',
          //                         style: TextStyle(
          //                             fontSize: SpacingsEnum.spacingL,
          //                             fontWeight: FontWeight.w400,
          //                             color: Colors.grey[800])),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     })
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Wrap(
                  alignment: WrapAlignment.center,
                    children: [
                  Text(
                    'Come for Opportunities,',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                  ),
                      Text(
                        'Stay for Community',
                        style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                      )
                ]),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Enter Whatsapp Mobile Number'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('+91-987 654 3210'),
                        InkWell(
                          onTap: () {},
                          child: Text('Change'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('We have sent the OTP to {number}'),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 4,
                  direction: Axis.horizontal,
                  runSpacing: 10,
                  children: [
                    _otpTextField(context, false),
                    _otpTextField(context, false),
                    _otpTextField(context, false),
                    _otpTextField(context, false),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Resend OTP In 00:59'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                            )
                        )
                    ),
                      onPressed: () {},
                      child: Text('Join for Free')),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _otpTextField(BuildContext context, bool autoFocus) {
  return Container(
    height: MediaQuery.of(context).size.shortestSide * 0.13,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
      shape: BoxShape.rectangle,
    ),
    child: AspectRatio(
      aspectRatio: 1,
      child: TextField(
        autofocus: autoFocus,
        decoration: InputDecoration(
          hintText: autoFocus?'':'-',
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(),
        maxLines: 1,
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    ),
  );
}
