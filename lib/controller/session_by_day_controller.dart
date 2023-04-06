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
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString('data');

      Data? event;

      event =
          Data.fromJson(jsonDecode(jsondata) as Map<String, dynamic>, '$day');
      print(event);
      print(prefs.getString('data'));
      return event;
    } catch (e) {
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
        if (element.sessionType == 'Learning sessions') {
          allhallSessions.add(element);
        }
      }
    }
    for (var element in event1.day_2.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Learning sessions') {
          allhallSessions.add(element);
        }
      }
    }
    for (var element in event2.day_3.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Learning sessions') {
          allhallSessions.add(element);
        }
      }
    }
    for (var element in event3.day_4.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Learning sessions') {
          allhallSessions.add(element);
        }
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
        if (element.sessionType == 'Fellows course') {
          allhallSessions.add(element);
        }
      }
    }
    for (var element in event1.day_2.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Fellows course') {
          allhallSessions.add(element);
        }
      }
    }
    for (var element in event2.day_3.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Fellows course') {
          allhallSessions.add(element);
        }
      }
    }
    for (var element in event3.day_4.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Fellows course') {
          allhallSessions.add(element);
        }
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

    event = Data.fromJson(jsonDecode(jsondata), 'day_1');
    event1 = Data.fromJson(jsonDecode(jsondata), 'day_2');
    event2 = Data.fromJson(jsonDecode(jsondata), 'day_3');
    event3 = Data.fromJson(jsonDecode(jsondata), 'day_4');

    for (var element in event.day_1.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Fellows case corners') {
          allhallSessions.add(element);
        }
      }
    }
    for (var element in event1.day_2.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Fellows case corners') {
          allhallSessions.add(element);
        }
      }
    }
    for (var element in event2.day_3.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Fellows case corners') {
          allhallSessions.add(element);
        }
      }
    }
    for (var element in event3.day_4.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Fellows case corners') {
          allhallSessions.add(element);
        }
      }
    }
    return allhallSessions;
  }

  Future<List<HallSessions>> getVillageData() async {
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
        if (element.sessionType == 'Training villages') {
          allhallSessions.add(element);
        }
      }
    }
    for (var element in event1.day_2.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Training villages') {
          allhallSessions.add(element);
        }
      }
    }
    for (var element in event2.day_3.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Training villages') {
          allhallSessions.add(element);
        }
      }
    }
    for (var element in event3.day_4.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType == 'Training villages') {
          allhallSessions.add(element);
        }
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
        }
      }
    }
    event = Data.fromJson(jsonDecode(jsondata), 'day_2');
    for (var element in event.day_2.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType!.toLowerCase() == type.toLowerCase()) {
          allhallSessions.add(element);
        }
      }
    }
    event = Data.fromJson(jsonDecode(jsondata), 'day_3');
    for (var element in event.day_3.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType!.toLowerCase() == type.toLowerCase()) {
          allhallSessions.add(element);
        }
      }
    }
    event = Data.fromJson(jsonDecode(jsondata), 'day_4');
    for (var element in event.day_4.dayHalls) {
      for (var element in element.hallSessions) {
        if (element.sessionType!.toLowerCase() == type.toLowerCase()) {
          allhallSessions.add(element);
        }
      }
    }

    return allhallSessions;
  }
}
