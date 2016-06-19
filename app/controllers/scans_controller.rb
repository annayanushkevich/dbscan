class ScansController < ApplicationController
  before_action :authenticate_user!
  require 'csv'
  require 'benchmark'

  def submit
    @database_input = params[:database_input]
  end



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

        if (pass == account["password"].to_s)
          puts "Theres a match!"
          puts account
          @matches << account
        # else 
        #    @matches << "no match"
      end
    end
  end
end


def scan_psql

  csv_database = [:file]
  wordlist = File.open('app/views/scans/wordlist.txt', 'rb').read
  weak_passwords = wordlist.split("\n")

  matches = []
  @users = User.all
  @users.each do |user|
    bcrypt_instance = BCrypt::Password.new(user.encrypted_password)
    weak_passwords.each do |easy_password|
      if bcrypt_instance == easy_password
        matches << user
      end
    end

  end
end

# def import
#   Database.import(params[:file])
#   redirect_to databases_path, notice: "database imported"
# end

# def cryptoscan

#   database = File.open('../employees-api/db/seeds.json')
#   wordlist = File.open('app/views/scans/wordlist.txt', 'rb').read

#   contents = database.read
#   accounts = JSON.parse(contents)

#   weak_words = wordlist.split("\n")

#   userinfo= {}
#   cryptoinfo = {}

#   accounts.each do |account|
#     email = account["email"]
#     password = account["password"]
#     userinfo[email] = password
#   end
#     # p userinfo

#     userinfo.each do |email, password|
#       encryptedpassword = BCrypt::Password.create(password)
#       cryptoinfo[email] = BCrypt::Password.new(encryptedpassword)
#     end
#     # p cryptoinfo


#     @matches = []
#       # def password_match(value)
#       #   @matches << value
#       #   p @matches
#       # end
#       cryptoinfo.each do |key,value|
#         weak_words.each do |weak_word|
#           if weak_word == value
#             @matches << key
#             p @matches
#           end
#         end
#       end
#     end
#   end