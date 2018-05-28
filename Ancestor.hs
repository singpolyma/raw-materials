-- An ancestor of a person P is a natural parent of P or a natural parent
-- of an ancestor of P
module Ancestor where

data NaturalParents =
	NoKnownParents |
	Mother Person |
	MotherAndFather Person Person
	deriving (Eq)

data Person = Person {
		naturalParents :: NaturalParents
	} deriving (Eq)

isAncestorOf :: Person -> Person -> Bool
isAncestorOf ancestor (Person { naturalParents = NoKnownParents }) = False
isAncestorOf ancestor (Person { naturalParents = Mother m }) =
	ancestor == m || ancestor `isAncestorOf` m
isAncestorOf ancestor (Person { naturalParents = MotherAndFather m f }) =
	ancestor == m || ancestor == f ||
	ancestor `isAncestorOf` m || ancestor `isAncestorOf` f
