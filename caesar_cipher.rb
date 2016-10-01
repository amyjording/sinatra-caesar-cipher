require 'sinatra'
require 'sinatra/reloader' if development?


get "/" do
  message = caesar_cipher(params["text"],params["shift"])
  # caesar_cipher(params["text"], params["shift"]).join

  erb :index, :locals => {:message => message}

end

def caesar_cipher(text, shift)
  if text.nil? && shift.nil?
    return "Waiting for the text that you would like scrambled."
  else
    az = Array('a'..'z')
    lcase = Hash[az.zip(az.rotate(shift.to_i))]

    aZ = Array('A'..'Z')
    ucase = Hash[aZ.zip(aZ.rotate(shift.to_i))]

    cipher = lcase.merge(ucase)

    secret = text.chars.map { |l| cipher.fetch(l, l) }
    return "Here is your caesar ciphered text: " + secret.join
  end
end
