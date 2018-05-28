-- The vending machine can prevent a coin-insertion event,
-- but only the customer can cause it
module VendingMachine where

import FRP.Elerea.Simple
import Control.Monad.Trans.Class
import Control.Monad.Trans.Maybe

data CoinInsert = CoinInsert
data VendingMachineState = CoinsBlocked | CoinsNotBlocked

allowCoinInsert :: Signal (Maybe CoinInsert) -> Signal VendingMachineState -> Signal (Maybe CoinInsert)
allowCoinInsert coinInsertS stateS = runMaybeT $ do
	CoinsNotBlocked <- lift stateS
	MaybeT coinInsertS
