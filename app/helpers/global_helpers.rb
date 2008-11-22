module Merb
  module GlobalHelpers
    def all_messages
      message.collect {|type, text| tag(:p, text, :class => "message #{type}") }.join
    end
    
    def photo_tag(email)
      info = [
        Digest::MD5.hexdigest(email), # => hash
        36, # => size
        'http%3A%2F%2Ff.simplesideias.com.br%2Fgravatar.gif' # => default gravatar
      ]
      
      src = "http://www.gravatar.com/avatar/%s?s=%s&amp;r=g&amp;d=%s" % info
      
      '<img src="%s" alt="" class="photo" />' % src
    end
  end
end
