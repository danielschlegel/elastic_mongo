# ===============================
# Require the Curb implementation
#
#require 'curb'
#require 'tire/http/clients/curb'
# ===============================


Tire.configure {
  url "http://elastic3.silp.com:9200"
  #client Tire::HTTP::Client::Curb
}

