require './exam'
# `cat #{'exam.txt'}`.split("\n").select { |i| !i.empty? }

EXAM_FILE = '../exam1.txt'

exam = Exam.new(EXAM_FILE)


exam.start

exam.finish!
