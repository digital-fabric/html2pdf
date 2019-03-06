# frozen_string_literal: true

require 'modulation/gem'
require 'tmpdir'
require 'fileutils'

export_default :H2P

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