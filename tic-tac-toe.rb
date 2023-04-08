#!/usr/bin/env ruby 

# Tic Tac Toe game
class TicTacToe
    def initialize() 
        @rock = 1
        @paper = 2
        @scissors = 3

        @names = { @rock => "Rock" , @paper => "Paper", @scissors => "Scissors" }
        @rules = { @rock => @scissors, @paper => @rock, @scissors => @paper }

        # puts @rules.inspect

        @player_score = 0
        @computer_score = 0
    end

    def play
        puts "Let's play a game of Rock Paper Scissors!"
        while game
            next
        end
        scores
    end

    def game
        player = move
        computer = rand(1..3)
        result(player, computer)
        return play_again?
    end

    def move
        while true
            print "Rock = 1, Paper = 2, Scissors = 3: "
            player = gets.chomp.to_i
            return player if [1,2,3].include?(player)
            puts "Invalid choice. Please enter 1, 2, or 3."
        end
    end

    def result(player, computer)
        puts "You chose #{@names[player]} and the computer chose #{@names[computer]}."
        if player == computer
            puts "It's a tie!"
        else
            if @rules[player] == computer
                puts "You won!"
                @player_score += 1
            else
                puts "You lost!"
                @computer_score += 1
            end
        end
    end

    def play_again?
        while true
            print "Would you like to play again? (y/n): "
            choice = gets.chomp.downcase
            return true if choice == 'y'
            return false if choice == 'n'
            puts "Invalid choice. Please enter y or n."
        end
    end
    
    def scores
        puts "High Scores"
        puts "Player: #{@player_score}"
        puts "Computer: #{@computer_score}"
    end
end

game = TicTacToe.new
game.play