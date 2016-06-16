class Database < ActiveRecord::Base
  require 'csv'
  belongs_to :user

  # def self.import(file)

  #   # if file.class == String
  #   #   file = file.split(',')
  #   # end
  #   CSV.foreach(file.path, headers: true) do |row|
  #    Database.create! row.to_hash
  #   end
  # end
end
