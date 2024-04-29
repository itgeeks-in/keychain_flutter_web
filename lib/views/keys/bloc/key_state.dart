class KeyState{

}
class InitialKeysState extends KeyState{

}
class LoadKeysState extends KeyState{

}
class SucessKeysState extends KeyState{


}
class FailedKeysState extends KeyState{
  String msg;
  FailedKeysState(this.msg);
}