import 'package:mongo_dart/mongo_dart.dart';


   Db mongoDatabase=Db("");
   Future<void> connectToDataBase() async {
    mongoDatabase = await Db.create('mongodb+srv://pavan:pavan@cluster0.jvkzbrq.mongodb.net/?retryWrites=true&w=majority');
    await mongoDatabase.open();
  }
