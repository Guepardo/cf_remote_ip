module ActionPack
  module Cloudflare
    module Request

      def remote_ip
        find_remote_ip || super
      end

      private

      def find_remote_ip
        @env['HTTP_CF_CONNECTING_IP'] ||
        @env['HTTP_TRUE-CLIENT-IP'] ||
        find_from_forwarded_for
      end

      def find_from_forwarded_for
        (@env['HTTP_X_FORWARDED_FOR'] || '')
          .split(',').first
      end
    end
  end
end

ActionDispatch::Request.class_eval do
  prepend ActionPack::Cloudflare::Request
end