-- The pipes and switches of the package routing machine form a binary tree
module PipesSwitches (Pipe(..), Switch(..)) where

data Pipe = EndPipe | Pipe Switch Switch
data Switch = EndSwitch | Switch Pipe Pipe
