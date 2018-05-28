-- An account can only be closed by the person who opened it

module Account (User(..), Account(..), AuthError(..), closeAccount) where

data User = User deriving (Eq)
data Account = Account {
		openedBy :: User
	}
data AuthError = AuthError

closeAccount :: User -> Account -> IO (Either AuthError ())
closeAccount user (account@Account { openedBy = opener })
	| user == opener = Right <$> doUnsafeClose account
	| otherwise = return $ Left AuthError

doUnsafeClose :: Account -> IO ()
doUnsafeClose = undefined
