import 'package:hive/hive.dart';
part 'booked_model.g.dart';

@HiveType(typeId: 2)
class BookedModel {
  @HiveField(0)
  final String image;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String job;

  @HiveField(3)
  final String place;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final String fees;

  BookedModel(
      {required this.image,
      required this.name,
      required this.job,
      required this.place,
      required this.phone,
      required this.fees});
}
