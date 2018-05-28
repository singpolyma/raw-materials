-- A student who passes the examination becomes a graduate
module Graduate (Student, ExamResults(..), mkStudent, graduateStudent) where

data Student = Student {
		graduated :: Bool
	}

data ExamResults = ExamResults {
		student :: Student,
		passed :: Bool
	}

mkStudent :: Student
mkStudent = Student False

graduateStudent :: ExamResults -> Student
graduateStudent (ExamResults student False) = student
graduateStudent (ExamResults student True) = student { graduated = True }
