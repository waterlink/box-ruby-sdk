# -*- encoding: utf-8 -*-
# stub: box-api 0.2.2 ruby lib spec

Gem::Specification.new do |s|
  s.name = "box-api"
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib", "spec"]
  s.authors = ["Box.net", "Luke Curley"]
  s.date = "2014-01-20"
  s.description = "Box-api is a collection of classes that implement functions defined in the Box public API. See http://developer.box.net for more information."
  s.email = ["luke@box.net"]
  s.files = [".gitignore", "Gemfile", "Gemfile.lock", "LICENSE.txt", "README.md", "Rakefile", "box-api.gemspec", "doc/Box.html", "doc/Box/Account.html", "doc/Box/Api.html", "doc/Box/Api/AccountExceeded.html", "doc/Box/Api/EmailInvalid.html", "doc/Box/Api/EmailTaken.html", "doc/Box/Api/ErrorStatus.html", "doc/Box/Api/Exception.html", "doc/Box/Api/Generic.html", "doc/Box/Api/InvalidFolder.html", "doc/Box/Api/InvalidInput.html", "doc/Box/Api/InvalidName.html", "doc/Box/Api/NameTaken.html", "doc/Box/Api/NoAccess.html", "doc/Box/Api/NoParent.html", "doc/Box/Api/NotAuthorized.html", "doc/Box/Api/NotShared.html", "doc/Box/Api/Restricted.html", "doc/Box/Api/SizeExceeded.html", "doc/Box/Api/Unknown.html", "doc/Box/Api/UnknownResponse.html", "doc/Box/Api/UploadFailed.html", "doc/Box/Comment.html", "doc/Box/File.html", "doc/Box/Folder.html", "doc/Box/Item.html", "doc/_index.html", "doc/class_list.html", "doc/css/common.css", "doc/css/full_list.css", "doc/css/style.css", "doc/file.README.html", "doc/file_list.html", "doc/frames.html", "doc/index.html", "doc/js/app.js", "doc/js/full_list.js", "doc/js/jquery.js", "doc/method_list.html", "doc/top-level-namespace.html", "examples/app_data.yml", "examples/files.rb", "examples/login.rb", "lib/box-api.rb", "lib/box/account.rb", "lib/box/api.rb", "lib/box/api/exceptions.rb", "lib/box/comment.rb", "lib/box/file.rb", "lib/box/folder.rb", "lib/box/item.rb", "spec/account_spec.rb", "spec/api_spec.rb", "spec/file_spec.rb", "spec/folder_spec.rb", "spec/helper/account.rb", "spec/helper/account.yml", "spec/helper/fake_tree.rb", "spec/item_spec.rb"]
  s.homepage = "http://box.net"
  s.rubygems_version = "2.2.1"
  s.summary = "A ruby library that helps navigate the Box API"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httmultiparty>, ["~> 0.3.6"])
      s.add_development_dependency(%q<launchy>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<httmultiparty>, ["~> 0.3.6"])
      s.add_dependency(%q<launchy>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<httmultiparty>, ["~> 0.3.6"])
    s.add_dependency(%q<launchy>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
