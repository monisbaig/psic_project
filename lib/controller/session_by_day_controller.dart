import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:psic_project/Model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

dynamic jsondata;

class SessionByDayController {
  getDataSplash() async {
    final url =
        Uri.parse('https://www.psic.org.pk/pakistan-live-2023-program-feed');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        dynamic dataResponse = response.body;
        jsondata = dataResponse;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('data', jsondata.toString());
      }
    } catch (e) {
      rethrow;
    }
  }

  // getDataSplash() async {
  //   Data? event;
  //   var value = await http.get(
  //     Uri.parse('https://www.psic.org.pk/pakistan-live-2023-program-feed'),
  //     headers: {
  //       HttpHeaders.contentTypeHeader: 'application/json',
  //     },
  //   );
  //   jsondata = value.body.toString();
  //   SharedPreferences.getInstance()
  //       .then((value) => {value.setString('data', jsondata)});
  //   return event;
  // }

  Future<List<HallSessions>> getWhatsHappening() async {
    Data? event;
    Data? event1;
    Data? event2;
    Data? event3;
    List<HallSessions> allhallSessions = [];

    event = Data.fromJson(jsonDecode(jsondata), 'day_1');
    event1 = Data.fromJson(jsonDecode(jsondata), 'day_2');
    event2 = Data.fromJson(jsonDecode(jsondata), 'day_3');
    event3 = Data.fromJson(jsonDecode(jsondata), 'day_4');

    for (var element in event.day_1.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event1.day_2.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event2.day_3.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event3.day_4.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    return allhallSessions;
  }

  Future<Data?> getData(day) async {
    try{
      // SharedPreferences.getInstance()
      //     .then((value) => {print("hello${value.getString('data')}")});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString('data');

      // Data? event;

      // print(jsondata.toString().replaceAll('\\r\\n', ''));
      return Data.fromJson(jsonDecode(jsondata) as Map<String, dynamic>, '$day');
      // return event;
    }
    catch(e) {
      rethrow;
    }

  }

  Future<List<HallSessions>> getLearningData() async {
    Data? event;
    Data? event1;
    Data? event2;
    Data? event3;
    List<HallSessions> allhallSessions = [];

    event = Data.fromJson(jsonDecode(jsondata), 'day_1');
    event1 = Data.fromJson(jsonDecode(jsondata), 'day_2');
    event2 = Data.fromJson(jsonDecode(jsondata), 'day_3');
    event3 = Data.fromJson(jsonDecode(jsondata), 'day_4');

    for (var element in event.day_1.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event1.day_2.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event2.day_3.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event3.day_4.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    return allhallSessions;
  }

  Future<List<HallSessions>> getFellowData() async {
    Data? event;
    Data? event1;
    Data? event2;
    Data? event3;
    List<HallSessions> allhallSessions = [];

    event = Data.fromJson(jsonDecode(jsondata), 'day_1');
    event1 = Data.fromJson(jsonDecode(jsondata), 'day_2');
    event2 = Data.fromJson(jsonDecode(jsondata), 'day_3');
    event3 = Data.fromJson(jsonDecode(jsondata), 'day_4');

    for (var element in event.day_1.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event1.day_2.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event2.day_3.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event3.day_4.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    return allhallSessions;
  }

  Future<List<HallSessions>> getCaseData() async {
    Data? event;
    Data? event1;
    Data? event2;
    Data? event3;
    List<HallSessions> allhallSessions = [];
    //var value=await http.get(Uri.parse('http://www.psic.org.pk/pakistan-live-2022-program-feed/'),
    // headers: {
    //HttpHeaders.contentTypeHeader:'application/json'
    // }
    //);
    event = Data.fromJson(jsonDecode(jsondata), 'day_1');
    event1 = Data.fromJson(jsonDecode(jsondata), 'day_2');
    event2 = Data.fromJson(jsonDecode(jsondata), 'day_3');
    event3 = Data.fromJson(jsonDecode(jsondata), 'day_4');

    for (var element in event.day_1.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event1.day_2.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event2.day_3.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event3.day_4.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    return allhallSessions;

    // for (var element in event.day_1.dayHalls) {
    //   for (var element in element.hallSessions) {
    //     if (element.sessionType == 'Session Type 1' &&
    //         element.sessionType == 'Session Type 2' &&
    //         element.sessionType == 'Session Type 3' &&
    //         element.sessionType == 'Session Type 4') {
    //       allhallSessions.add(element);
    //     }
    //   }
    // }
    // for (var element in event1.day_2.dayHalls) {
    //   for (var element in element.hallSessions) {
    //     if (element.sessionType == 'Session Type 1') {
    //       allhallSessions.add(element);
    //     }
    //   }
    // }
    // for (var element in event2.day_3.dayHalls) {
    //   for (var element in element.hallSessions) {
    //     if (element.sessionType == 'Sessions Type 1' &&
    //         element.sessionType == 'Session Type 2') {
    //       allhallSessions.add(element);
    //     }
    //   }
    // }
    // for (var element in event3.day_4.dayHalls) {
    //   for (var element in element.hallSessions) {
    //     if (element.sessionType == 'Session Type 1' &&
    //         element.sessionType == 'Session Type 2') {
    //       allhallSessions.add(element);
    //     }
    //   }
    // }
    // return allhallSessions;
  }

  Future<List<HallSessions>> getVillageData() async {
    Data? event;
    Data? event1;
    Data? event2;
    Data? event3;
    List<HallSessions> allhallSessions = [];
    //var value=await http.get(Uri.parse('http://www.psic.org.pk/pakistan-live-2022-program-feed/'),
    // headers: {
    //HttpHeaders.contentTypeHeader:'application/json'
    // }
    //);
    event = Data.fromJson(jsonDecode(jsondata), 'day_1');
    event1 = Data.fromJson(jsonDecode(jsondata), 'day_2');
    event2 = Data.fromJson(jsonDecode(jsondata), 'day_3');
    event3 = Data.fromJson(jsonDecode(jsondata), 'day_4');

    for (var element in event.day_1.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event1.day_2.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event2.day_3.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    for (var element in event3.day_4.dayHalls) {
      for (var element in element.hallSessions) {
        allhallSessions.add(element);
      }
    }
    return allhallSessions;
  }

  Future<List<HallSessions>> getTypeData(day, type) async {
    Data? event;
    // print(type);
    List<HallSessions> allhallSessions = [];

    event = Data.fromJson(jsonDecode(jsondata), 'day_1');
    for (var element in event.day_1.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType!.toLowerCase() == type.toLowerCase()) {
          allhallSessions.add(element);
          print(element.sessionType);
        }
      }
    }
    event = Data.fromJson(jsonDecode(jsondata), 'day_2');
    for (var element in event.day_2.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType!.toLowerCase() == type.toLowerCase()) {
          allhallSessions.add(element);
          print(element.sessionType);
        }
      }
    }
    event = Data.fromJson(jsonDecode(jsondata), 'day_3');
    for (var element in event.day_3.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType!.toLowerCase() == type.toLowerCase()) {
          allhallSessions.add(element);
          print(element.sessionType);
        }
      }
    }
    event = Data.fromJson(jsonDecode(jsondata), 'day_4');
    for (var element in event.day_4.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType!.toLowerCase() == type.toLowerCase()) {
          allhallSessions.add(element);
          print(element.sessionType);
        }
      }
    }

    return allhallSessions;
  }
}

// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:psic_project/Model/data_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// dynamic jsondata;
//
// class SessionByDayController {
//   getDataSplash() async {
//     final url =
//         Uri.parse('https://www.psic.org.pk/pakistan-live-2023-program-feed');
//     final response = await http.get(url);
//     try {
//       if (response.statusCode == 200) {
//         dynamic dataResponse = response.body;
//         jsondata = dataResponse;
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setString('data', jsondata.toString());
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   // getDataSplash() async {
//   //   Data? event;
//   //   var value = await http.get(
//   //     Uri.parse('https://www.psic.org.pk/pakistan-live-2023-program-feed'),
//   //     headers: {
//   //       HttpHeaders.contentTypeHeader: 'application/json',
//   //     },
//   //   );
//   //   jsondata = value.body.toString();
//   //   SharedPreferences.getInstance()
//   //       .then((value) => {value.setString('data', jsondata)});
//   //   return event;
//   // }
//
//   Future<Data?> getData(day) async {
//     // SharedPreferences.getInstance()
//     //     .then((value) => {print("hello${value.getString('data')}")});
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.getString('data');
//
//     // Data? event;
//
//     // print(jsondata.toString().replaceAll('\\r\\n', ''));
//     return Data.fromJson(jsonDecode(jsondata) as Map<String, dynamic>, '$day');
//     // return event;
//   }
//
//   Future<List<HallSessions>> getWhatsHappening() async {
//     Data? event;
//     Data? event1;
//     Data? event2;
//     Data? event3;
//     List<HallSessions> allhallSessions = [];
//
//     event = Data.fromJson(jsonDecode(jsondata), 'day_1');
//     event1 = Data.fromJson(jsonDecode(jsondata), 'day_2');
//     event2 = Data.fromJson(jsonDecode(jsondata), 'day_3');
//     event3 = Data.fromJson(jsonDecode(jsondata), 'day_4');
//
//     allhallSessions
//         .add(event.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event1.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event2.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event3.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//
//     return allhallSessions;
//   }
//
//   Future<List<HallSessions>> getLearningData() async {
//     Data? event;
//     Data? event1;
//     Data? event2;
//     Data? event3;
//     List<HallSessions> allhallSessions = [];
//
//     event = Data.fromJson(jsonDecode(jsondata), 'day_1');
//     event1 = Data.fromJson(jsonDecode(jsondata), 'day_2');
//     event2 = Data.fromJson(jsonDecode(jsondata), 'day_3');
//     event3 = Data.fromJson(jsonDecode(jsondata), 'day_4');
//
//     allhallSessions
//         .add(event.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event1.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event2.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event3.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//
//     return allhallSessions;
//   }
//
//   Future<List<HallSessions>> getFellowData() async {
//     Data? event;
//     Data? event1;
//     Data? event2;
//     Data? event3;
//     List<HallSessions> allhallSessions = [];
//
//     event = Data.fromJson(jsonDecode(jsondata), 'day_1');
//     event1 = Data.fromJson(jsonDecode(jsondata), 'day_2');
//     event2 = Data.fromJson(jsonDecode(jsondata), 'day_3');
//     event3 = Data.fromJson(jsonDecode(jsondata), 'day_4');
//
//     allhallSessions
//         .add(event.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event1.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event2.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event3.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//
//     return allhallSessions;
//   }
//
//   Future<List<HallSessions>> getCaseData() async {
//     Data? event;
//     Data? event1;
//     Data? event2;
//     Data? event3;
//     List<HallSessions> allhallSessions = [];
//     //var value=await http.get(Uri.parse('http://www.psic.org.pk/pakistan-live-2022-program-feed/'),
//     // headers: {
//     //HttpHeaders.contentTypeHeader:'application/json'
//     // }
//     //);
//     event = Data.fromJson(jsonDecode(jsondata), 'day_1');
//     event1 = Data.fromJson(jsonDecode(jsondata), 'day_2');
//     event2 = Data.fromJson(jsonDecode(jsondata), 'day_3');
//     event3 = Data.fromJson(jsonDecode(jsondata), 'day_4');
//
//     allhallSessions
//         .add(event.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event1.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event2.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event3.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//
//     return allhallSessions;
//   }
//
//   Future<List<HallSessions>> getVillageData() async {
//     Data? event;
//     Data? event1;
//     Data? event2;
//     Data? event3;
//     List<HallSessions> allhallSessions = [];
//     //var value=await http.get(Uri.parse('http://www.psic.org.pk/pakistan-live-2022-program-feed/'),
//     // headers: {
//     //HttpHeaders.contentTypeHeader:'application/json'
//     // }
//     //);
//     event = Data.fromJson(jsonDecode(jsondata), 'day_1');
//     event1 = Data.fromJson(jsonDecode(jsondata), 'day_2');
//     event2 = Data.fromJson(jsonDecode(jsondata), 'day_3');
//     event3 = Data.fromJson(jsonDecode(jsondata), 'day_4');
//
//     allhallSessions
//         .add(event.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event1.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event2.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//     allhallSessions.add(
//         event3.day_1!.dayHalls!.map((e) => e.hallSessions) as HallSessions);
//
//     return allhallSessions;
//   }
//
//   Future<List<HallSessions>> getTypeData(day, type) async {
//     Data? event;
//     List<HallSessions> allhallSessions = [];
//
//     event = Data.fromJson(jsonDecode(jsondata), 'day_1');
//     allhallSessions.add(event.day_1!.dayHalls!.map((e) => e.hallSessions!
//             .map((e) => e.sessionType!.toLowerCase() == type.toLowerCase()))
//         as HallSessions);
//
//     event = Data.fromJson(jsonDecode(jsondata), 'day_2');
//     allhallSessions.add(event.day_2!.dayHalls!.map((e) => e.hallSessions!
//             .map((e) => e.sessionType!.toLowerCase() == type.toLowerCase()))
//         as HallSessions);
//
//     event = Data.fromJson(jsonDecode(jsondata), 'day_3');
//     allhallSessions.add(event.day_3!.dayHalls!.map((e) => e.hallSessions!
//             .map((e) => e.sessionType!.toLowerCase() == type.toLowerCase()))
//         as HallSessions);
//
//     event = Data.fromJson(jsonDecode(jsondata), 'day_4');
//     allhallSessions.add(event.day_4!.dayHalls!.map((e) => e.hallSessions!
//             .map((e) => e.sessionType!.toLowerCase() == type.toLowerCase()))
//         as HallSessions);
//
//     return allhallSessions;
//   }
// }
