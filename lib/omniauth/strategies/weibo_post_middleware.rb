module OmniAuth
  module Strategies
    class WeiboPostMiddleware
      def initialize(app)
        @app = app
      end

      def call(env)
        # 检查是否是认证请求
        if env['PATH_INFO'] =~ /\/auth\/weibo(\/callback)?/
          # 如果是 GET 请求，将其转换为 POST 请求
          if env['REQUEST_METHOD'] == 'GET'
            env['REQUEST_METHOD'] = 'POST'
          end
        end

        @app.call(env)
      end
    end
  end
end
