class Task {
  static const String collectionName = "tasks";
  String title;
  String description;
  DateTime dateTime;
  String id;
  String? subTitle;
  bool isDone;
  Task(
      {this.id = ' ',
      required this.title,
      required this.dateTime,
      required this.description,
       this.subTitle,
      this.isDone = false});
//named constructor
//this refers to anything in the class

  Task.fromJson(Map<String, dynamic> data)
      : this(
            id: data['id'],
            title: data['title'],
            dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
            description: data["description"],
            subTitle: data["subtitle"]);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'isDone': isDone,
      'subTitle': subTitle
    };
  }
}
// class Task {
//   static const String collectionName = "tasks";
  
//   String? id; // Allow this to be nullable, especially for new tasks
//   String title;
//   String description;
//   DateTime dateTime;
//   bool isDone;

//   Task({
//     this.id,
//     required this.title,
//     required this.dateTime,
//     required this.description,
//     this.isDone = false,
//   });

//   // Named constructor for creating Task from Firestore data
//   Task.fromJson(Map<String, dynamic> data)
//       : id = data['id'],
//         title = data['title'],
//         description = data['description'],
//         dateTime = DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
//         isDone = data['isDone'] ?? false; // Add isDone to the constructor

//   // Convert Task to JSON for storing in Firestore
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'description': description,
//       'dateTime': dateTime.millisecondsSinceEpoch,
//       'isDone': isDone,
//     };
//   }
// }
