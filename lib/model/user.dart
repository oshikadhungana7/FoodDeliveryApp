import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';
part 'user.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
@Entity()
class User {
  @Id(assignable: true)
  int uId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? userID; 
  String? fname;
  String? lname;
  
  String? email;
  String? password;
  String? image;

  User({this.userID,
  this.fname,
   this.lname, 
   
   this.email,
   this.image, 
   this.password, this.uId = 0});

   factory User.fromJson(Map<String,dynamic>json)=>
   _$UserFromJson(json);

   Map<String,dynamic> toJson()=>_$UserToJson(this);
}
