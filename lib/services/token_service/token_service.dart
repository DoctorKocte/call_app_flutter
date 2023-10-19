import 'package:call_app/services/secure_service/secure_service.dart';
import 'package:call_app/services/token_service/entity/token_dto.dart';
import 'package:rxdart/rxdart.dart';

abstract class _TokensKeys {
  static const String accessTokenKey = 'ACCESS_TOKEN_KEY';
  static const String refreshTokenKey = 'REFRESH_TOKEN_KEY';
}

abstract class TokenServiceProtocol {
  TokenDTO? get tokens;
  String? get accessToken;
  String? get refreshToken;
  Future<void> fetchTokens();
  Future<void> setTokens(String auth, String refresh);

  Future<void> removeTokens();
}

class TokenService implements TokenServiceProtocol {

  final SecureStorage secureStorage = SecureStorage();

  final BehaviorSubject<TokenDTO?> _tokensSubject =
      BehaviorSubject<TokenDTO?>();

  @override
  TokenDTO? get tokens =>
      _tokensSubject.hasValue ? _tokensSubject.value : null;

  @override
  String? get accessToken =>
      _tokensSubject.hasValue ? _tokensSubject.value?.accessToken : null;

  @override
  String? get refreshToken =>
      _tokensSubject.hasValue ? _tokensSubject.value?.refreshToken : null;

  @override
  Future<void> setTokens(String access, String refresh) async {
    await secureStorage.writeValue(
      key: _TokensKeys.accessTokenKey,
      value: access,
    );
    await secureStorage.writeValue(
      key: _TokensKeys.refreshTokenKey,
      value: refresh,
    );

    _tokensSubject.add(
      TokenDTO(
        accessToken: access,
        refreshToken: refresh,
      ),
    );
  }

  @override
  Future<void> fetchTokens() async {
    final accessToken =
        await secureStorage.readValue(key: _TokensKeys.accessTokenKey);
    final refreshToken =
        await secureStorage.readValue(key: _TokensKeys.refreshTokenKey);

    if (accessToken != null && refreshToken != null) {
      _tokensSubject
          .add(TokenDTO(accessToken: accessToken, refreshToken: refreshToken));
    } else if (accessToken == null || refreshToken == null) {
      await removeTokens();
    }
  }

  @override
  Future<void> removeTokens() async {
    await secureStorage.remove(key: _TokensKeys.accessTokenKey);
    await secureStorage.remove(key: _TokensKeys.refreshTokenKey);

    _tokensSubject.add(null);
  }

  void dispose() {
    _tokensSubject.close();
  }
}
