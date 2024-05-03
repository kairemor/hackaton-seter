part of 'ticket_bloc.dart';

abstract class TicketEvent {}

class ValidateTicketFieldsEvent extends TicketEvent {
  GlobalKey<FormState> key;
  ValidateTicketFieldsEvent(this.key);
}

class TicketDeleteInitEvent extends TicketEvent {}

class TicketAddEvent extends TicketEvent {
  late Ticket ticket;
  TicketAddEvent({required this.ticket});
}

class TicketUpdateEvent extends TicketEvent {
  late Ticket ticket;
  TicketUpdateEvent({required this.ticket});
}

class TicketDeleteEvent extends TicketEvent {
  late String ticketId;
  TicketDeleteEvent({required this.ticketId});
}

class CheckFirstRunEvent extends TicketEvent {}