class ScansController < ApplicationController
  before_action :authenticate_user!

  def submit
    @database_input = params[:database_input]
  end

  def scan
    database = File.open('../employees-api/db/seeds.json')
    wordlist = File.open('app/views/scans/wordlist.txt')

    contents = database.read
    json = JSON.parse(contents)

    weakpass = wordlist.readlines
    #p datapass
    #p weakpass

    @matches = []

    json.each do |p|
      puts p["password"].to_s
      weakpass.each do |pass|
        # puts pass
        # puts @matches
        if (pass == p["password"].to_s)
          puts "Theres a match!"
          puts p
          @matches << p
        else 
          @matches << "no match"
        end
      end
    end


  end

  # def scan2
  #   array = []
  #   f = File.open("../employees-api/db/seeds1.rb", "r")
  #   f.each_line do |line|
  #     array << line.eval
  #   end
  #   f.close
  # end

  # f = File.readlines("../employees-api/db/seeds1.rb").map{ |l| l.chomp }.reject{ |l| l == '' }

  # def read
  #       a=[]
  #       i=0
  #           File.open('../employees-api/db/seeds1.rb', 'r') do |f1|  
  #               while line = f1.gets  
  #                   line.chomp  
  #                   ppp= line.split(/\n/)
  #                   a[i] =ppp[0]
  #                   i=i+1
  #               end  
  #                puts "#{a}"
  #           end 
  #       end

# datapass to array?? file=datapass.split(/\n/) turns into giant array (file.class)
  def index

  end



end
