import 'auth_ticket_holder.dart';
import 'codec_provider.dart';
import 'function_url_provider.dart';
import 'transport_provider.dart';

class RpcConfiguration {
  TransportProvider transportProvider;
  CodecProvider codecProvider;
  FunctionUrlProvider functionUrlProvider;
  AuthTicketHolder authTicketHolder;

  RpcConfiguration.def()
      : transportProvider = HttpTransportProvider(),
        codecProvider = JsonCodecProvider(),
        functionUrlProvider = DefaultFunctionUrlProvider(),
        authTicketHolder = TransientAuthTicketHolder();
}
