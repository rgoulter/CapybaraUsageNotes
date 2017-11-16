$server_pid = Process.spawn('ruby -run -ehttpd . -p8000')

at_exit do
  Process.kill('TERM', $server_pid)
end
