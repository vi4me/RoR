class Answer
    def initialize(options)
        @options = options
    end

    def show
        if hash?
            @options.each do |k, v| # {:a=>"Jim", :b=>"Tom", :c=>"Ivan"}
                # k: :a
                # v "Jim"
                puts "    #{k}: #{v}"
            end
        elsif array?
            @options.each_with_index do |v, i|
                puts "    #{i}: #{v}"
            end
        else
            puts 'Ошибка показа вариантов ответа!'
        end
    end

    def transform(str)
        if str.empty?
            nil
        elsif hash?
            str.to_sym
        elsif array?
            str.to_i
        else
            str
        end
    end

    private

    def hash?
        @options.is_a?(Hash)
    end

    def array?
        @options.is_a?(Array)
    end
end