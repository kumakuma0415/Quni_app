require "date"
require "time"

class FunctionShowa
     # 昭和バスの営業時間を表示
    def business_hours_display

        # 今日の年月日
        dt = Time.now
        # heroku 用？？
        dt2 = dt + 60*60*9
        # localhost:3000 用？？
        # dt2 = dt
        num_dt = dt.strftime("%Y%m%d")   # 例)2022/01/26 → 20220126
        num_dt2 = dt2.strftime("%H%M")  # 例)14:47 → 1447
        num_dt3 = dt.strftime("%H")  # 例)14:47 → 1447
        num_dt4 = dt.strftime("%M")  # 例)14:47 → 1447

        #HPサイト取得
        @hp_showa_toStation = "https://transfer.navitime.biz/showa-bus/extif/TransferSearchIF?startName=九大ビッグオレンジ&goalName=九大学研都市駅&start=00087910&goal=00291944&date=" + num_dt + num_dt2 + "&device=pc&month_=2022%2F01%2F26&hour=9&minute=23&basis=1&sort=0"
        @hp_showa_toUniversity = "https://transfer.navitime.biz/showa-bus/extif/TransferSearchIF?startName=九大学研都市駅&goalName=九大ビッグオレンジ&start=00291944&goal=00087910&date=" + num_dt + num_dt2 + "&device=pc&month_=2022%2F01%2F27&hour=10&minute=42&basis=1&sort=0"


        # 九大ビッグオレンジ～九大学研都市駅
        agent = Mechanize.new                  #agentは任意の変数
        page_showa_toStation = agent.get(@hp_showa_toStation)  #pageは任意の変数 getの引数はサイトのURL
        elements1 = page_showa_toStation.search('div.startGoalTime') #div.idxcol aは取得したい要素  elementsは任意の変数
        @showa_toStation0 = elements1[0].inner_text
        @showa_toStation1 = elements1[1].inner_text
        @showa_toStation2 = elements1[2].inner_text
        @showa_toStation3 = elements1[3].inner_text
    

        # 九大学研都市駅～九大ビッグオレンジ
        agent2 = Mechanize.new
        page_showa_toUniversity = agent2.get(@hp_showa_toUniversity)  #pageは任意の変数 getの引数はサイトのURL
        elements2 = page_showa_toUniversity.search('div.startGoalTime') #div.idxcol aは取得したい要素  elementsは任意の変数
        @showa_toUniversity0 = elements2[0].inner_text
        @showa_toUniversity1 = elements2[1].inner_text
        @showa_toUniversity2 = elements2[2].inner_text
        @showa_toUniversity3 = elements2[3].inner_text

        return @hp_showa_toStation, @hp_showa_toUniversity,
         @showa_toStation0, @showa_toStation1, @showa_toStation2, @showa_toStation3,
         @showa_toUniversity0, @showa_toUniversity1, @showa_toUniversity2, @showa_toUniversity3
    end
end