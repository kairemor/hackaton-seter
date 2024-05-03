part of 'ticket_bloc.dart';

enum TicketState {
  firstRun, validTicketFields,
  failureFillTicketFields,
  addSuccess, addError,
  updateSuccess, updateError,
  deleteInit, deleteError, deleteSuccess
}

class TicketManagementState {
  final TicketState ticketState;
  final String? message;

  const TicketManagementState._(this.ticketState, {this.message});

  const TicketManagementState.onboarding(): this._(TicketState.firstRun);

  const TicketManagementState.deleteInit(): this._(TicketState.deleteInit);

  const TicketManagementState.validTicketFields(): this._(TicketState.validTicketFields);

  const TicketManagementState.failureFillTicketFields(String? message)
      : this._(TicketState.failureFillTicketFields, message: message ?? "Please fill required fields");

  TicketManagementState.addSuccess(String? message)
      : this._(TicketState.addSuccess, message: message ?? "Add Success");

  TicketManagementState.addError(String? message)
      : this._(TicketState.addError, message: message ?? "Add Error");

  TicketManagementState.updateSuccess(String? message)
      : this._(TicketState.updateSuccess, message: message ?? "Update Success");

  TicketManagementState.updateError(String? message)
      : this._(TicketState.updateError, message: message ?? "Update Error");

  TicketManagementState.deleteSuccess(String? message)
      : this._(TicketState.deleteSuccess, message: message ?? "Delete Success");

  TicketManagementState.deleteError(String? message)
      : this._(TicketState.deleteError, message: message ?? "Delete Error");
}