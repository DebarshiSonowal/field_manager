class Client {
  String? name, email, contact, contactPerson, address;
  int? id, status;

  Client.fromJson(json) {
    id = json['id'] ?? 0;
    status = json['status'] ?? 0;
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    contact = json['contact'] ?? "";
    contactPerson = json['contactPerson'] ?? "";
    address = json['address'] ?? "";
  }

//{
//                 "id": 18,
//                 "name": "Jiaul Haque",
//                 "email": "jiaulrbpo123@gmail.com",
//                 "contact": "9101906834",
//                 "address": "Ghy",
//                 "contactPerson": "Restro",
//                 "status": 1
//             },

// Client({
//   this.compnay,
//   this.pointOfContact,
//   this.id,
//   this.numberOfProjects,
// });
}

class ClientResponse {
  bool? error;
  List<Client> clients = [];
  String? message;

  ClientResponse.fromJson(json) {
    error = json["error"] ?? "";
    clients = json['data']["getAllClient"] == null
        ? []
        : (json['data']["getAllClient"] as List)
            .map((e) => Client.fromJson(e))
            .toList();
  }

  ClientResponse.withError(msg) {
    error = true;
    message = msg;
  }
}
