require "faye/websocket"

class PubSub
  KEEPALIVE_TIME = 15 # in seconds

  def initialize(app)
    @app     = app
    @clients = []
    @messages = []
  end

  def call(env)
    if Faye::WebSocket.websocket?(env)
      handle(env)
    else
      @app.call(env)
    end
  end

  private

  def handle(env)
    ws = Faye::WebSocket.new(env, nil, ping: KEEPALIVE_TIME)

    ws.on :open do
      @clients << ws
      @messages.each do |message|
        ws.send(message)
      end
    end

    ws.on :close do
      @clients.delete(ws)
    end

    ws.on :message do |event|
      @messages << event.data

      @clients.each do |client|
        client.send(event.data)
      end
    end

    ws.rack_response
  end
end
