# encoding: UTF-8
require "eslintrb"

def gen_file source, option, value
  "/*eslint " + option.to_s + ": " + value.to_s + "*/\n" + source
end

describe "Eslintrb" do

  it "support options" do
    options = {
      'no-bitwise' => "var a = 1|1;",
      'curly' => "while (true)\n  var a = 'a';",
      'no-unused-vars' => "if (a == 'a') { var b = 'b'; }"
    }

    options.each do |option, source|
      expect(Eslintrb.lint(source, rules: { option => 0 } ).length).to eq 0
      expect(Eslintrb.lint(source, rules: { option => 2 } ).length).to eq 1
    end

    options.each do |option, source|
      expect(Eslintrb.lint(gen_file(source, option, 0)).length).to eq 0
      expect(Eslintrb.lint(gen_file(source, option, 1)).length).to eq 1
    end
  end

  it "supports globals" do
    source = "foo();"
    expect(Eslintrb.lint(source, :defaults, [:foo]).length).to eq 0
    expect(Eslintrb.lint(source, :defaults).length).to eq 1
  end

  it "supports .eslintrc" do
    basedir = File.join(File.dirname(__FILE__), "fixtures")
    source = "var hoge;"
    Dir.chdir basedir do
      expect(Eslintrb.lint(source, :jshintrc).length).to eq 1
    end
  end

  it "supports globals from .eslintrc" do
    basedir = File.join(File.dirname(__FILE__), "fixtures")
    source = "foo();"
    Dir.chdir basedir do
      expect(Eslintrb.lint(source, :jshintrc).length).to eq 0
    end
  end

  describe "Eslintrb#report" do
    it "accepts a single argument" do
      expect{ Eslintrb.report('var working = false;') }.to_not raise_error
    end
  end

end
