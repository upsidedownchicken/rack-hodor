module Rack
  module Hodor
    class Middleware
      def initialize(app)
        @app = app
      end

      def call(env)
        req = Rack::Request.new(env)

        if req.path == '/hodor'
          [200, {'Content-Type' => 'application/json'}, ['{"hodor": "hodor"}']]
        else
          app.call(env)
        end
      end

      private

      attr_reader :app
    end
  end
end
