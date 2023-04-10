import 'package:classconnect/Backend/MongoDB.dart';
import 'package:uuid/uuid.dart';

class CreateNewConnect {
  static createNewConnect(String groupAdmin, String groupTitle,
      int freeAllowTime) async {
    var connectRoomsCollection = mongoDatabase.collection("allrooms");
    try {
      final uuid = Uuid();
      var meetingLinkId = uuid.v4();
      print(meetingLinkId);

      var response = await connectRoomsCollection.insert({
        "groupAdmin": groupAdmin,
        "groupTitle": groupTitle,
        "freeAllowTime": freeAllowTime,
        "groupMembers": [],
        "meetingId": 7077,
        "createdTime": DateTime.now(),
        "requests":[]
      });
      return false;
    }
    catch (error) {
      return true;
    }
  }

  static joinConnect(String username,String meetingLinkId, String name) async {
    var connectRoomsCollection = mongoDatabase.collection("allrooms");
    try{
      var roomData = await connectRoomsCollection.findOne({"meetingId":7077});
      print(roomData);
      if(roomData!=null)  {
        var groupMembers = roomData["groupMembers"];
        groupMembers.add({
          "username":username,
          "name":name,
          "inTime":DateTime.now(),
        });
        roomData["groupMembers"] = groupMembers;
        print(roomData);
        var updatingTheValue = await connectRoomsCollection.update({"meetingId":7077}, roomData);
      }
    }catch(error) {

    }
  }
}