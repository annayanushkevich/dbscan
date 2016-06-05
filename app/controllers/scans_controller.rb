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
    end
  end

  def tricky_scan

    database = File.open('../employees-api/db/seeds.json')
    wordlist = File.open('app/views/scans/wordlist.txt', 'rb').read

    contents = database.read
    accounts = JSON.parse(contents)

    weakpass = wordlist.split("\n")

    userinfo= {}
    cryptoinfo = {}

    accounts.each do |account|
      email = account["email"]
      password = account["password"]
      userinfo[email] = password
    end
    p userinfo

    userinfo.each do |email, password|
      encryptedpassword= BCrypt::Password.create(password)
      cryptoinfo[email]= BCrypt::Password.new(encryptedpassword)
    end
    p cryptoinfo


    def password_match(value)
      # cryptoinfo.each do |account|
      # weakpass.each do |pass|
      #   puts "gooneys"
      #   p pass

      #   # if (pass == account.values)
      #     puts "Theres a match!"
      #     puts cryptoinfo(value)
          @matches << value
        # else 
        #    @matches << "no match"
        
        end
    


    @matches = []
    cryptoinfo.each { |key,value| password_match(value) if value == weakpass }
  end
 end