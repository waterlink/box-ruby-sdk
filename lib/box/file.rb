require 'box/item'

module Box
  # Represents a file stored on Box. Any attributes or actions typical to
  # a Box file can be accessed through this class.

  class File < Item
    # (see Item.type)
    def self.type; 'file'; end

    # Download this file to the specified path.
    #
    # @param [String] path The path to write the file.
    def download(path=nil)
      return @api.query_download([id, nil]) if path == nil
      @api.download(path, id)
    end

    # Overwrite this file, using the file at the specified path
    #
    # @param [String] path The path to the file to upload.
    # @return [File] self
    def upload_overwrite(path)
      info = @api.overwrite(path, id)['files']['file']

      clear_info
      update_info(info)

      self
    end

    # Upload a new copy of this file. The name will be "file (#).ext"
    # for the each additional copy.
    #
    # @param path (see #upload_overwrite)
    # @return [File] The newly created file.
    def upload_copy(path)
      info = @api.new_copy(path, id)['files']['file']
      parent.delete_info('files')

      self.class.new(api, parent, info)
    end

    # Get the comments left on this file.
    #
    # @return [Array] An array of {Comment}s.
    def get_comments
      comments = @api.get_comments(type, id)['comments']

      comments = Comment.create(@api, comments['comment']) if comments

      @data['comments'] = comments || Array.new
    end

    # Add a comment to the file.
    #
    # @return [Comment] The created comment.
    def add_comment(message)
      response = @api.add_comment(type, id, message)

      Comment.create(@api, response['comment']).first
    end

    # Request the HTML embed code for this file.
    #
    # @param [Optional, Hash{:allow_download,:allow_print,:allow_share,
    #        :width,:height,:color => String}] options Options to use
    #        when generating the embed code.
    # @return [String] HTML code to use to embed the file.
    #
    # @note This function will share the file if it is not already shared.
    def embed_code(options = Hash.new)
      begin
        @api.file_embed(id, options)['file_embed_html']
      rescue Api::NotShared
        share_public
        retry
      end
    end

    protected

    # (see Item#get_info)
    def get_info
      @api.get_file_info(id)['info']
    end
  end
end
