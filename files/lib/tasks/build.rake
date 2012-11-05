namespace :front do
  desc "Build static application"
  task :build do
    sh 'rake front:build:clear'
    sh 'rake front:build:server:start'
    # run "wget -r -k -nH -P build http://localhost:8989; zip -r build.zip build/; rm -R build"
    sh "wget -r -k -nH -P build http://localhost:8989"
    sh 'rake front:build:server:stop'
  end

  namespace :build do
    desc "Clear build dir"
    task :clear do
      sh "rm -fR build"
    end

    namespace :server do
      desc "Start build server at 8989 port"
      task :start do
        # TODO: use custom pid
        sh "rails s -e build -p 8989 -d"
      end

      desc "Stop build server"
      task :stop do
        pid = File.read(build_server_pid_file).to_i
        Process.kill 9, pid
        File.delete build_server_pid_file
      end
    end
  end

  def build_server_pid_file
    'tmp/pids/server.pid'
  end

end
