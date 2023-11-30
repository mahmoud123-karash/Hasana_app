abstract class PlayerStates {}

class InitialPlayerState extends PlayerStates {}

//paly
class LoadingPlayState extends PlayerStates {}

class SuccessPlayState extends PlayerStates {}

class ErrorPlayState extends PlayerStates {}

//stop
class LoadingStopState extends PlayerStates {}

class SuccessStopState extends PlayerStates {}

class ErrorStopState extends PlayerStates {}

//position
class SuccessGetPositionState extends PlayerStates {}

//duration
class SuccessGetDurationState extends PlayerStates {}

//seek forward
class LoadingSeekForwardState extends PlayerStates {}

class SuccessSeekForwardState extends PlayerStates {}

class ErrorSeekForwardState extends PlayerStates {}

//seek backword
class LoadingSeekBackwardState extends PlayerStates {}

class SuccessSeekBackwardState extends PlayerStates {}

class ErrorSeekBackwardState extends PlayerStates {}
