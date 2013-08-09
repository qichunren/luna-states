require "socket"

sender = UDPSocket.new
host = ARGV[0]
port = ARGV[1] || 8088

puts "Connect to #{host}:#{port}"

n = 0
loop do
  sender.send("message #{n}", 0, host, port)
  n = n + 1
  sleep 1.1
end