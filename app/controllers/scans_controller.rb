class ScansController < ApplicationController
  before_action :authenticate_user!

  def submit
    @database_input = params[:database_input]
  end

  def scan
    database = File.open('../employees-api/db/seeds.json')
    wordlist = File.open('app/views/scans/wordlist.txt', 'rb').read

    contents = database.read
    accounts = JSON.parse(contents)

    weakpass = wordlist.split("\n")



    @matches = []
    accounts.each do |account|
      p account["password"]
     
      weakpass.each do |pass|
        # puts pass
        # puts @matches
        if (pass == account["password"].to_s)
          puts "Theres a match!"
          puts account
          @matches << account
        else 
          # @matches << "no match"
        end
      end
    


    def encrypt
      require 'bcrypt'

    database = File.open('../employees-api/db/seeds.json')
    wordlist = File.open('app/views/scans/wordlist.txt', 'rb').read

    contents = database.read
    accounts = JSON.parse(contents)

    weakpass = wordlist.split("\n")



