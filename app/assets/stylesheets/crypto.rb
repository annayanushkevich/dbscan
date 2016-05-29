 database = File.open('../employees-api/db/seeds.json')
    wordlist = File.open('app/views/scans/wordlist.txt', 'rb').read

    contents = database.read
    accounts = JSON.parse(contents)

    weakpass = wordlist.split("\n")

userinfo= {}
cryptoinfo= {}

accounts.each do |account|
  email = account["email"]
  password = account["password"]
  userinfo[email] = password
  end
  p userinfo

  userinfo.each do |email, password|
    encryptedpassword= BCrypt::Password.create(password)
    cryptoinfo[email]=BCrypt::Password.new(encryptedpassword)
  end
  p cryptoinfo



    @matches = []
    cryptoinfo.each do |account|
      p account["password"]
     
      weakpass.each do |pass|
        if (pass == account["password"].to_s)
          puts "Theres a match!"
          puts account
          @matches << account
        else 
           @matches << "no match"
        end
      end

