import 'package:flutter_bloc/flutter_bloc.dart';
part 'queue_state.dart';

class QueueCubit extends Cubit<QueueState> {
  QueueCubit() : super(QueueInitial());
  static QueueCubit get(context) => BlocProvider.of(context);
}
