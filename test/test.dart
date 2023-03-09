// TabBarView(
//   controller: tabController,
//   children: [
//     Visibility(
//       visible: index <=
//           snapshot.data!.day_1.dayHalls.length,
//       child: Column(
//         children: [
//           SizedBox(height: 5.h),
//           Visibility(
//             visible: snapshot.data!.day_1.dayHalls
//                 .elementAt(index)
//                 .hallDetail
//                 .toString()
//                 .isNotEmpty,
//             child: Container(
//               width:
//                   MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.circular(8),
//                 border: Border.all(
//                     width: 0.2,
//                     color: Colors.black12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 8),
//                 child: Column(
//                   crossAxisAlignment:
//                       CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 5),
//                       child: Row(
//                         mainAxisAlignment:
//                             MainAxisAlignment.start,
//                         crossAxisAlignment:
//                             CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${snapshot.data?.day_1.dayHalls.elementAt(index).hallDetail}\n',
//                             style: const TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: tabHeight,
//             // (snapshot.data?.day_1.dayHalls.length ??
//             //             0) >
//             //         2
//             //     ? MediaQuery.of(context).size.height *
//             //         0.4.h
//             //     : MediaQuery.of(context).size.height *
//             //         0.20.h,
//             child: MediaQuery.removePadding(
//               context: context,
//               removeTop: true,
//               child: ListView.builder(
//                   // padding:
//                   //     const EdgeInsets.only(bottom: 20),
//                   itemCount: snapshot
//                       .data?.day_1.dayHalls
//                       .elementAt(index)
//                       .hallSessions
//                       .length,
//                   itemBuilder: (context, indexList2) {
//                     return Column(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             try {
//                               Navigator.of(context)
//                                   .push(
//                                 MaterialPageRoute(
//                                   builder: (context) {
//                                     return SessionDetail(
//                                       sessions: snapshot
//                                           .data!
//                                           .day_1
//                                           .dayHalls
//                                           .elementAt(
//                                               index)
//                                           .hallSessions
//                                           .elementAt(
//                                               indexList2),
//                                       hallIndex:
//                                           index,
//                                       sessionIndex:
//                                           indexList2,
//                                       allSessionsList: snapshot
//                                           .data!
//                                           .day_1
//                                           .dayHalls
//                                           .elementAt(
//                                               index)
//                                           .hallSessions,
//                                       comingFrom: snapshot
//                                           .data!
//                                           .day_1
//                                           .dayHalls
//                                           .elementAt(
//                                               index)
//                                           .hallSessions
//                                           .elementAt(
//                                               indexList2)
//                                           .sessionName
//                                           .toString()
//                                           .toLowerCase(),
//                                     );
//                                   },
//                                 ),
//                               );
//                             } catch (e) {
//                               print(e);
//                             }
//                           },
//                           child: Container(
//                             width:
//                                 MediaQuery.of(context)
//                                         .size
//                                         .width *
//                                     0.82.w,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors
//                                       .grey.shade400,
//                                   spreadRadius: 1,
//                                   blurRadius: 5,
//                                 )
//                               ],
//                               borderRadius:
//                                   BorderRadius
//                                       .circular(8),
//                             ),
//                             margin: const EdgeInsets
//                                     .symmetric(
//                                 vertical: 5),
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets
//                                           .symmetric(
//                                       vertical: 10),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .start,
//                                 crossAxisAlignment:
//                                     CrossAxisAlignment
//                                         .start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets
//                                             .symmetric(
//                                         horizontal:
//                                             20),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment
//                                               .start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                       children: [
//                                         SizedBox(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.5.w,
//                                           child: Text(
//                                             '${snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDay}${'-> '}${snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionHall}\n',
//                                             style:
//                                                 TextStyle(
//                                               color: const Color(
//                                                   0xff8e3434),
//                                               fontSize:
//                                                   14.sp,
//                                               fontWeight:
//                                                   FontWeight.w700,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets
//                                             .symmetric(
//                                         horizontal:
//                                             20),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment
//                                               .start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                       children: [
//                                         SizedBox(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.48.w,
//                                           child: Text(
//                                             '${snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionName}\n',
//                                             style:
//                                                 const TextStyle(
//                                               color: Colors
//                                                   .black,
//                                               fontWeight:
//                                                   FontWeight.w700,
//                                             ),
//                                           ),
//                                         ),
//                                         Text(
//                                           '${snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionTime}\n',
//                                           style:
//                                               const TextStyle(
//                                             color: Colors
//                                                 .grey,
//                                             fontWeight:
//                                                 FontWeight
//                                                     .w700,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     width:
//                                         MediaQuery.of(
//                                                 context)
//                                             .size
//                                             .width,
//                                     padding: const EdgeInsets
//                                             .symmetric(
//                                         horizontal:
//                                             20,
//                                         vertical: 10),
//                                     child: InkWell(
//                                       onTap: () {
//                                         Navigator.of(
//                                                 context)
//                                             .push(MaterialPageRoute(
//                                                 builder: (context) => SessionDetail(
//                                                       sessions: snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
//                                                       hallIndex: index,
//                                                       sessionIndex: indexList2,
//                                                       allSessionsList: snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions,
//                                                     )));
//                                       },
//                                       child: InkWell(
//                                         onTap: () {
//                                           Navigator.of(
//                                                   context)
//                                               .push(MaterialPageRoute(
//                                                   builder: (context) => SessionDetail(
//                                                         sessions: snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
//                                                         hallIndex: index,
//                                                         sessionIndex: indexList2,
//                                                         allSessionsList: snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions,
//                                                       )));
//                                         },
//                                         child: Text(
//                                           '${snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDetail.toString().replaceAll('<br />\r\n<br />\r\n<br />\r\n', '').replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '')}',
//                                           maxLines:
//                                               100,
//                                           style:
//                                               const TextStyle(
//                                             color: Color(
//                                                 0xff8e3434),
//                                             fontWeight:
//                                                 FontWeight
//                                                     .w700,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//           ),
//           SizedBox(height: 6.h)
//         ],
//       ),
//     ),
//     Visibility(
//       visible: index <=
//           snapshot.data!.day_2.dayHalls.length,
//       child: Column(
//         children: [
//           SizedBox(height: 5.h),
//           Visibility(
//             visible: snapshot.data!.day_2.dayHalls
//                 .elementAt(index)
//                 .hallDetail
//                 .toString()
//                 .isNotEmpty,
//             child: Container(
//               width:
//                   MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.circular(8),
//                 border: Border.all(
//                     width: 0.2,
//                     color: Colors.black12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 8),
//                 child: Column(
//                   crossAxisAlignment:
//                       CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 5),
//                       child: Row(
//                         mainAxisAlignment:
//                             MainAxisAlignment.start,
//                         crossAxisAlignment:
//                             CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${snapshot.data?.day_2.dayHalls.elementAt(index).hallDetail}\n',
//                             style: const TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: tabHeight,
//             // (snapshot.data?.day_2.dayHalls.length ??
//             //             0) >
//             //         2
//             //     ? MediaQuery.of(context).size.height *
//             //         0.4.h
//             //     : MediaQuery.of(context).size.height *
//             //         0.20.h,
//             child: MediaQuery.removePadding(
//               context: context,
//               removeTop: true,
//               child: ListView.builder(
//                   // padding:
//                   //     const EdgeInsets.only(bottom: 20),
//                   itemCount: snapshot
//                       .data?.day_2.dayHalls
//                       .elementAt(index)
//                       .hallSessions
//                       .length,
//                   itemBuilder: (context, indexList2) {
//                     return Column(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             try {
//                               Navigator.of(context).push(
//                                   MaterialPageRoute(
//                                       builder:
//                                           (context) =>
//                                               SessionDetail(
//                                                 sessions: snapshot
//                                                     .data!
//                                                     .day_2
//                                                     .dayHalls
//                                                     .elementAt(index)
//                                                     .hallSessions
//                                                     .elementAt(indexList2),
//                                                 hallIndex:
//                                                     index,
//                                                 sessionIndex:
//                                                     indexList2,
//                                                 allSessionsList: snapshot
//                                                     .data!
//                                                     .day_2
//                                                     .dayHalls
//                                                     .elementAt(index)
//                                                     .hallSessions,
//                                                 comingFrom: snapshot
//                                                     .data!
//                                                     .day_2
//                                                     .dayHalls
//                                                     .elementAt(index)
//                                                     .hallSessions
//                                                     .elementAt(indexList2)
//                                                     .sessionName
//                                                     .toString()
//                                                     .toLowerCase(),
//                                               )));
//                             } catch (e) {
//                               print(e);
//                             }
//                           },
//                           child: Container(
//                             width:
//                                 MediaQuery.of(context)
//                                         .size
//                                         .width *
//                                     0.82.w,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors
//                                       .grey.shade400,
//                                   spreadRadius: 1,
//                                   blurRadius: 5,
//                                 )
//                               ],
//                               borderRadius:
//                                   BorderRadius
//                                       .circular(8),
//                             ),
//                             margin: const EdgeInsets
//                                     .symmetric(
//                                 vertical: 5),
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets
//                                           .symmetric(
//                                       vertical: 10),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .start,
//                                 crossAxisAlignment:
//                                     CrossAxisAlignment
//                                         .start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets
//                                             .symmetric(
//                                         horizontal:
//                                             20),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment
//                                               .start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                       children: [
//                                         SizedBox(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.5.w,
//                                           child: Text(
//                                             '${snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDay}${'-> '}${snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionHall}\n',
//                                             style:
//                                                 TextStyle(
//                                               color: const Color(
//                                                   0xff8e3434),
//                                               fontSize:
//                                                   14.sp,
//                                               fontWeight:
//                                                   FontWeight.w700,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets
//                                             .symmetric(
//                                         horizontal:
//                                             20),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment
//                                               .start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                       children: [
//                                         SizedBox(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.5.w,
//                                           child: Text(
//                                             '${snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionName}\n',
//                                             style:
//                                                 const TextStyle(
//                                               color: Colors
//                                                   .black,
//                                               fontWeight:
//                                                   FontWeight.w700,
//                                             ),
//                                           ),
//                                         ),
//                                         Text(
//                                           '${snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionTime}\n',
//                                           style:
//                                               const TextStyle(
//                                             color: Colors
//                                                 .grey,
//                                             fontWeight:
//                                                 FontWeight
//                                                     .w700,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     width:
//                                         MediaQuery.of(
//                                                 context)
//                                             .size
//                                             .width,
//                                     padding: const EdgeInsets
//                                             .symmetric(
//                                         horizontal:
//                                             20,
//                                         vertical: 10),
//                                     child: InkWell(
//                                       onTap: () {
//                                         Navigator.of(
//                                                 context)
//                                             .push(MaterialPageRoute(
//                                                 builder: (context) => SessionDetail(
//                                                       sessions: snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
//                                                       hallIndex: index,
//                                                       sessionIndex: indexList2,
//                                                       allSessionsList: snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions,
//                                                     )));
//                                       },
//                                       child: InkWell(
//                                         onTap: () {
//                                           Navigator.of(
//                                                   context)
//                                               .push(MaterialPageRoute(
//                                                   builder: (context) => SessionDetail(
//                                                         sessions: snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
//                                                         hallIndex: index,
//                                                         sessionIndex: indexList2,
//                                                         allSessionsList: snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions,
//                                                       )));
//                                         },
//                                         child: Text(
//                                           '${snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDetail.toString().replaceAll('<br />\r\n<br />\r\n', '').replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '')}',
//                                           maxLines:
//                                               100,
//                                           style:
//                                               const TextStyle(
//                                             color: Color(
//                                                 0xff8e3434),
//                                             fontWeight:
//                                                 FontWeight
//                                                     .w700,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//           ),
//           SizedBox(height: 6.h)
//         ],
//       ),
//     ),
//     Visibility(
//       visible: index <=
//           snapshot.data!.day_3.dayHalls.length,
//       child: Column(
//         children: [
//           SizedBox(height: 5.h),
//           Visibility(
//             visible: snapshot.data!.day_3.dayHalls
//                 .elementAt(index)
//                 .hallDetail
//                 .toString()
//                 .isNotEmpty,
//             child: Container(
//               width:
//                   MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.circular(8),
//                 border: Border.all(
//                     width: 0.2,
//                     color: Colors.black12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 8),
//                 child: Column(
//                   crossAxisAlignment:
//                       CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 5),
//                       child: Row(
//                         mainAxisAlignment:
//                             MainAxisAlignment.start,
//                         crossAxisAlignment:
//                             CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${snapshot.data?.day_3.dayHalls.elementAt(index).hallDetail}\n',
//                             style: const TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: tabHeight,
//             // (snapshot.data?.day_3.dayHalls.length ??
//             //             0) >
//             //         2
//             //     ? MediaQuery.of(context).size.height *
//             //         0.4.h
//             //     : MediaQuery.of(context).size.height *
//             //         0.20.h,
//             child: MediaQuery.removePadding(
//               context: context,
//               removeTop: true,
//               child: ListView.builder(
//                   // padding:
//                   //     const EdgeInsets.only(bottom: 20),
//                   itemCount: snapshot
//                       .data?.day_3.dayHalls
//                       .elementAt(index)
//                       .hallSessions
//                       .length,
//                   itemBuilder: (context, indexList2) {
//                     return Column(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             try {
//                               Navigator.of(context).push(
//                                   MaterialPageRoute(
//                                       builder:
//                                           (context) =>
//                                               SessionDetail(
//                                                 sessions: snapshot
//                                                     .data
//                                                     ?.day_3
//                                                     .dayHalls
//                                                     .elementAt(index)
//                                                     .hallSessions
//                                                     .elementAt(indexList2),
//                                                 hallIndex:
//                                                     index,
//                                                 sessionIndex:
//                                                     indexList2,
//                                                 allSessionsList: snapshot
//                                                     .data
//                                                     ?.day_3
//                                                     .dayHalls
//                                                     .elementAt(index)
//                                                     .hallSessions,
//                                                 comingFrom: snapshot
//                                                     .data
//                                                     ?.day_3
//                                                     .dayHalls
//                                                     .elementAt(index)
//                                                     .hallSessions
//                                                     .elementAt(indexList2)
//                                                     .sessionName
//                                                     .toString()
//                                                     .toLowerCase(),
//                                               )));
//                             } catch (e) {
//                               print(e);
//                             }
//                           },
//                           child: Container(
//                             width:
//                                 MediaQuery.of(context)
//                                         .size
//                                         .width *
//                                     0.82.w,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors
//                                       .grey.shade400,
//                                   spreadRadius: 1,
//                                   blurRadius: 5,
//                                 )
//                               ],
//                               borderRadius:
//                                   BorderRadius
//                                       .circular(8),
//                             ),
//                             margin: const EdgeInsets
//                                     .symmetric(
//                                 vertical: 5),
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets
//                                           .symmetric(
//                                       vertical: 10),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .start,
//                                 crossAxisAlignment:
//                                     CrossAxisAlignment
//                                         .start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets
//                                             .symmetric(
//                                         horizontal:
//                                             20),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment
//                                               .start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                       children: [
//                                         SizedBox(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.5.w,
//                                           child: Text(
//                                             '${snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDay}${'-> '}${snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionHall}\n',
//                                             style:
//                                                 TextStyle(
//                                               color: const Color(
//                                                   0xff8e3434),
//                                               fontSize:
//                                                   14.sp,
//                                               fontWeight:
//                                                   FontWeight.w700,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets
//                                             .symmetric(
//                                         horizontal:
//                                             20),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment
//                                               .start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                       children: [
//                                         SizedBox(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.5.w,
//                                           child: Text(
//                                             '${snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionName}\n',
//                                             style:
//                                                 const TextStyle(
//                                               color: Colors
//                                                   .black,
//                                               fontWeight:
//                                                   FontWeight.w700,
//                                             ),
//                                           ),
//                                         ),
//                                         Text(
//                                           '${snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionTime}\n',
//                                           style:
//                                               const TextStyle(
//                                             color: Colors
//                                                 .grey,
//                                             fontWeight:
//                                                 FontWeight
//                                                     .w700,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     width:
//                                         MediaQuery.of(
//                                                 context)
//                                             .size
//                                             .width,
//                                     padding: const EdgeInsets
//                                             .symmetric(
//                                         horizontal:
//                                             20,
//                                         vertical: 10),
//                                     child: InkWell(
//                                       onTap: () {
//                                         Navigator.of(
//                                                 context)
//                                             .push(MaterialPageRoute(
//                                                 builder: (context) => SessionDetail(
//                                                       sessions: snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
//                                                       hallIndex: index,
//                                                       sessionIndex: indexList2,
//                                                       allSessionsList: snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions,
//                                                     )));
//                                       },
//                                       child: InkWell(
//                                         onTap: () {
//                                           Navigator.of(
//                                                   context)
//                                               .push(MaterialPageRoute(
//                                                   builder: (context) => SessionDetail(
//                                                         sessions: snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
//                                                         hallIndex: index,
//                                                         sessionIndex: indexList2,
//                                                         allSessionsList: snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions,
//                                                       )));
//                                         },
//                                         child: Text(
//                                           '${snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDetail.toString().replaceAll('<br />\r\n<br />\r\n<br />\r\n<br />\r\n', '').replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '')}',
//                                           maxLines:
//                                               100,
//                                           style:
//                                               const TextStyle(
//                                             color: Color(
//                                                 0xff8e3434),
//                                             fontWeight:
//                                                 FontWeight
//                                                     .w700,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//           ),
//           SizedBox(height: 6.h)
//         ],
//       ),
//     ),
//     Visibility(
//       visible: index <=
//           snapshot.data!.day_4.dayHalls.length,
//       child: Column(
//         children: [
//           SizedBox(height: 5.h),
//           Visibility(
//             visible: snapshot.data!.day_4.dayHalls
//                 .elementAt(index)
//                 .hallDetail
//                 .toString()
//                 .isNotEmpty,
//             child: Container(
//               width:
//                   MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.circular(8),
//                 border: Border.all(
//                     width: 0.2,
//                     color: Colors.black12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 8),
//                 child: Column(
//                   crossAxisAlignment:
//                       CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 5),
//                       child: Row(
//                         mainAxisAlignment:
//                             MainAxisAlignment.start,
//                         crossAxisAlignment:
//                             CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${snapshot.data?.day_4.dayHalls.elementAt(index).hallDetail}\n',
//                             style: const TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: tabHeight,
//             // (snapshot.data?.day_4.dayHalls.length ??
//             //             0) >
//             //         2
//             //     ? MediaQuery.of(context).size.height *
//             //         0.4.h
//             //     : MediaQuery.of(context).size.height *
//             //         0.20.h,
//             child: MediaQuery.removePadding(
//               context: context,
//               removeTop: true,
//               child: ListView.builder(
//                   // padding:
//                   //     const EdgeInsets.only(bottom: 20),
//                   itemCount: snapshot
//                       .data?.day_4.dayHalls
//                       .elementAt(index)
//                       .hallSessions
//                       .length,
//                   itemBuilder: (context, indexList2) {
//                     return Column(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             try {
//                               Navigator.of(context).push(
//                                   MaterialPageRoute(
//                                       builder:
//                                           (context) =>
//                                               SessionDetail(
//                                                 sessions: snapshot
//                                                     .data
//                                                     ?.day_4
//                                                     .dayHalls
//                                                     .elementAt(index)
//                                                     .hallSessions
//                                                     .elementAt(indexList2),
//                                                 hallIndex:
//                                                     index,
//                                                 sessionIndex:
//                                                     indexList2,
//                                                 allSessionsList: snapshot
//                                                     .data
//                                                     ?.day_4
//                                                     .dayHalls
//                                                     .elementAt(index)
//                                                     .hallSessions,
//                                                 comingFrom: snapshot
//                                                     .data
//                                                     ?.day_4
//                                                     .dayHalls
//                                                     .elementAt(index)
//                                                     .hallSessions
//                                                     .elementAt(indexList2)
//                                                     .sessionName
//                                                     .toString()
//                                                     .toLowerCase(),
//                                               )));
//                             } catch (e) {
//                               print(e);
//                             }
//                           },
//                           child: Container(
//                             width:
//                                 MediaQuery.of(context)
//                                         .size
//                                         .width *
//                                     0.82.w,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors
//                                       .grey.shade400,
//                                   spreadRadius: 1,
//                                   blurRadius: 5,
//                                 )
//                               ],
//                               borderRadius:
//                                   BorderRadius
//                                       .circular(8),
//                             ),
//                             margin: const EdgeInsets
//                                     .symmetric(
//                                 vertical: 5),
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets
//                                           .symmetric(
//                                       vertical: 10),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .start,
//                                 crossAxisAlignment:
//                                     CrossAxisAlignment
//                                         .start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets
//                                             .symmetric(
//                                         horizontal:
//                                             20),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment
//                                               .start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                       children: [
//                                         SizedBox(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.5.w,
//                                           child: Text(
//                                             '${snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDay}${'-> '}${snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionHall}\n',
//                                             style:
//                                                 TextStyle(
//                                               color: const Color(
//                                                   0xff8e3434),
//                                               fontSize:
//                                                   14.sp,
//                                               fontWeight:
//                                                   FontWeight.w700,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets
//                                             .symmetric(
//                                         horizontal:
//                                             20),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment
//                                               .start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                       children: [
//                                         SizedBox(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.5.w,
//                                           child: Text(
//                                             '${snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionName}\n',
//                                             style:
//                                                 const TextStyle(
//                                               color: Colors
//                                                   .black,
//                                               fontWeight:
//                                                   FontWeight.w700,
//                                             ),
//                                           ),
//                                         ),
//                                         Text(
//                                           '${snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionTime}\n',
//                                           style:
//                                               const TextStyle(
//                                             color: Colors
//                                                 .grey,
//                                             fontWeight:
//                                                 FontWeight
//                                                     .w700,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     width:
//                                         MediaQuery.of(
//                                                 context)
//                                             .size
//                                             .width,
//                                     padding: const EdgeInsets
//                                             .symmetric(
//                                         horizontal:
//                                             20,
//                                         vertical: 10),
//                                     child: InkWell(
//                                       onTap: () {
//                                         Navigator.of(
//                                                 context)
//                                             .push(MaterialPageRoute(
//                                                 builder: (context) => SessionDetail(
//                                                       sessions: snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
//                                                       hallIndex: index,
//                                                       sessionIndex: indexList2,
//                                                       allSessionsList: snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions,
//                                                     )));
//                                       },
//                                       child: InkWell(
//                                         onTap: () {
//                                           Navigator.of(
//                                                   context)
//                                               .push(MaterialPageRoute(
//                                                   builder: (context) => SessionDetail(
//                                                         sessions: snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
//                                                         hallIndex: index,
//                                                         sessionIndex: indexList2,
//                                                         allSessionsList: snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions,
//                                                       )));
//                                         },
//                                         child: Text(
//                                           '${snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDetail.toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '')}',
//                                           maxLines:
//                                               100,
//                                           style:
//                                               const TextStyle(
//                                             color: Color(
//                                                 0xff8e3434),
//                                             fontWeight:
//                                                 FontWeight
//                                                     .w700,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//           ),
//           SizedBox(height: 6.h)
//         ],
//       ),
//     ),
//   ],
// ),

// const SizedBox(height: 10),
// Container(
//   width: MediaQuery.of(context).size.width * 0.9.w,
//   height: 50.h,
//   decoration: const BoxDecoration(
//     color: Color(0xff8e3434),
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(10),
//       bottomLeft: Radius.circular(10),
//       topRight: Radius.circular(10),
//       bottomRight: Radius.circular(10),
//     ),
//   ),
//   child: const Center(
//     child: Text(
//       'March 2023',
//       style: TextStyle(
//         color: Colors.white,
//       ),
//     ),
//   ),
// ),

// const SizedBox(height: 10),
// SizedBox(
//   child: TabBar(
//     controller: tabController,
//     labelColor: const Color(0xff8e3434),
//     unselectedLabelColor: Colors.black87,
//     indicatorSize: TabBarIndicatorSize.label,
//     tabs: [
//       Column(
//         children: [
//           const Tab(text: 'Thur'),
//           Tab(
//             text: snapshot.data?.day_1.dayDate
//                 .toString()
//                 .replaceAll(' ', '')
//                 .substring(5, 7),
//           ),
//         ],
//       ),
//       Column(
//         children: [
//           const Tab(text: 'Fri'),
//           Tab(
//             text: snapshot.data?.day_2.dayDate
//                 .toString()
//                 .replaceAll(' ', '')
//                 .substring(5, 7),
//           ),
//         ],
//       ),
//       Column(
//         children: [
//           const Tab(text: 'Sat'),
//           Tab(
//             text: snapshot.data?.day_3.dayDate
//                 .toString()
//                 .replaceAll(' ', '')
//                 .substring(5, 7),
//           ),
//         ],
//       ),
//       Column(
//         children: [
//           const Tab(text: 'Sun'),
//           Tab(
//             text: snapshot.data?.day_4.dayDate
//                 .toString()
//                 .replaceAll(' ', '')
//                 .substring(5, 7),
//           ),
//         ],
//       ),
//     ],
//   ),
// ),
