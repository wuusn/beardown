require "rouge"
module Beardown
  class Document
    REGEXP_CODEBLOCK = /^```(.*)\n((.*\n)*?)^```\n?/

    def scan_codeblock(s)
      code = $code_map[s[1].strip.downcase]
      content = s[2]
      convert_codeblock(content, code)
    end

    def convert_codeblock(content, code)
      lexer_class = case code
                    when nil
                      Rouge::Lexer.guess_by_source content
                      #Rouge::Lexers::PlainText
                    else
                      Rouge::Lexers.const_get code
                    end
      lexer = lexer_class.new
      formatter = Rouge::Formatters::HTML.new
      %(<pre><code class="code-multiline highlight">#{formatter.format(lexer.lex(content))}</code></pre>\n)
    end

    $code_map = {
      # bear supported
      "apache"=>"Apache",
      "c"=>"C", "c++"=>"Cpp", "cpp"=>"Cpp",
      "c#"=>"CSharp", "csharp"=>"CSharp",
      "coffee"=>"Coffeescript", "coffeescript"=>"Coffeescript",
      "css"=>"CSS", "html"=>"HTML", "php"=>"PHP",
      "go"=>"Go", "golang"=>"Go",
      "java"=>"Java", "js"=>"Javascript", "javascript"=>"Javascript",
      "json"=>"JSON",
      "lua"=>"Lua",
      "mat"=>"Matlab", "matlab"=>"Matlab",
      "objective-c"=>"ObjectiveC", "objc"=>"ObjectiveC",
      "perl"=>"Perl",
      "py"=>"Python", "python"=>"Python",
      "r"=>"R", "rb"=>"Ruby", "ruby"=>"Ruby",
      "sc"=>"Scala", "scala"=>"Scala",
      "scss"=>"Scss", "sass"=>"Sass",
      "shell"=>"Shell", "sh"=>"Shell",
      "sql"=>"SQL", "swift"=>"Swift",
      "latex"=>"TeX", "tex"=>"TeX",
      "xml"=>"XML",

      # rouge supported but bear not
      "abap"=>"ABAP", "fsharp"=>"FSharp", "sasscommon"=>"SassCommon",
      "actionscript"=>"Actionscript", "gherkin"=>"Gherkin", "make"=>"Make",
      "glsl"=>"Glsl", "markdown"=>"Markdown", "md"=>"Markdown",
      "scheme"=>"Scheme", "apiblueprint"=>"APIBlueprint",
      "applescript"=>"AppleScript", "gradle"=>"Gradle",
      "moonscript"=>"Moonscript", "sed"=>"Sed", "awk"=>"Awk",
      "graphql"=>"GraphQL", "mosel"=>"Mosel", "biml"=>"BIML",
      "groovy"=>"Groovy", "mxml"=>"MXML", "sieve"=>"Sieve",
      "bsl"=>"Bsl", "hack"=>"Hack", "nasm"=>"Nasm", "slim"=>"Slim",
      "haml"=>"Haml", "nginx"=>"Nginx", "smalltalk"=>"Smalltalk",
      "ceylon"=>"Ceylon", "handlebars"=>"Handlebars", "nim"=>"Nim",
      "smarty"=>"Smarty", "cfscript"=>"Cfscript", "haskell"=>"Haskell",
      "nix"=>"Nix", "sml"=>"SML", "clojure"=>"Clojure", "cmake"=>"CMake",
      "http"=>"HTTP", "ocaml"=>"OCaml", "hylang"=>"HyLang",
      "pascal"=>"Pascal", "tap"=>"Tap", "commonlisp"=>"CommonLisp", "idlang"=>"IDLang",
      "tcl"=>"TCL", "conf"=>"Conf", "igorpro"=>"IgorPro",
      "consolelexer"=>"ConsoleLexer", "ini"=>"INI", "plaintext"=>"PlainText",
      "toml"=>"TOML", "coq"=>"Coq", "io"=>"IO", "plist"=>"Plist",
      "tsx"=>"TSX", "irblexer"=>"IRBLexer", "pony"=>"Pony", "tulip"=>"Tulip",
      "irboutputlexer"=>"IRBOutputLexer", "powershell"=>"Powershell", "turtle"=>"Turtle",
      "praat"=>"Praat", "twig"=>"Twig", "d"=>"D","prolog"=>"Prolog",
      "typescript"=>"Typescript", "dart"=>"Dart", "jinja"=>"Jinja",
      "prometheus"=>"Prometheus", "typescriptcommon"=>"TypescriptCommon", "diff"=>"Diff",
      "properties"=>"Properties", "vala"=>"Vala", "digdag"=>"Digdag", "jsondoc"=>"JSONDOC",
      "protobuf"=>"Protobuf", "verilog"=>"Verilog", "docker"=>"Docker", "jsonnet"=>"Jsonnet",
      "puppet"=>"Puppet", "vhdl"=>"VHDL", "dot"=>"Dot", "jsx"=>"JSX",
      "viml"=>"VimL", "eiffel"=>"Eiffel", "julia"=>"Julia", "q"=>"Q",
      "visualbasic"=>"VisualBasic", "elixir"=>"Elixir", "kotlin"=>"Kotlin",
      "qml"=>"Qml", "vue"=>"Vue", "elm"=>"Elm", "lasso"=>"Lasso",
      "wollok"=>"Wollok", "erb"=>"ERB", "liquid"=>"Liquid", "racket"=>"Racket",
      "erlang"=>"Erlang", "literatecoffeescript"=>"LiterateCoffeescript",
      "yaml"=>"YAML", "factor"=>"Factor", "literatehaskell"=>"LiterateHaskell",
      "rust"=>"Rust", "fortran"=>"Fortran", "llvm"=>"LLVM"
    }
  end
end
