# H2P: HTML in, PDF out

H2P takes an HTML blob, uses wkhtmltopdf to convert it to PDF, and returns a PDF
blob.

## Installation

```bash
gem install 'h2p'

# you'll also need to have wkhtmltopdf installed:
gem install 'wkhtmltopdf-binary'
```

Or just [use the source™️](#use-the-source).

## Usage

```ruby
...
my_html = '<html><body><h1>Hello, world!</h1></body></html>'
my_pdf = H2P.convert(my_html)
...
```

## Use the source

If you don't want to add another dependency to your project, here's the source
of the present gem (with the [modulation](https://github.com/digital-fabric/modulation)
dependency removed.) Feel free to use and manipulate however you please:

```ruby
# This is free and unencumbered software released into the public domain
# Full license here: https://unlicense.org/

require 'tmpdir'
require 'fileutils'

module H2P
  def self.tmp_path(ext)
    stamp = Time.now.to_f
    @counter ||= 0
    File.join(Dir.tmpdir, "h2p-#{stamp}-#{@counter += 1}.#{ext}")
  end

  def self.convert(html)
    html_path = tmp_path(:html)
    pdf_path = tmp_path(:pdf)
    File.open(html_path, 'w+') { |f| f << html }
    system('wkhtmltopdf', '-q', html_path, pdf_path)
    IO.read(pdf_path)
  ensure
    FileUtils.rm(html_path) rescue nil
    FileUtils.rm(pdf_path) rescue nil
  end
end
```