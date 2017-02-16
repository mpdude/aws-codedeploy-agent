require 'aws-sdk-core'

module Aws
  module Plugins
    class DeployControlEndpoint < Seahorse::Client::Plugin
      option(:endpoint) do |cfg|
        url = ENV['AWS_DEPLOY_CONTROL_ENDPOINT']
        if url.nil?
          url = "https://codedeploy-commands.#{cfg.region}.amazonaws.com"
          if "cn" == cfg.region.split("-")[0]
            url.concat(".cn")
          end
        end
        url
      end
    end
  end
end
