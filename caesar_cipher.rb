require 'sinatra'
require 'sinatra/reloader'
cipher=""
string=nil
number=nil

get '/' do
  string = params["input"]
  number = params["dropdown"].to_i
  if string !=nil && number !=nil
    cipher=caesar_cipher(string, number)
  else
    cipher = "Error"
  end
  erb :index, :locals => {
    cipher: cipher,
    string: string,
    number: number
  }
end

def caesar_cipher(string, number)
  chars = string.split('')
  chars.each.with_index do |c, i|
    if (c != " ") && (c!= ".") && (c != "!") && (c != "?")
  
      converted_number=c.ord+number
  
     if converted_number.chr > "z"
        converted_number-=26
      elsif (converted_number.chr>"Z") &&  (converted_number.chr<"a")
        converted_number-=26
      end
      string[i]=converted_number.chr
    end
  
  end
  
  puts string
  end