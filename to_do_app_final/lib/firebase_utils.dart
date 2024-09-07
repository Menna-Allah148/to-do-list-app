import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app_final/Model/task.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(
            fromFirestore: (((snapshot, options) =>
                Task.fromJson(snapshot.data()!))),
            toFirestore: (task, options) => task.toJson());
  }

  static Future<void> addTaskToFireStore(Task task) {
    var taskCollection = getTasksCollection();
    var taskDocRef = taskCollection.doc();
    task.id = taskDocRef.id;
    return taskDocRef.set(task);
  }

  static Future<void> deleteTaskFromFireStore(Task task) {
    return getTasksCollection().doc(task.id).delete();
  }

  static Future<void> updateTask(Task task) {
    return getTasksCollection().doc(task.id).update(task.toJson());
  }

  // New edit task function
   static Future<void> isDone(Task task) {
    var collection = getTasksCollection();
    return collection.doc(task.id).update({'isDone': task.isDone});
  }

  static Future<void> edit(Task task) {
    var collection = getTasksCollection();
    return collection.doc(task.id).update(
        {'title': task.title, 'subTitle': task.subTitle, 'date': task.dateTime});
  }
}
