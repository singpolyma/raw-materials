-- The lift car can't move from the nth to the n+2th floor without passing
-- the n+1th floor.
module LiftCar (LiftCar, goUpOne) where

newtype LiftCar = LiftCar Int

goUpOne :: LiftCar -> LiftCar
goUpOne (LiftCar floor) = LiftCar (floor + 1)
