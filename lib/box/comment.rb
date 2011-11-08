module Box
  class Comment
    def self.create(api, comments)
      if comments
        comments = [ comments ] if comments.class == Hash

        comments.collect do |comment|
          sub_comments = comment.delete('reply_comments')

          comment['id'] = comment.delete('comment_id')
          comment['comments'] = self.create(api, sub_comments['item']) if sub_comments

          Comment.new(api, comment)
        end
      else
        Array.new
      end
    end

    # Create a new comment object for a file.
    #
    # @param [Api] api The {Api} instance used to generate requests.
    # @param [Hash] data The hash of initial info for this item, like 'id' and 'message'.
    def initialize(api, data)
      @api = api
      @data = data
    end

    def id; @data['id']; end

    def method_missing(sym, *args, &block)
      # TODO: Use symbols instead of strings for keys.
      sym = sym.to_s

      return @data[sym] if @data.key?(sym)

      super
    end

    def delete
      @api.delete_comment(id)

      true
    end
  end
end
