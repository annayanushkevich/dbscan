class Api::V1::PasswordsController < ApplicationController

  def dictionary_test
    puts '$' * 500
    password_test = params[:password]
    wordlist = File.open('app/views/scans/wordlist.txt', 'rb').read
    weakpass = wordlist.split("\n")


    message = nil
    weakpass.each do |pass|
      if pass == password_test
        message = "your password was: #{password_test}. it matched one of the 500 most vunerable passwords. please visit password tips to make it stronger."
      #   break
      # else pass.include?(password_test)
      #   message = "your password has a word in it that is easy to guess: #{password_test} "
      #   # break
      end
    end      
    unless message
      message = "your password did not match the 500 most hacked passwords!"
    end  
    render json: {message: message}
  end
end
