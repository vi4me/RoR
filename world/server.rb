require './init'

server = WEBrick::HTTPServer.new :Port => 8000

server.mount_proc '/' do |req, res|
  res.body = 'Hello, world!'
end

server.mount_proc '/countries' do |req, res|
  result = ''

  countries = Country.load!

  res.body = countries.to_json
end

server.mount_proc '/regions' do |req, res|
  result = ''
  req.params
  countries = Country.load!

  res.body = countries.to_json
end

server.start
