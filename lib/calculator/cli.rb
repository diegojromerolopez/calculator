require_relative 'engine'

module Calculator
  class CLI
    def initialize(engine: Engine.new, stdin: $stdin, stdout: $stdout, stderr: $stderr)
      @engine = engine
      @stdin = stdin
      @stdout = stdout
      @stderr = stderr
    end

    def run(argv = [])
      if argv.empty?
        run_repl
      else
        evaluate_args(argv)
      end
    end

    private

    def evaluate_args(tokens)
      result = evaluate_tokens(tokens)
      @stdout.puts result
      0
    rescue ZeroDivisionError
      @stderr.puts 'Error: Division by zero'
      1
    rescue ArgumentError => e
      @stderr.puts(e.message.include?('Square root') ? "Error: #{e.message}" : 'Error: Invalid expression')
      1
    end

    def run_repl
      loop do
        @stdout.print 'calc> '
        line = @stdin.gets
        break if line.nil?

        cmd = line.strip
        break if %w[exit quit].include?(cmd)
        next if cmd.empty?

        execute_line(cmd)
      end
      0
    end

    def execute_line(cmd)
      result = evaluate_tokens(cmd.split)
      @stdout.puts result
    rescue ZeroDivisionError
      @stderr.puts 'Error: Division by zero'
    rescue ArgumentError => e
      @stderr.puts(e.message.include?('Square root') ? "Error: #{e.message}" : 'Error: Invalid expression')
    end

    def evaluate_tokens(tokens)
      if tokens.size == 2 && (tokens[0].casecmp('sqrt').zero? || tokens[1].casecmp('sqrt').zero?)
        val = tokens[0].casecmp('sqrt').zero? ? tokens[1] : tokens[0]
        @engine.calculate('sqrt', Float(val))
      elsif tokens.size == 3
        a = Float(tokens[0])
        op = tokens[1]
        b = Float(tokens[2])
        @engine.calculate(op, a, b)
      else
        raise ArgumentError, 'Invalid expression'
      end
    end
  end
end
