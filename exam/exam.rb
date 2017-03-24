require './question'

class Exam
  RESULT_PATH = '../result.txt'

  def initialize(file_path)
    @file_path = file_path
    @questions = read_questions
  end

  def start
    puts 'Start Exam!'
    puts 'Enter your name:'
    @name = gets.chomp
    @questions.each do |question|
        question.show

        question.get_answer!
    end
  end

  def done?
    has_questions? && @questions.map { |q| q.done? }.all?
  end

  def has_questions?
    !@questions.size.zero?
  end

  def value
    result = @questions.map do |question|
        question.success? ? 1 : 0
    end
    result.inject(&:+)
  end

  def max_value
    @questions.count
  end

  def finish!
    res = if done?
              "#{@name}, Вы набрали в тесте #{value} баллов из #{max_value}"
          else
            if has_questions?
              "#{@name}, Вы ответили не на все вопросы"
            else
              "#{@name}, вопросов нет"
            end
          end
    File.open(RESULT_PATH, 'a+') do |file|
      file.write('**********')
      file.write("\n")
      file.write(res)
      file.write("\n")
      file.write('**********')
      file.write("\n")

    end
    puts res
  end

  private

  def read_questions
    if File.exist?(@file_path) && !File.directory?(@file_path)
      File.readlines(@file_path).select { |i| !i.strip.empty? }
                         .map do |question_data|
        Question.create_from_data(question_data)
      end
    else
      []
    end
  end
end
