class  RemoteService {
  static const String _baseUrl = 'https://awesomeapp.requestcatcher.com';

  static get loginUrl => '$_baseUrl/login';  
  static get registerUrl => '$_baseUrl/register';
  static get resetPasswordUrl => '$_baseUrl/reset-password';
}