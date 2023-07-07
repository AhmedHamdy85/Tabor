part of 'queue_logic.dart';

abstract class QueueState {}

class QueueInitial extends QueueState {}

class GetQueueLoadingState extends QueueState {}

class GetQueueSuccesState extends QueueState {}

class GetQueueErorrState extends QueueState {}

class GetServicesLoadingState extends QueueState {}

class GetServicesSuccesState extends QueueState {}

class GetServicesErorrState extends QueueState {}

class CreateTeckitLoadingState extends QueueState {}

class CreateTeckitSuccesState extends QueueState {}

class CreateTeckitErorrState extends QueueState {}
