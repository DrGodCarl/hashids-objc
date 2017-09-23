
Pod::Spec.new do |s|
  s.name          = "hashids-objc"
  s.version       = "1.0.2"
  s.summary       = "An Objective-C port of the Hashids project."
  s.description   = <<-DESC
                    Hashids is a small open-source library that generates short,
                    unique, non-sequential ids from numbers. For more
                    information, check out http://hashids.org/
                   DESC
  s.homepage      = "https://github.com/DrGodCarl/hashids-objc"
  s.license       = "MIT"
  s.author        = { "Carl D. Benson" => "carl.d.benson@gmail.com" }
  s.source        = {
    :git => "https://github.com/DrGodCarl/hashids-objc.git",
    :tag => "master",
    :submodules => true
  }
  s.source_files  = "Hashids", "Hashids/**/*.{h,m,c}"
  s.exclude_files = "Hashids/hashids.c/main.c", "Hashids/hashids.c/test.c"
end
