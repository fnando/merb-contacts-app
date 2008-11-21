module Merb
  module GlobalHelpers
    def all_messages
      message.collect {|type, text| tag(:p, text, :class => "message #{type}") }.join
    end
    
    def current_user
      session.authentication.user
    end
  end
end
