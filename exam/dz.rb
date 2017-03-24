class Question
  attr_reader :quistion, :variants, :success
  attr_writer :answer

  def initialize(quistion, variants, success)
    @quistion = quistion
    @variants = variants
    @success = success
  end

  def done?
    !@answer.nil?
  end

  def success?
    @answer == @success
  end
end

class Exam
  def initialize(questions)
    @questions = questions
  end

  def start
    gets
  end

  def done?

  end

  def value
    success?
  end

  def max_value

  end
end

exam = Exam.new([Question.new(...), Question.new(...)])

exam.start

'End exam' if exam.done

'' => value


