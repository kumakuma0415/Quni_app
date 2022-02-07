require "date"
require "time"
require "./app/models/scraping.rb"
# require 'holiday_japan'

class HomeController < ApplicationController

  def top

    # 今日の年月日
    dt = Time.now
    num_dt = dt.strftime("%Y%m%d")   # 例)2022/01/26 → 20220126
    num_dt2 = dt.strftime("%H%M")  # 例)14:47 → 1447
    

    #昭和バス
    #HPサイト取得
    @hp_showa_toStation = "https://transfer.navitime.biz/showa-bus/extif/TransferSearchIF?startName=九大ビッグオレンジ&goalName=九大学研都市駅&start=00087910&goal=00291944&date=" + num_dt + num_dt2 + "&device=pc&month_=2022%2F01%2F26&hour=14&minute=46&basis=1&sort=0"
    @hp_showa_toUniversity = "https://transfer.navitime.biz/showa-bus/extif/TransferSearchIF?startName=九大学研都市駅&goalName=九大ビッグオレンジ&start=00291944&goal=00087910&date=" + num_dt + num_dt2 + "&device=pc&month_=2022%2F01%2F27&hour=10&minute=42&basis=1&sort=0"


    # 関数にしてきれいにする
    # scrape_showa_toStation = Scraping.scrape_showa_toStation
    # scrape_showa_toStation
    # scrape_showa_toUniversity = Scraping.scrape_showa_toUniversity
    # scrape_showa_toUniversity

    # 九大ビッグオレンジ～九大学研都市駅
    agent = Mechanize.new                  #agentは任意の変数
    page_showa_toStation = agent.get(@hp_showa_toStation)  #pageは任意の変数 getの引数はサイトのURL
    elements = page_showa_toStation.search('div.startGoalTime') #div.idxcol aは取得したい要素  elementsは任意の変数
    @showa_toStation0 = elements[0].inner_text
    @showa_toStation1 = elements[1].inner_text
    @showa_toStation2 = elements[2].inner_text
    @showa_toStation3 = elements[3].inner_text

    # 九大学研都市駅～九大ビッグオレンジ
    agent2 = Mechanize.new
    page_showa_toUniversity = agent2.get(@hp_showa_toUniversity)  #pageは任意の変数 getの引数はサイトのURL
    elements2 = page_showa_toUniversity.search('div.startGoalTime') #div.idxcol aは取得したい要素  elementsは任意の変数
    @showa_toUniversity0 = elements2[0].inner_text
    @showa_toUniversity1 = elements2[1].inner_text
    @showa_toUniversity2 = elements2[2].inner_text
    @showa_toUniversity3 = elements2[3].inner_text



    # 西鉄バス
    # HPサイト取得
    # 1/27の日付でも最新の情報が手に入るみたい
    @hp_nishitetsu_toTenjin = "https://jik.nishitetsu.jp/route?f_zahyo_flg=0&f_list=0001%2C563169&t_zahyo_flg=0&t_list=0000%2CD00105&rightnow_flg=2&sdate=2022%2F01%2F27&stime_h=10&stime_m=45&stime_flg=1&jkn_busnavi=1&syosaiFlg=0"
    @hp_nishitetsu_toHakata = "https://jik.nishitetsu.jp/route?f_zahyo_flg=0&f_list=0001%2C563169&t_zahyo_flg=0&t_list=0000%2CL00002&rightnow_flg=2&sdate=2022%2F01%2F31&stime_h=19&stime_m=25&stime_flg=1&jkn_busnavi=1&syosaiFlg=0"
    
    @hp_nishitetsu_toUniversity = "https://jik.nishitetsu.jp/route?f_list=0000,D00105&f_zahyo_flg=0&t_list=0001,563169&t_zahyo_flg=0&sdate=2022/01/27&stime_h=19&stime_m=15&stime_flg=1&sort=2&jkn_busnavi=1"
    @hp_nishitetsu_fromHakata_toUniversity = "https://jik.nishitetsu.jp/route?f_zahyo_flg=0&f_list=0000%2CD00202&t_zahyo_flg=0&t_list=0001%2C563169&rightnow_flg=2&sdate=2022%2F02%2F01&stime_h=12&stime_m=15&stime_flg=1&jkn_busnavi=1&syosaiFlg=0"


    # 関数にしてきれいにする


    # 九大ビッグオレンジ～天神ソラリア～博多駅
    agent3 = Mechanize.new                  #agentは任意の変数
    page_nishitetsu_toTenjin = agent3.get(@hp_nishitetsu_toTenjin)  #pageは任意の変数 getの引数はサイトのURL
    page_nishitetsu_toHakata = agent3.get(@hp_nishitetsu_toHakata)  #pageは任意の変数 getの引数はサイトのURL
    elements3 = page_nishitetsu_toTenjin.search('.item .time span') #div.idxcol aは取得したい要素  elementsは任意の変数
    elements3_3 = page_nishitetsu_toHakata.search('.item .time span') #div.idxcol aは取得したい要素  elementsは任意の変数
    elements3_2 = page_nishitetsu_toTenjin.search('.price span') #div.idxcol aは取得したい要素  elementsは任意の変数

    if elements3[0]
      @nishitetsu_toTenjin0 = elements3[0].inner_text
      @nishitetsu_toTenjin1 = elements3[1].inner_text
      @nishitetsu_toHakata1 = elements3_3[1].inner_text
      t1 = elements3[1].inner_text
      t2 = elements3[0].inner_text
      t3 = elements3_3[1].inner_text
      second1 = Time.parse(t1) - Time.parse(t2)
      second2 = Time.parse(t3) - Time.parse(t2)
      @t = (second1 /60).floor
      @t2 = (second2 /60).floor
    else
      @nishitetsu_toTenjin0 = ""
      @nishitetsu_toTenjin1 = ""
    end

    if elements3[2]
      @nishitetsu_toTenjin2 = elements3[2].inner_text
      @nishitetsu_toTenjin3 = elements3[3].inner_text
      @nishitetsu_toHakata3 = elements3_3[3].inner_text
      t4 = elements3[3].inner_text
      t5 = elements3[2].inner_text
      t6 = elements3_3[3].inner_text
      second3 = Time.parse(t4) - Time.parse(t5)
      second4 = Time.parse(t6) - Time.parse(t5)
      @t3 = (second3 /60).floor
      @t4 = (second4 /60).floor
      @nishitetsu_price = elements3_2[0].inner_text
   else
    @nishitetsu_toTenjin2 = ""
    @nishitetsu_toTenjin3 = ""
   end

    

    # 博多駅～天神ソラリア～九大ビッグオレンジ
    agent4 = Mechanize.new                  #agentは任意の変数
    page_nishitetsu_toUniversity = agent4.get(@hp_nishitetsu_toUniversity)  #pageは任意の変数 getの引数はサイトのURL
    page_nishitetsu_fromHakata_toUniversity = agent4.get(@hp_nishitetsu_fromHakata_toUniversity)  #pageは任意の変数 getの引数はサイトのURL
    elements4 = page_nishitetsu_toUniversity.search('.item .time span') #div.idxcol aは取得したい要素  elementsは任意の変数
    elements4_3 = page_nishitetsu_fromHakata_toUniversity.search('.item .time span') #div.idxcol aは取得したい要素  elementsは任意の変数
    elements4_2 = page_nishitetsu_toUniversity.search('.price span') #div.idxcol aは取得したい要素  elementsは任意の変数

    if elements4[0] && elements4_3[0]
      @nishitetsu_toUniversity0 = elements4[0].inner_text
      @nishitetsu_toUniversity1 = elements4[1].inner_text
      @nishitetsu_fromHakata_toUniversity0 = elements4_3[0].inner_text
      @nishitetsu_fromHakata_toUniversity1 = elements4_3[1].inner_text
      t7 = elements4[1].inner_text
      t8 = elements4[0].inner_text
      t9 = elements4_3[0].inner_text
      t10 = elements4_3[1].inner_text
      second3 = Time.parse(t7) - Time.parse(t8)
      second4 = Time.parse(t10) - Time.parse(t9)
      @t5 = (second3 /60).floor
      @t6 = (second4 /60).floor
      # 不安要素
      @nishitetsu_price2 = elements4_2[0].inner_text
    else
      @nishitetsu_saishu = "本日の営業は終了しました"
      @nishitetsu_toUniversitsy2 = ""
      @nishitetsu_toUniversity3 = ""
    end

    
    if elements4[2] && elements4_3[2]
      @nishitetsu_toUniversity2 = elements4[2].inner_text
      @nishitetsu_toUniversity3 = elements4[3].inner_text
      @nishitetsu_fromHakata_toUniversity3 = elements4_3[2].inner_text
      @nishitetsu_fromHakata_toUniversity4 = elements4_3[3].inner_text
      t3 = elements4[3].inner_text
      t4 = elements4[2].inner_text
      t5 = elements4_3[2].inner_text
      t6 = elements4_3[3].inner_text
      second2 = Time.parse(t3) - Time.parse(t4)
      second3 = Time.parse(t6) - Time.parse(t5)
      @t7 = (second2 /60).floor
      @t8 = (second3 /60).floor
    else
      @nishitetsu_toUniversity2 = ""
      @nishitetsu_toUniversity3 = ""
    end




    # 投稿機能
    @posts = Post.all.order(created_at: :desc)


    # 図書館
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


    # 学食

    # nの値は、曜日に通し番号をつけたもの 例)monday:1 Saturday:6
    n = Date.today.wday

    base_day = Date.new(2022, 2, 6)
    x = (Date.today.next_week(:sunday) - base_day).to_i
    y = x / 7

    # データベースを更新するか否か
    teishoku = TeishokuMenu.find_by(id: 3*n -1 + 18*y)
    k = teishoku.created_at
    if Date.today - k.to_date >= 7
    # if Date.today - k.to_date >= 10
      scrape_lunch = Scraping.scrape_lunch
      scrape_lunch
      scrape_dinner = Scraping.scrape_dinner
      scrape_dinner
    end

    # 今日の定食の表示
    menu_lunch = TeishokuMenu.find_by(id: 3*n-1 + 18 * y )
    menu_dinner = TeishokuMenu2.find_by(id: 3*n-1 + 15 * y + 3)
    @today_menu_lunch = menu_lunch.content
    @today_menu_dinner = menu_dinner.content
    
   
    # shukujitsu = HolidayJapan.check(Date.today)
    

    # 各学食の営業時間を表示

    # ビッグスカイ
    if n >=1 && n <= 5
      @open_time_bigsky = "10:00～20:00"
    elsif n = 6
      @open_time_bigsky = "11:00～14:00"     
    else
      @open_time_bigsky = "Close"
    end

    # L-Cafe
    if n >=1 && n <= 5
      @open_time_lcafe = "8:00～18:30"   
    else
      @open_time_lcafe = "Close"
    end

    # ビッグオレンジ
    if n >=1 && n <= 5
      @open_time_bigorange = "11:30～14:00"   
    else
      @open_time_bigorange = "Close"
    end

    # クアシス
    if n >=1 && n <= 5
      @open_time_Qasis = "7:45～17:30"   
    else
      @open_time_Qasis = "Close"
    end

    # ビッグダイニング
    if n >=1 && n <= 5
      @open_time_bigdining = "8:00～20:30"
    elsif n = 6
      @open_time_bigdining = "11:00～14:00 17:00-19:30"     
    else
      @open_time_bigdining = "Close"
    end

    # 地下食堂
    if n >=1 && n <= 5
      @open_time_underground = "11:00～14:00"   
    else
      @open_time_underground = "Close"
    end

    # Libca
    if n >=1 && n <= 5
      @open_time_libca = "11:00～19:00"   
    else
      @open_time_libca = "Close"
    end
    
    # アグリダイニング
    if n >=1 && n <= 5
      @open_time_agri = "11:00～14:00"
    else
      @open_time_agri = "Close"
    end

    # ビッグどら
    if n >=1 && n <= 5
      @open_time_bigdora = "8:00～20:30"
    elsif n = 6
      @open_time_bigdora = "11:00～14:00"     
    else
      @open_time_bigdora = "Close"
    end

    # 医系
    if n >=1 && n <= 5
      @open_time_ikei = "11:00～20:00"
    else
      @open_time_ikei = "Close"
    end


    # 各売店の営業時間を表示

    # イースト１号館
    if n >=1 && n <= 5
      @open_time_east1 = "8:00～20:00"
    elsif n = 6
      @open_time_east1 = "11:00～17:00"
    else
      @open_time_east1 = "Close"
    end

    # 中央図書館
    if n >=1 && n <= 5
      @open_time_chuoh = "8:00～20:00"
    elsif n = 6
      @open_time_chuoh = "10:00～20:00"
    else
      @open_time_chuoh = "Close"
    end

    # 伊都協奏館
    if n >=1 && n <= 6
      @open_time_ito = "17:00～20:00"
    elsif n = 7
      @open_time_ito = "11:00～14:00"
    else
      @open_time_ito = "Close"
    end

    # 皎々舎
    # 日常ゾーン
    if n >=1 && n <= 5
      @open_time_nichijo = "8:00～20:00"
    elsif n = 6
      @open_time_nichijo = "8:00～19:00"
    else
      @open_time_nichijo = "10:00～17:00"
    end
    # 勉学ゾーン
    if n >=1 && n <= 5
      @open_time_bengaku = "8:00～20:00"
    elsif n = 6
      @open_time_bengaku = "11:00～14:00"
    else
      @open_time_bengaku = "close"
    end
    # 注文カウンター
    if n >=1 && n <= 5
      @open_time_chumon = "9:00～20:00"
    else
      @open_time_chumon = "close"
    end
    # 旅行カウンター
    if n >=1 && n <= 5
      @open_time_ryokou = "10:00～18:00"
    else
      @open_time_ryokou = "close"
    end

    # Q-Shop
    if n >=1 && n <= 5
      @open_time_Qshop = "10:00～17:00"
    else
      @open_time_Qshop = "Close"
    end

    # 伊都コンビニ
    if n >=1 && n <= 7
      @open_time_konbini = "7:00～23:00"
    else
      @open_time_konbini = "Close"
    end

    # ウエスト５号館
    if n >=1 && n <= 5
      @open_time_west5 = "8:00～19:30"
    else
      @open_time_west5 = "Close"
    end

    # ビッグどら
    if n >=1 && n <= 6
      @open_time_bigdora2 = "8:00～21:00"
    else
      @open_time_bigdora2 = "Close"
    end

    # 医学部購買書籍
    if n >=1 && n <= 5
      @open_time_igakushop = "8:00～19:00"
    else
      @open_time_igakushop = "Close"
    end

    # 大橋
    if n >=1 && n <= 5
      @open_time_ohashi = "8:00～19:00"
    else
      @open_time_ohashi = "Close"
    end

    # 筑紫
    if n >=1 && n <= 5
      @open_time_tikushi = "10:00～18:00"
    else
      @open_time_tikushi = "Close"
    end



    # if @post.save
    #   flash[:notice] = "投稿しました！"
    # end

  end

  # 投稿をしたときの処理
  def create
    if params[:username] != "" || params[:content] != ""
      @post = Post.new(content: params[:content], username: params[:username])
      @post.save
      redirect_to("/top")
    else
      redirect_to("/top")
    end
  end

end