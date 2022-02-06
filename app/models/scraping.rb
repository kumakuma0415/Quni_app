# rails c
# Scraping.scrape_lunch
# Scraping.scrape_dinner

# pdfのスクレイピング用
require 'open-uri'
require 'pdf-reader'

require 'time'

class Scraping < ApplicationRecord

  # pdfのスクレイピング
  def self.practice
    url = 'http://vips.eng.niigata-u.ac.jp/WebAccess/PDFAccessibilityQ&A.pdf'

    io = open(url)
    reader = PDF::Reader.new(io)

    puts reader
  end



  # 昭和バスの時間帯をスクレイピング
  def self.scrape_showa_toStation
    # 関数にしてきれいにする
    agent = Mechanize.new                  #agentは任意の変数
    page_showa_toStation = agent.get(@hp_showa_toStation)  #pageは任意の変数 getの引数はサイトのURL
    elements = page_showa_toStation.search('a.goto-detail') #div.idxcol aは取得したい要素  elementsは任意の変数
    @showa_toStation = elements[0].inner_text
    @showa_toStation2 = elements[1].inner_text
  end

  # 昭和バスの時間帯をスクレイピング
  def self.scrape_showa_toUniversity
    #
    agent2 = Mechanize.new
    page_showa_toUniversity = agent2.get(@hp_showa_toUniversity)  #pageは任意の変数 getの引数はサイトのURL
    elements2 = page_showa_toUniversity.search('a.goto-detail') #div.idxcol aは取得したい要素  elementsは任意の変数
    @showa_toUniversity = elements2[0].inner_text
    @showa_toUniversity2 = elements2[1].inner_text
  end


  # 今週の昼の定食をスクレイピング １周間ズレている
  def self.scrape_lunch
    agent = Mechanize.new                  #agentは任意の変数
    page = agent.get("http://www.coop.kyushu-u.ac.jp/cgi-bin/teishokuurl.cgi?location=on")  #pageは任意の変数 getの引数はサイトのURL
    elements = page.search('td.lunch') #div.idxcol aは取得したい要素  elementsは任意の変数
    elements.each do |element|
      menu = TeishokuMenu.new                      #Fishは任意のクラス、fishは任意のインスタンス
      menu.content = element.inner_text
      menu.save
    end
    menu2 = TeishokuMenu.new
    menu2.content = "ㅤ"
    menu2.save
    menu3 = TeishokuMenu.new
    menu3.content = "ㅤ"
    menu3.save

  end

  # 今週の夜の定食をスクレイピング
  def self.scrape_dinner
    agent = Mechanize.new                  #agentは任意の変数
    page = agent.get("http://www.coop.kyushu-u.ac.jp/cgi-bin/teishokuurl.cgi?location=on")  #pageは任意の変数 getの引数はサイトのURL
    elements = page.search('td.dinner') #div.idxcol aは取得したい要素  elementsは任意の変数
    elements.each do |element|
      menu = TeishokuMenu2.new                      #Fishは任意のクラス、fishは任意のインスタンス
      menu.content = element.inner_text
      menu.save
    end
    menu2 = TeishokuMenu2.new
    menu2.content = ""
    menu2.save
    menu3 = TeishokuMenu2.new
    menu3.content = ""
    menu3.save

  end
  
end