require 'etc'
cur_user_home_dir = Etc.getpwuid.dir
@app_path = "#{cur_user_home_dir}/video-freaks"

worker_processes 2
working_directory "#{@app_path}/"
preload_app true
timeout 30
listen "/tmp/unicorn.sock", :backlog => 64
pid "/tmp/unicorn.pid"
stderr_path "#{@app_path}/log/unicorn.stderr.log"
stdout_path "#{@app_path}/log/unicorn.stdout.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"

  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
  sleep 1
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end