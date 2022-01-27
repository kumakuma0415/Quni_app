require "date"
require "time"
require "./app/models/scraping.rb"

class HomeController < ApplicationController

  def top

    # 今日の年月日
    dt = Time.now
    # 例)20220126
    num_dt = dt.strftime("%Y%m%d")
    num_dt2 = dt.strftime("%H%M")
    
    @hp_showa_toStation = "https://transfer.navitime.biz/showa-bus/extif/TransferSearchIF?startName=九大ビッグオレンジ&goalName=九大学研都市駅&start=00087910&goal=00291944&date=" + num_dt + num_dt2 + "&device=pc&month_=2022%2F01%2F26&hour=14&minute=46&basis=1&sort=0"
    @hp_showa_toUniversity = "https://transfer.navitime.biz/showa-bus/extif/TransferSearchIF?startName=九大学研都市駅&goalName=九大ビッグオレンジ&start=00291944&goal=00087910&date=" + num_dt + num_dt2 + "&device=pc&month_=2022%2F01%2F27&hour=10&minute=42&basis=1&sort=0"


    # 関数にしてきれいにする
    agent = Mechanize.new                  #agentは任意の変数
    page_showa_toStation = agent.get(@hp_showa_toStation)  #pageは任意の変数 getの引数はサイトのURL
    elements = page_showa_toStation.search('a.goto-detail') #div.idxcol aは取得したい要素  elementsは任意の変数
    @showa_toStation = elements[0].inner_text
    @showa_toStation2 = elements[1].inner_text

    #
    agent2 = Mechanize.new
    page_showa_toUniversity = agent2.get(@hp_showa_toUniversity)  #pageは任意の変数 getの引数はサイトのURL
    elements2 = page_showa_toUniversity.search('a.goto-detail') #div.idxcol aは取得したい要素  elementsは任意の変数
    @showa_toUniversity = elements2[0].inner_text
    @showa_toUniversity2 = elements2[1].inner_text



    # 西鉄バス
    # 1/27の日付でも最新の情報が手にはいる？？
    @hp_nishitetsu_toTenjin = "https://jik.nishitetsu.jp/route?f_zahyo_flg=0&f_list=0001%2C563169&t_zahyo_flg=0&t_list=0000%2CD00105&rightnow_flg=2&sdate=2022%2F01%2F27&stime_h=10&stime_m=45&stime_flg=1&jkn_busnavi=1&syosaiFlg=0"
    @hp_nishitetsu_toUniversity = "https://transfer.navitime.biz/showa-bus/extif/TransferSearchIF?startName=九大学研都市駅&goalName=九大ビッグオレンジ&start=00291944&goal=00087910&date=" + num_dt + num_dt2 + "&device=pc&month_=2022%2F01%2F27&hour=10&minute=42&basis=1&sort=0"


    # 関数にしてきれいにする
    agent3 = Mechanize.new                  #agentは任意の変数
    page_nishitetsu_toTenjin = agent3.get(@hp_nishitetsu_toTenjin)  #pageは任意の変数 getの引数はサイトのURL
    elements3 = page_nishitetsu_toTenjin.search('.item .time span') #div.idxcol aは取得したい要素  elementsは任意の変数
    @nishitetsu_toTenjin0 = elements3[0].inner_text
    @nishitetsu_toTenjin1 = elements3[1].inner_text
    @nishitetsu_toTenjin2 = elements3[2].inner_text
    @nishitetsu_toTenjin3 = elements3[3].inner_text
    
    #修正を加える
    # agent4 = Mechanize.new
    # page_nishitetsu_toUniversity = agent4.get(@hp_nishitetsu_toUniversity)  #pageは任意の変数 getの引数はサイトのURL
    # elements4 = page_nishitetsu_toUniversity.search('li.item') #div.idxcol aは取得したい要素  elementsは任意の変数
    # @nishitetsu_toUniversity = elements4[0].inner_text
    # @nishitetsu_toUniversity2 = elements4[1].inner_text
    

    # elements.each do |element|
    #   menu = TeishokuMenu.new                      #Fishは任意のクラス、fishは任意のインスタンス
    #   menu.content = element.inner_text
    #   menu.save
    # end


    # 投稿機能
    @posts = Post.all


    # 学食の表示
    # nの値は、曜日に通し番号をつけたもの 例)monday:1 Saturday:6
    n = Date.today.wday

    base_day = Date.new(2022, 2, 6)
    x = (Date.today.next_week(:sunday) - base_day).to_i
    y = x / 7

    # データベースを更新するか否か
    k = TeishokuMenu.find_by(id: 3*n -1 + 18*y).updated_at
    if Date.today - k.to_date >= 7
      scrape_lunch = Scraping.scrape_lunch
      scrape_lunch
      scrape_dinner = Scraping.scrape_dinner
      scrape_dinner
    end

    # 今日の学食
    menu_lunch = TeishokuMenu.find_by(id: 3*n-1 + 18 * y)
    menu_dinner = TeishokuMenu2.find_by(id: 3*n-1 + 15 * y)
    @today_menu_lunch = menu_lunch.content
    @today_menu_dinner = menu_dinner.content
    
    
    
    # アグリダイニング
    if n >=1 && n <= 5
      @open_time = "11:00～14:00"
    else
      @open_time = "Close"
    end

  end

  def post
    # 投稿機能
    @posts = Post.all
  end

  def bus
  end

  def library
  end

  def cafe
    # 今週の学食の表示
    @menus_lunch = TeishokuMenu.all
    @menus_dinner = TeishokuMenu2.all

    # 学食の表示
    # nの値は、曜日に通し番号をつけたもの 例)monday:1 Saturday:6
    n = Date.today.wday

    base_day = Date.new(2022, 2, 6)
    x = (Date.today.next_week(:sunday) - base_day).to_i
    y = x / 7

    # データベースを更新するか否か
    k = TeishokuMenu.find_by(id: 3*n -1 + 18*y).updated_at
    if Date.today - k.to_date >= 7
      scrape_lunch = Scraping.scrape_lunch
      scrape_lunch
      scrape_dinner = Scraping.scrape_dinner
      scrape_dinner
    end

    # 今日の学食
    menu_lunch = TeishokuMenu.find_by(id: 3*n-1 + 18 * y)
    menu_dinner = TeishokuMenu2.find_by(id: 3*n-1 + 15 * y)
    @today_menu_lunch = menu_lunch.content
    @today_menu_dinner = menu_dinner.content
  end

  def shop
  end

end
