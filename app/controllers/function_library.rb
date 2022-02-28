class FunctionLibrary
    # 各図書館の営業時間を表示
    def business_hours_display
        # HPサイト取得
        @hp_chuou = "https://www.lib.kyushu-u.ac.jp/ja/libraries/central"
        @hp_rikei = "https://www.lib.kyushu-u.ac.jp/ja/libraries/scitech"
        @hp_igaku = "https://www.lib.kyushu-u.ac.jp/ja/libraries/medical"
        @hp_geijutsu = "https://www.lib.kyushu-u.ac.jp/ja/libraries/design"
        @hp_chikushi = "https://www.lib.kyushu-u.ac.jp/ja/libraries/chikushi"

        agent = Mechanize.new                  #agentは任意の変数

        page_chuou = agent.get(@hp_chuou)  #pageは任意の変数 getの引数はサイトのURL
        elements = page_chuou.search('p.base_font') #div.idxcol aは取得したい要素  elementsは任意の変数
        @time_chuou = elements.inner_text

        page_rikei = agent.get(@hp_rikei)  #pageは任意の変数 getの引数はサイトのURL
        elements2 = page_rikei.search('p.base_font') #div.idxcol aは取得したい要素  elementsは任意の変数
        @time_rikei = elements2.inner_text

        page_igaku = agent.get(@hp_igaku)  #pageは任意の変数 getの引数はサイトのURL
        elements3 = page_igaku.search('p.base_font') #div.idxcol aは取得したい要素  elementsは任意の変数
        @time_igaku = elements3.inner_text

        page_geijutsu = agent.get(@hp_geijutsu)  #pageは任意の変数 getの引数はサイトのURL
        elements4 = page_geijutsu.search('p.base_font') #div.idxcol aは取得したい要素  elementsは任意の変数
        @time_geijutsu = elements4.inner_text

        page_chikushi = agent.get(@hp_chikushi)  #pageは任意の変数 getの引数はサイトのURL
        elements5 = page_chikushi.search('p.base_font') #div.idxcol aは取得したい要素  elementsは任意の変数
        @time_chikushi = elements5.inner_text

        return @hp_chuou, @hp_rikei, @hp_igaku, @hp_geijutsu, @hp_chikushi,
        @time_chuou,  @time_rikei,  @time_igaku,  @time_geijutsu,  @time_chikushi
    end
end