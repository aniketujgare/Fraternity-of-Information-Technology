import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fraternity_of_information_technology/src/data/repositories/database_repository.dart';
import 'package:fraternity_of_information_technology/src/domain/models/event_model.dart';
import 'package:fraternity_of_information_technology/src/domain/models/honour_board_model.dart';
import 'package:fraternity_of_information_technology/src/domain/models/news_model.dart';

class UploadToDb {
  var dataRepository = DatabaseRepository();
  void addNews() {
    var news = NewsModel(
      newsTitle: 'FIT Week 2K23',
      newsDate: '2023-06-02',
      newsWritersPicture:
          'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/news_images%2Ffit%20week%202023%2Fnews_writer.jpg?alt=media&token=c0679ace-3f9c-451a-927f-3dfc5c502075',
      subImages: [''],
      writersYear: 'Final Year',
      writersDepartment: 'IT',
      newsWritersName: 'Aniket Ujgare',
    );
    FirebaseFirestore.instance.collection('news').doc().set(news.toJson());
  }

  void addPastEvent() {
    var pasEvent = EventModel(
      eventTitle: ' Large Language Model',
      bannerImage:
          'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/past_events%2Fllm_2023.jpg?alt=media&token=90795218-2562-46a3-9ac7-9e648874110e',
      eventDate: '2023-06-02',
      eventOrganizers: ['Sanskruti Ghadge'],
      eventDescription: eventDes,
      eventType: EventType.workshop,
    );
    FirebaseFirestore.instance
        .collection('past_events')
        .doc()
        .set(pasEvent.toJson());
  }

  void addStudentHonour() {
    var pasEvent = HonourBoardModel(
      name: 'name',
      profilePic:
          'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/past_events%2Fllm_2023.jpg?alt=media&token=90795218-2562-46a3-9ac7-9e648874110e',
      achievements: [
        'achievements',
        'sdcdfcdscssac asd',
        'sfnjkds hsdfkj dshfkj'
      ],
      year: 'Final Year',
      department: 'IT',
    );
    FirebaseFirestore.instance
        .collection('honour_board')
        .doc()
        .set(pasEvent.toJson());
  }

  void addUpcomingEvent() {
    var upcEvent = EventModel(
        eventOrganizers: ['FIT'],
        eventTitle: 'Demo Upcoming Event',
        registrationUrl: 'https://forms.gle/Gd2CnmooE4icMaQw9');
    FirebaseFirestore.instance
        .collection('upcoming_events')
        .doc()
        .set(upcEvent.toJson());
  }
}

String eventDes = '';
