module Calculator
  class Engine
    def calculate(op, a, b = nil)
      case op.to_s.downcase
      when 'sqrt'
        raise ArgumentError, 'Square root of a negative number' if a.negative?

        Math.sqrt(a).to_f
      when '+', 'add' then (a + b).to_f
      when '-', 'sub' then (a - b).to_f
      when '*', 'mul' then (a * b).to_f
      when '/', 'div'
        raise ZeroDivisionError if b.zero? || b == 0.0

        (a.to_f / b).to_f
      when '^', 'pow' then (a**b).to_f
      when '%', 'mod'
        raise ZeroDivisionError if b.zero? || b == 0.0

        (a % b).to_f
      else
        raise ArgumentError, 'Invalid expression'
      end
    end
  end
end
