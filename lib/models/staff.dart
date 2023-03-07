class Staff {
    final String id;
    final String name;
    final String image;
    final String countryCode;
    final String phoneNumber;
    final String emailAddress;
    final String idCard;
    final String role;
    final String proofImage;
    final String organizationId;
    final String organizationName;
    final String status;
    final DateTime createdOn;
    final String createdBy;
    Staff({
        required this.id,
        required this.name,
        required this.image,
        required this.countryCode,
        required this.phoneNumber,
        required this.emailAddress,
        required this.idCard,
        required this.role,
        required this.proofImage,
        required this.organizationId,
        required this.organizationName,
        required this.status,
        required this.createdOn,
        required this.createdBy,
    });


    factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        countryCode: json["country_code"],
        phoneNumber: json["phone_number"],
        emailAddress: json["email_address"],
        idCard: json["id_card"],
        role: json["role"],
        proofImage: json["proof_image"],
        organizationId: json["organization_id"],
        organizationName: json["organization_name"],
        status: json["status"],
        createdOn: DateTime.parse(json["created_on"]),
        createdBy: json["created_by"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "country_code": countryCode,
        "phone_number": phoneNumber,
        "email_address": emailAddress,
        "id_card": idCard,
        "role": role,
        "proof_image": proofImage,
        "organization_id": organizationId,
        "organization_name": organizationName,
        "status": status,
        "created_on": createdOn.toIso8601String(),
        "created_by": createdBy,
    };
}
