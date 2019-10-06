import 'package:socket_io_client/socket_io_client.dart' as IO;

main() {
  IO.Socket socket = IO.io('http://localhost:3001');

  socket.emit('join', 1);
  socket.on('message', (message) {
    print(message);
  });

  socket.emit('text-message', {
    'chat_id': 4,
    'text': '',
    'sender': 'U',
  });
}
