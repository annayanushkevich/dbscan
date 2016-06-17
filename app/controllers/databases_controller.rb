require "csv"
require 'benchmark'

class DatabasesController < ApplicationController
  # def index
  # end

  def submit  
    # clear users
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
    @users = Datum.all
    @users.each do |user|
      bcrypt_instance = BCrypt::Password.new(user.password)
      weak_passwords.each do |easy_password|
        if bcrypt_instance == easy_password
          @matches << user
        end
      end
      p "."
    end

    p @matches
    render "/scan"
  end


 end
