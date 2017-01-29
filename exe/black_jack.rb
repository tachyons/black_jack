#!/usr/bin/env ruby
#
require 'bundler/setup'
require 'black_jack'

require 'optparse'

options = {}
OptionParser.new do |opt|
    opt.on('--number_of_decks NUMBER_OF_DECKS') { |o| options[:number_of_decks] = o }
end.parse!
puts options

game = BlackJack::Game.new(options[:number_of_decks].to_i)
game.begin

