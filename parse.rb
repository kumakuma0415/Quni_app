# いらないファイル


# require 'open-uri'
# require 'pdf-reader'

# # pdfのファイルをスクレイピングする

# url = 'http://vips.eng.niigata-u.ac.jp/WebAccess/PDFAccessibilityQ&A.pdf'

# io = open(url)
# reader = PDF::Reader.new(io)

puts TeishokuMenu.find_by(id: 2).updated_at