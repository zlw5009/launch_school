require 'pry'

class WordProblem
  STRING_OPERATORS = %w(plus minus multiplied divided)

  attr_accessor :problem

  def initialize(string)
    @problem = word_problem(string)
    raise ArgumentError if operators.empty?
  end

  def word_problem(string)
    string.gsub!(/[^\w-]/, ' ')
    string.split.select do |word|
      word =~ /\d/ || STRING_OPERATORS.include?(word) 
    end
  end

  def integers
    problem.select { |int| int.to_i.to_s == int }.map {|int| int.to_i }
  end

  def operators
    operations = problem.select { |ops| STRING_OPERATORS.include?(ops) }

    operations.map do |ops|
      case ops
      when "plus" then :+
      when "minus" then :-
      when "multiplied" then :*
      when "divided" then :/
      end
    end
  end

  def answer
    ops = operators

    integers.reduce do |acc, number|
      acc.send(ops.shift, number)
    end
  end
end

p WordProblem.new('What is 1 plus 5 minus -2?').answer