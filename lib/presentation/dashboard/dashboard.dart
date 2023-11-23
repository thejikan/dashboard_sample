import 'package:dashboard/model/constants.dart';
import 'package:dashboard/model/weatherIconSelected.dart';
import 'package:dashboard/presentation/dashboard/bloc/dashboard_cubit.dart';
import 'package:dashboard/presentation/dashboard/dashboard_skeleton.dart';
import 'package:dashboard/service/detailsService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardViewCubit>(
      create: (context) => DashboardViewCubit(context.read<DetailsService>()),
      child: _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  _DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardViewCubit, DashboardViewState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading) {
          return const DashboardSkeletonView();
        }

        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    /// search
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.search_sharp,
                                      size: 32.0,
                                    ),
                                    hintText: 'Jobs by Profile, Title, Projects etc',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.grey.shade200),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  child: Stack(
                                    children: const [
                                      Icon(
                                        Icons.notifications_none_outlined,
                                        color: Colors.black,
                                        size: 28,
                                      ),
                                      Positioned(
                                        left: 17,
                                        child: Icon(
                                          Icons.circle,
                                          color: Colors.yellow,
                                          size: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.green[100],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.wallet_travel_outlined),
                                    Text(
                                      'Fill Professional details will increase 30 %',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 22,
                                          fontWeight:
                                          FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),



                    /// products above text
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: const Text(
                          'Aspirants with higher percentage are more likely to be shortlisted. Update the mandatory fields.',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 26,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),

                    /// ad slider
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.green[100],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '57,892',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 22,
                                          fontWeight:
                                          FontWeight.w700),
                                    ),
                                    Text(
                                      'Total Available Jobs',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 16,
                                          fontWeight:
                                          FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.green[100],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '12,540',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 22,
                                          fontWeight:
                                          FontWeight.w700),
                                    ),
                                    Text(
                                      'Jobs Related to Your Profile',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 16,
                                          fontWeight:
                                          FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.green[100],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.person),
                                    Text(
                                      'Upload Profile detail will Increase 40 %',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 22,
                                          fontWeight:
                                          FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.green[100],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.wallet_travel_outlined),
                                    Text(
                                      'Fill Professional details will increase 30 %',
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 22,
                                          fontWeight:
                                          FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),




                    /// products above text
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Relevant Jobs',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'View All',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// products
                    // SliverPadding(
                    //   padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    //   sliver: SliverToBoxAdapter(
                    //     child: CarouselSlider(
                    //       options: CarouselOptions(
                    //         aspectRatio: 1.6,
                    //         enlargeCenterPage: false,
                    //         scrollDirection: Axis.horizontal,
                    //         autoPlay: false,
                    //         viewportFraction: 1.0,
                    //         onPageChanged: (index, reason) {
                    //           // _currentIndex = index;
                    //         },
                    //       ),
                    //       items: ((state.categories).take(4)).map((category) {
                    //         return Container(
                    //           color: SelectCategoryColor(category.id),
                    //           // color: Colors.deepPurple[100],
                    //           child: Row(
                    //             mainAxisAlignment:
                    //             MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Expanded(
                    //                 flex: 3,
                    //                 child: Padding(
                    //                   padding: const EdgeInsets.only(left: 24),
                    //                   child: Column(
                    //                     mainAxisAlignment:
                    //                     MainAxisAlignment.center,
                    //                     crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                     children: [
                    //                       Text(
                    //                         'Get ${category.name}',
                    //                         style: const TextStyle(
                    //                             fontWeight: FontWeight.w600,
                    //                             fontSize: 24),
                    //                         overflow: TextOverflow.visible,
                    //                       ),
                    //                       Padding(
                    //                         padding:
                    //                         const EdgeInsets.only(top: 8.0),
                    //                         child: Text(
                    //                           'Full speed ahead.',
                    //                           style: TextStyle(
                    //                               fontWeight: FontWeight.w600,
                    //                               fontSize: 20,
                    //                               color: Colors.grey[600]),
                    //                         ),
                    //                       ),
                    //                       Padding(
                    //                         padding: const EdgeInsets.symmetric(
                    //                             vertical: 12.0),
                    //                         child: ElevatedButton(
                    //                           onPressed: () {},
                    //                           style: ElevatedButton.styleFrom(
                    //                             backgroundColor:
                    //                             Colors.grey[800],
                    //                             padding:
                    //                             const EdgeInsets.symmetric(
                    //                                 horizontal: 8.0),
                    //                             shape:
                    //                             const RoundedRectangleBorder(
                    //                               borderRadius:
                    //                               BorderRadius.all(
                    //                                   Radius.circular(8)),
                    //                             ),
                    //                           ),
                    //                           child: Padding(
                    //                             padding:
                    //                             const EdgeInsets.all(10.0),
                    //                             child: Text(
                    //                               'Shop Now',
                    //                               style: TextStyle(
                    //                                   fontSize: 16.0,
                    //                                   color: Colors.grey[300]),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       // DotsIndicator(
                    //                       //   dotsCount: 4,
                    //                       //   position: state.sliderCardNumber,
                    //                       //   decorator: DotsDecorator(
                    //                       //     color: Colors.grey,
                    //                       //     activeColor: Colors.grey[800],
                    //                       //   ),
                    //                       // ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 flex: 2,
                    //                 child: Padding(
                    //                   padding:
                    //                   const EdgeInsets.only(right: 16.0),
                    //                   child: Image.network(category.image),
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         );
                    //       }).toList(),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  elevation: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    // height: 160,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.home_outlined),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.event),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  'Events',
                                  style: TextStyle(
                                      color: Colors.grey[100], fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.person),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  'My Profile',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.wallet_travel_outlined),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  'Job Box',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.more_vert),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  'Menu',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

      },
    );
  }
}

