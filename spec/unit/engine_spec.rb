require 'spec_helper'

RSpec.describe Calculator::Engine do
  subject(:engine) { described_class.new }

  it 'calculates basic arithmetic' do
    expect(engine.calculate('+', 2, 3)).to eq(5.0)
    expect(engine.calculate('-', 5, 2)).to eq(3.0)
    expect(engine.calculate('*', 4, 3)).to eq(12.0)
    expect(engine.calculate('/', 10, 2)).to eq(5.0)
    expect(engine.calculate('^', 2, 3)).to eq(8.0)
    expect(engine.calculate('%', 10, 3)).to eq(1.0)
    expect(engine.calculate('sqrt', 9)).to eq(3.0)
  end

  it 'raises ZeroDivisionError for division and modulo by zero' do
    expect { engine.calculate('/', 5, 0) }.to raise_error(ZeroDivisionError)
    expect { engine.calculate('%', 5, 0.0) }.to raise_error(ZeroDivisionError)
  end

  it 'raises ArgumentError on negative sqrt or unknown op' do
    expect { engine.calculate('sqrt', -4) }.to raise_error(ArgumentError, /Square root/)
    expect { engine.calculate('foo', 1, 2) }.to raise_error(ArgumentError, /Invalid expression/)
  end
end
