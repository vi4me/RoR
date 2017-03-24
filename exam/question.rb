require './answer'

class Question
  attr_reader :quistion, :answers, :success
  attr_writer :answer

  def initialize(quistion, answers, success)
    @quistion = quistion
    @answers = answers
    @success = success
  end

  class << self
    def create_from_data(data)
      transform_data = data.split('->').map(&:strip)
      quistion = transform_data.first
      answers = transform_data[1].split(',').map(&:strip)

      success_data = transform_data.last
      success = answers.index(success_data[1, success_data.size - 2])

      new(quistion, Answer.new(answers), success)
    end
  end

  def done?
    !@answer.nil?
  end

  def success?
    done? && (@answer == @success)
  end

  def show
    puts quistion # "Как меня зовут?"
    answers.show
  end

  def get_answer!
    answ = gets.chomp
    @answer = answers.transform(answ)
  end
end