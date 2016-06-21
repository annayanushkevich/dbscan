require "csv"
require 'benchmark/ips'

class DatabasesController < ApplicationController
  # def index
  # end

  def submit  
    # clear users
    purge = Datum.all
    purge.each do |data|
      data.delete
    end

    wordlist = File.open('app/views/scans/wordlist.txt', 'rb').read
    weak_passwords = wordlist.split("\n")

    csv_file = params[:file]
    CSV.foreach(csv_file.path, headers: true) do |row|
      p row["email"]
      p row["encrypted_password"]
    # email, encrypted_password = row
    # User.create(email: email, encrypted_password: encrypted_password)

    user = Datum.create(email: row["email"], password: row["encrypted_password"])
    end
    @matches = []
    @easy_words_key = {}
    @users = Datum.all
    @users.each do |user|
      bcrypt_instance = BCrypt::Password.new(user.password)
      weak_passwords.each do |easy_password|
        if bcrypt_instance == easy_password
          @matches << user

           @easy_words_key["user.id"] = []
           @easy_words_key["user.id"] << easy_password
        end
      end
      p "..scanning...."
    end

    p @matches
    render "/scan"
  end


 end
