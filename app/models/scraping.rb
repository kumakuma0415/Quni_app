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
  def self.scrape_showa

    # 今日の年月日
    dt = Time.now
    # 例)20220126
    num_dt = dt.strftime("%Y%m%d")
    num_dt2 = dt.strftime("%H%M")
    
    @hp = "https://transfer.navitime.biz/showa-bus/extif/TransferSearchIF?startName=九大ビッグオレンジ&goalName=九大学研都市駅&start=00087910&goal=00291944&date=" + num_dt + num_dt2 + "&device=pc&month_=2022%2F01%2F26&hour=14&minute=46&basis=1&sort=0"


    agent = Mechanize.new                  #agentは任意の変数
    page = agent.get(@hp)  #pageは任意の変数 getの引数はサイトのURL
    @showa = page.search('a.goto-detail') #div.idxcol aは取得したい要素  elementsは任意の変数
    
  end


  # 今週の昼の定食をスクレイピング
  def self.scrape_lunch
    agent = Mechanize.new                  #agentは任意の変数
    page = agent.get("http://www.coop.kyushu-u.ac.jp/cgi-bin/teishokuurl.cgi?location=on")  #pageは任意の変数 getの引数はサイトのURL
    elements = page.search('td.lunch') #div.idxcol aは取得したい要素  elementsは任意の変数
    elements.each do |element|
      menu = TeishokuMenu.new                      #Fishは任意のクラス、fishは任意のインスタンス
      menu.content = element.inner_text
      menu.save
    end
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
  end
  
end