# frozen_string_literal: true

require_relative "advent_of_code/version"

module AdventOfCode
  file_path = "lib/input_files/d4.txt"

  @file = []
  @cards = []
  @total = 0

  def self.checker(start_index, end_index)
    @cards[start_index..end_index].each_with_index do |card, index|
      winning = card[0]
      hand = card[1]

      @total += 1

      matches = hand & winning
      count = matches.length

      checker(start_index + index + 1, start_index + index + count) if count.positive?
    end
  end

  File.open(file_path, "r") do |file|
    file.each_line do |line|
      @file.push line.split(":")[1].split("|")
    end
  end
  @file.each do |row|
    winning = row[0].split(" ")
    hand = row[1].split(" ")
    @cards.push [winning, hand]
  end
  checker(0, @cards.length - 1)

  puts @total
end