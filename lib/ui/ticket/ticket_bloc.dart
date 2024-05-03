import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../model/ExceptionMessage.dart';
import '../../model/ticket.dart';
import '../../service/ticket_service.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketManagementState> {
  //late SharedPreferences prefs;
  late bool finishedOnBoarding;

  TicketBloc() : super(const TicketManagementState.onboarding()) {
    on<CheckFirstRunEvent>((event, emit) async {
     // prefs = await SharedPreferences.getInstance();
      //finishedOnBoarding = prefs.getBool(finishedOnBoardingConst) ?? false;
     // if (!finishedOnBoarding) {
    //    emit(const PartnerManagementState.onboarding());
   //   }
    });

    on<ValidateTicketFieldsEvent>((event, emit) {
      if (event.key.currentState?.validate() ?? false) {
        event.key.currentState!.save();
        emit(const TicketManagementState.validTicketFields());
      } else {
        emit(const TicketManagementState.failureFillTicketFields("fill required fields"));
      }
    });

    on<TicketAddEvent>((event, emit) async {
      dynamic result = await TicketService().create(event.ticket);
      if (result != null && result is Ticket) {
        emit(TicketManagementState.addSuccess("Ticket add successfully: ${result.id}"));
      } else if (result != null && result is ExceptionMessage){
        emit(TicketManagementState.addError(result.message));
      } else {
        emit(TicketManagementState.addError("Unknown Error"));
      }
    });

    on<TicketUpdateEvent>((event, emit) async {
      dynamic result = await TicketService().update(event.ticket);
      if (result != null && result is Ticket) {
        emit(TicketManagementState.updateSuccess("Success"));
      } else {
        emit(TicketManagementState.updateError("Error"));
      }
    });

    on<TicketDeleteInitEvent>((event, emit) =>
        emit(const TicketManagementState.deleteInit()));

    on<TicketDeleteEvent>((event, emit) async {
      dynamic result = await TicketService().delete(event.ticketId);
      if (result != null && result is CustomMessage) {
        emit(TicketManagementState.deleteSuccess(result.message));
      } else if (result != null && result is ExceptionMessage){
        emit(TicketManagementState.deleteError(result.message));
      } else {
        emit(TicketManagementState.deleteError("Unknown Error"));
      }
    });
  }
}