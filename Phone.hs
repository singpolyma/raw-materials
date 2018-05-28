-- If you lift the receiver when the phone is ringing that’s an answer-call
-- event; if it’s not ringing it’s a request-service event
module Phone where

import Control.Monad (liftM2)
import FRP.Elerea.Simple

data PhoneState = Ringing | NotRinging
data PickUpEvent = PickUp | OtherEvent
data InternalEvent = AnswerCall | RequestService

handlePickUp :: Signal PickUpEvent -> Signal PhoneState -> Signal (Maybe InternalEvent)
handlePickUp = liftM2 pickUpMap
	where
	pickUpMap PickUp = Just . stateMap
	pickUpMap _ = const Nothing
	stateMap Ringing = AnswerCall
	stateMap NotRinging = RequestService
