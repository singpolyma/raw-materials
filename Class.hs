-- No class has more than one teacher unless it has more than ten pupils
module Class (Class, mkClass, Teacher(..), Student(..)) where

data Teacher = Teacher
data Student = Student

-- This could be done with a big union of one-student-class,
-- two-student-class, up to 10 and we wouldn't need the smart
-- constructor, but that's not really how one would actually do it.
-- Bounded lists can do it, but you need more dependent typing than
-- standard Haskell has for that.
data Class = Class {
		teachers :: [Teacher],
		students :: [Student]
	}

mkClass :: [Teacher] -> [Student] -> Maybe Class
mkClass teachers students
	| length students > 10 = Just $ Class teachers students
	| length teachers < 2 = Just $ Class teachers students
	| otherwise = Nothing
