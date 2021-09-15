class JwtAuthTicket {
  final String accessToken;
  final String refreshToken;

  JwtAuthTicket(this.accessToken, this.refreshToken);

  JwtAuthTicket.fromJson(Map<String, dynamic> json)
      : accessToken = json['accessToken'],
        refreshToken = json['refreshToken'];
}
