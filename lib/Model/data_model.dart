// ignore_for_file: unrelated_type_equality_checks

class Data {
  Data({
    required this.sessionTypes,
    required this.foreignFaculty,
    required this.localFaculty,
    required this.eventSponsors,
    required this.eventName,
    required this.eventDates,
    required this.eventVenue,
    required this.day_1,
    required this.day_2,
    required this.day_3,
    required this.day_4,
  });
  late final List<String> sessionTypes;
  late final List<String> foreignFaculty;
  late final List<String> localFaculty;
  late final List<String> eventSponsors;
  late final String eventName;
  late final String eventDates;
  late final String eventVenue;
  late final Day1 day_1;
  late final Day2 day_2;
  late final Day3 day_3;
  late final Day4 day_4;

  Data.fromJson(Map<String, dynamic> json, dynamic day) {
    sessionTypes = List.castFrom<dynamic, String>(json['session_types']);
    foreignFaculty = List.castFrom<dynamic, String>(json['foreign_faculty']);
    localFaculty = List.castFrom<dynamic, String>(json['local_faculty']);
    eventSponsors = List.castFrom<dynamic, String>(json['event_sponsors']);
    eventName = json['event_name'];
    eventDates = json['event_dates'];
    eventVenue = json['event_venue'];
    day_1 = Day1.fromJson(json['day_1']);
    day_2 = Day2.fromJson(json['day_2']);
    day_3 = Day3.fromJson(json['day_3']);
    day_4 = Day4.fromJson(json['day_4']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['session_types'] = sessionTypes;
    data['foreign_faculty'] = foreignFaculty;
    data['local_faculty'] = localFaculty;
    data['event_sponsors'] = eventSponsors;
    data['event_name'] = eventName;
    data['event_dates'] = eventDates;
    data['event_venue'] = eventVenue;
    data['day_1'] = day_1.toJson();
    data['day_2'] = day_2.toJson();
    data['day_3'] = day_3.toJson();
    data['day_4'] = day_4.toJson();
    return data;
  }
}

class Day1 {
  Day1({
    required this.dayName,
    required this.dayDate,
    required this.dayHalls,
  });
  late final String dayName;
  late final String dayDate;
  late final List<DayHalls> dayHalls;

  Day1.fromJson(Map<String, dynamic> json) {
    dayName = json['day_name'];
    dayDate = json['day_date'];
    dayHalls =
        List.from(json['day_halls']).map((e) => DayHalls.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['day_name'] = dayName;
    data['day_date'] = dayDate;
    data['day_halls'] = dayHalls.map((e) => e.toJson()).toList();
    return data;
  }
}

class Day2 {
  Day2({
    required this.dayName,
    required this.dayDate,
    required this.dayHalls,
  });
  late final String dayName;
  late final String dayDate;
  late final List<DayHalls> dayHalls;

  Day2.fromJson(Map<String, dynamic> json) {
    dayName = json['day_name'];
    dayDate = json['day_date'];
    dayHalls =
        List.from(json['day_halls']).map((e) => DayHalls.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['day_name'] = dayName;
    data['day_date'] = dayDate;
    data['day_halls'] = dayHalls.map((e) => e.toJson()).toList();
    return data;
  }
}

class Day3 {
  Day3({
    required this.dayName,
    required this.dayDate,
    required this.dayHalls,
  });
  late final String dayName;
  late final String dayDate;
  late final List<DayHalls> dayHalls;

  Day3.fromJson(Map<String, dynamic> json) {
    dayName = json['day_name'];
    dayDate = json['day_date'];
    dayHalls =
        List.from(json['day_halls']).map((e) => DayHalls.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['day_name'] = dayName;
    data['day_date'] = dayDate;
    data['day_halls'] = dayHalls.map((e) => e.toJson()).toList();
    return data;
  }
}

class Day4 {
  Day4({
    required this.dayName,
    required this.dayDate,
    required this.dayHalls,
  });
  late final String dayName;
  late final String dayDate;
  late final List<DayHalls> dayHalls;

  Day4.fromJson(Map<String, dynamic> json) {
    dayName = json['day_name'];
    dayDate = json['day_date'];
    dayHalls =
        List.from(json['day_halls']).map((e) => DayHalls.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['day_name'] = dayName;
    data['day_date'] = dayDate;
    data['day_halls'] = dayHalls.map((e) => e.toJson()).toList();
    return data;
  }
}

class DayHalls {
  DayHalls({
    required this.hallName,
    required this.hallDetail,
    required this.hallSessions,
  });
  late final String hallName;
  late final String hallDetail;
  late final List<HallSessions> hallSessions;

  DayHalls.fromJson(Map<String, dynamic> json) {
    hallName = json['hall_name'];
    hallDetail = json['hall_detail'];
    hallSessions = List.from(json['hall_sessions'])
        .map((e) => HallSessions.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['hall_name'] = hallName;
    data['hall_detail'] = hallDetail;
    data['hall_sessions'] = hallSessions.map((e) => e.toJson()).toList();
    return data;
  }
}

class HallSessions {
  String? sessionName;
  String? sessionDetail;
  String? sessionTime;
  String? sessionDay;
  String? sessionDate;
  String? sessionHall;
  String? sessionType;
  List<SessionModerators>? sessionModerators;
  List<SessionFacilitators>? sessionFacilitators;
  List<SessionChairpersons>? sessionChairpersons;
  List<SessionTimeSlots>? sessionTimeSlots;

  HallSessions(
      {this.sessionName,
      this.sessionDetail,
      this.sessionTime,
      this.sessionDay,
      this.sessionDate,
      this.sessionHall,
      this.sessionType,
      this.sessionModerators,
      this.sessionFacilitators,
      this.sessionChairpersons,
      this.sessionTimeSlots});

  HallSessions.fromJson(Map<String, dynamic> json) {
    sessionName = json['session_name'];
    sessionDetail = json['session_detail'];
    sessionTime = json['session_time'];
    sessionDay = json['session_day'];
    sessionDate = json['session_date'];
    sessionHall = json['session_hall'];
    sessionType = json['session_type'];
    if (json['session_moderators'] != false) {
      sessionModerators = <SessionModerators>[];
      json['session_moderators'].forEach((v) {
        sessionModerators!.add(SessionModerators.fromJson(v));
      });
    }

    if (json['session_facilitators'] != false) {
      sessionFacilitators = <SessionFacilitators>[];
      json['session_facilitators'].forEach((v) {
        sessionFacilitators!.add(SessionFacilitators.fromJson(v));
      });
    }
    if (json['session_chairpersons'] != false) {
      sessionChairpersons = <SessionChairpersons>[];
      json['session_chairpersons'].forEach((v) {
        sessionChairpersons!.add(SessionChairpersons.fromJson(v));
      });
    }
    if (json['session_time_slots'] != false) {
      sessionTimeSlots = <SessionTimeSlots>[];
      json['session_time_slots'].forEach((v) {
        sessionTimeSlots!.add(SessionTimeSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['session_name'] = sessionName;
    data['session_detail'] = sessionDetail;
    data['session_time'] = sessionTime;
    data['session_day'] = sessionDay;
    data['session_date'] = sessionDate;
    data['session_hall'] = sessionHall;
    data['session_type'] = sessionType;
    if (sessionModerators != false) {
      data['session_moderators'] =
          sessionModerators!.map((v) => v.toJson()).toList();
    }
    if (sessionFacilitators != false) {
      data['session_facilitators'] =
          sessionFacilitators!.map((v) => v.toJson()).toList();
    }
    if (sessionChairpersons != false) {
      data['session_chairpersons'] =
          sessionChairpersons!.map((v) => v.toJson()).toList();
    }
    if (sessionTimeSlots != false) {
      data['session_time_slots'] =
          sessionTimeSlots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SessionModerators {
  SessionModerator? sessionModerator;

  SessionModerators({this.sessionModerator});

  SessionModerators.fromJson(Map<String, dynamic> json) {
    sessionModerator = json['session_moderator'] != false
        ? SessionModerator.fromJson(json['session_moderator'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sessionModerator != false) {
      data['session_moderator'] = sessionModerator!.toJson();
    }
    return data;
  }
}

class SessionModerator {
  int? iD;
  String? userFirstname;
  String? userLastname;
  String? nickname;
  String? userNicename;
  String? displayName;
  String? userEmail;
  String? userUrl;
  String? userRegistered;
  String? userDescription;
  dynamic userAvatar;

  SessionModerator(
      {this.iD,
      this.userFirstname,
      this.userLastname,
      this.nickname,
      this.userNicename,
      this.displayName,
      this.userEmail,
      this.userUrl,
      this.userRegistered,
      this.userDescription,
      this.userAvatar});

  SessionModerator.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    userFirstname = json['user_firstname'];
    userLastname = json['user_lastname'];
    nickname = json['nickname'];
    userNicename = json['user_nicename'];
    displayName = json['display_name'];
    userEmail = json['user_email'];
    userUrl = json['user_url'];
    userRegistered = json['user_registered'];
    userDescription = json['user_description'];
    userAvatar = json['user_avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['user_firstname'] = userFirstname;
    data['user_lastname'] = userLastname;
    data['nickname'] = nickname;
    data['user_nicename'] = userNicename;
    data['display_name'] = displayName;
    data['user_email'] = userEmail;
    data['user_url'] = userUrl;
    data['user_registered'] = userRegistered;
    data['user_description'] = userDescription;
    data['user_avatar'] = userAvatar;
    return data;
  }
}

class SessionFacilitators {
  SessionModerator? sessionFacilitator;

  SessionFacilitators({this.sessionFacilitator});

  SessionFacilitators.fromJson(Map<String, dynamic> json) {
    sessionFacilitator = json['session_facilitator'] != false
        ? SessionModerator.fromJson(json['session_facilitator'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sessionFacilitator != false) {
      data['session_facilitator'] = sessionFacilitator!.toJson();
    }
    return data;
  }
}

class SessionChairpersons {
  SessionModerator? sessionChairperson;

  SessionChairpersons({this.sessionChairperson});

  SessionChairpersons.fromJson(Map<String, dynamic> json) {
    sessionChairperson = json['session_chairperson'] != false
        ? SessionModerator.fromJson(json['session_chairperson'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sessionChairperson != false) {
      data['session_chairperson'] = sessionChairperson!.toJson();
    }
    return data;
  }
}

class SessionTimeSlots {
  String? time;
  String? title;
  List<FacilitatorsSpeakers>? facilitatorsSpeakers;

  SessionTimeSlots({this.time, this.title, this.facilitatorsSpeakers});

  SessionTimeSlots.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    title = json['title'];
    if (json['facilitators_speakers'] != false) {
      facilitatorsSpeakers = <FacilitatorsSpeakers>[];
      json['facilitators_speakers'].forEach((v) {
        facilitatorsSpeakers!.add(FacilitatorsSpeakers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['title'] = title;
    if (facilitatorsSpeakers != false) {
      data['facilitators_speakers'] =
          facilitatorsSpeakers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FacilitatorsSpeakers {
  SessionModerator? facilitatorSpeaker;

  FacilitatorsSpeakers({this.facilitatorSpeaker});

  FacilitatorsSpeakers.fromJson(Map<String, dynamic> json) {
    facilitatorSpeaker = json['facilitator_speaker'] != false
        ? SessionModerator.fromJson(json['facilitator_speaker'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (facilitatorSpeaker != false) {
      data['facilitator_speaker'] = facilitatorSpeaker!.toJson();
    }
    return data;
  }
}
