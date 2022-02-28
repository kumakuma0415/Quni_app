class FunctionCafe
    # 各学食の営業時間を表示
    def business_hours_display
         # nの値は、曜日に通し番号をつけたもの 例)monday:1 Saturday:6
        n = Date.today.wday

        base_day = Date.new(2022, 2, 6)
        x = (Date.today.next_week(:sunday) - base_day).to_i
        y = x / 7

        agent = Mechanize.new                  #agentは任意の変数
        page = agent.get("http://www.coop.kyushu-u.ac.jp/teishoku220207.html")  #pageは任意の変数 getの引数はサイトのURL
        menu_lunch = page.search('td.lunch') #div.idxcol aは取得したい要素  elementsは任意の変数
        menu_dinner = page.search('td.dinner') #div.idxcol aは取得したい要素  elementsは任意の変数

        @today_menu_lunch = menu_lunch[3*n-2].inner_text
        @today_menu_dinner = menu_dinner[3*n-2].inner_text
        

        # ビッグスカイ
        if n >=1 && n <= 5
        @open_time_bigsky = "10:00～20:00"
        elsif n == 6
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
        elsif n == 6
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
        elsif n == 6
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

        return @today_menu_lunch, @today_menu_dinner, 
        @open_time_bigsky, @open_time_lcafe,
        @open_time_bigorange, @open_time_Qasis, @open_time_bigdining, @open_time_underground,
        @open_time_libca, @open_time_agri, @open_time_bigdora, @open_time_ikei
    end
end