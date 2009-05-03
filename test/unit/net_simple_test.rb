require File.join(File.dirname(__FILE__), "..", "test_helper")

class SimpleTest < Test::Unit::TestCase
  context "The Net/Simple class" do
    setup do
      @simple = Net::Simple.new('host', 'username', 'password')
      @options = {:password => 'password', :verbose => :fatal}
    end

    should "make a connection" do
      Net::SSH.expects(:start).with('host', 'username', @options).returns('connection')
      assert_equal 'connection', @simple.connect
    end

    should "make a connection and eval a block" do
      Net::SSH.expects(:start).with('host', 'username', @options).returns('connection')
      @simple.expects(:run).with('hello').returns(true)
      @simple.expects(:close)

      @simple.connect do
        run('hello')
      end
    end

    should "run with a connection" do
      @simple.expects(:connect)
      @simple.expects(:close)
      @simple.expects(:run).with('hello')
      @simple.with_connection do |conn|
        conn.run('hello')
      end
    end

    should "run commands given to it" do
      connection = mock
      connection.expects(:exec!).with('hello').returns('hi to you')
      Net::SSH.expects(:start).with('host', 'username', @options).returns(connection)
      @simple.connect
      assert_equal 'hi to you', @simple.run('hello')
    end

    should "download a file from a remote host" do
      Net::SCP.expects(:download!).with('host', 'username', 'here', 'there', :ssh => @options).returns('download')
      assert_equal 'download', @simple.download('here','there')
    end

    should "upload a file from a remote host" do
      Net::SCP.expects(:upload!).with('host', 'username', 'here', 'there', :ssh => @options).returns('upload')
      assert_equal 'upload', @simple.upload('here','there')
    end

    should "close an open connection" do
      connection = mock
      connection.expects(:close)
      Net::SSH.expects(:start).with('host', 'username', @options).returns(connection)
      @simple.connect
      @simple.close
    end
  end
end
