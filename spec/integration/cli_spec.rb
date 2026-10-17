require 'spec_helper'

RSpec.describe Calculator::CLI do
  let(:out) { StringIO.new }
  let(:err) { StringIO.new }

  it 'evaluates CLI arguments and prints result' do
    cli = described_class.new(stdout: out, stderr: err)
    expect(cli.run(['12', '*', '3'])).to eq(0)
    expect(out.string).to eq("36.0\n")
  end

  it 'handles division by zero in CLI mode' do
    cli = described_class.new(stdout: out, stderr: err)
    expect(cli.run(['10', '/', '0'])).to eq(1)
    expect(err.string).to include('Error: Division by zero')
  end

  it 'handles REPL interactive mode' do
    input = StringIO.new("2 + 3\n16 sqrt\nexit\n")
    cli = described_class.new(stdin: input, stdout: out, stderr: err)
    expect(cli.run([])).to eq(0)
    expect(out.string).to include("calc> 5.0\ncalc> 4.0\ncalc> ")
  end
end
