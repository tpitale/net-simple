$:.unshift File.dirname(__FILE__)

require 'net/ssh'
require 'net/scp'

module Net
  class Simple
    def initialize(host, username, password="", verbose = :fatal)
      @host = host
      @username = username
      @ssh_options = {:password => password, :verbose => verbose}
    end

    def connect(&block)
      @connection ||= Net::SSH.start(@host, @username, @ssh_options)
      block_given? ? (instance_eval(&block) and close) : @connection
    end

    def with_connection(&block)
      connect
      yield self if block_given?
      close
    end

    def run(command)
      @connection.exec!(command)
    end

    def close
      @connection.close
    end

    # def sudo(command)
    #   @connection.exec!("sudo #{command}")
    # end

    def download(remote, local)
      Net::SCP.download!(@host, @username, remote, local, :ssh => @ssh_options)
    end

    def upload(local, remote)
      Net::SCP.upload!(@host, @username, local, remote, :ssh => @ssh_options)
    end
  end
end
