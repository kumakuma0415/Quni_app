# いらないファイル


# clockwork ./config/clock.rb

require 'clockwork'
require "./scraping"

# def scrape
#     p "kokoro"
# end

include Clockwork

    handler do |kokoro|
        case kokoro
        when 'kokoro.job'
            scrape = Scraping.new
            scrape.scrape_lunch
        end
    end

    every(3.seconds, 'kokoro.job')
end


# loop do
#     require 'mechanize'
#     agent = Mechanize.new                  #agentは任意の変数
#     page = agent.get("http://www.coop.kyushu-u.ac.jp/cgi-bin/teishokuurl.cgi?location=on")  #pageは任意の変数 getの引数はサイトのURL
#     elements = page.search('td.lunch') #div.idxcol aは取得したい要素  elementsは任意の変数
#     elements.each do |element|
#         menu = Menu.new                      #Fishは任意のクラス、fishは任意のインスタンス
#         menu.content = element.inner_text
#         .save
#     end
#     # 夕食分を表示する

#     sleep 3 # 1秒間 処理を停止
# end