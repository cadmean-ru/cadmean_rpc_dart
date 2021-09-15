import 'jwt_auth_ticket.dart';

abstract class AuthTicketHolder {
  JwtAuthTicket? get ticket;
  set ticket(JwtAuthTicket? val);
}

class TransientAuthTicketHolder implements AuthTicketHolder {
  @override
  JwtAuthTicket? ticket;
}
