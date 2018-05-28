-- When a button is pressed, the machine should turn the lamp on
-- within 250 milliseconds
module TimeLimit where

-- Hmm... I could use `timeout` to *check* if this happened,
-- but I don't think I could write anything that would
-- *guarentee* it always did.  It's unclear what the goal of
-- the expression is.
