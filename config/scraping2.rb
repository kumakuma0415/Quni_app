# いらないファイル

class Scraping2
    def scrape
        agent = Mechanize.new                  #agentは任意の変数
        page = agent.get("http://www.coop.kyushu-u.ac.jp/cgi-bin/teishokuurl.cgi?location=on")  #pageは任意の変数 getの引数はサイトのURL
        elements = page.search('td.lunch') #div.idxcol aは取得したい要素  elementsは任意の変数
        elements.each do |element|
          menu = Menu.new                      #Fishは任意のクラス、fishは任意のインスタンス
          menu.content = element.inner_text
          .save
        end
        # 夕食分を表示する
    end

end