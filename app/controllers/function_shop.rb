class FunctionShop
    # 各売店の営業時間を表示
    def business_hours_display
        # nの値は、曜日に通し番号をつけたもの 例)monday:1 Saturday:6
        n = Date.today.wday

        # イースト１号館
        if n >=1 && n <= 5
            @open_time_east1 = "8:00～20:00"
        elsif n == 6
            @open_time_east1 = "11:00～17:00"
        else
            @open_time_east1 = "Close"
        end
    
        # 中央図書館
        if n >=1 && n <= 5
            @open_time_chuoh = "8:00～20:00"
        elsif n == 6
            @open_time_chuoh = "10:00～20:00"
        else
            @open_time_chuoh = "Close"
        end
    
        # 伊都協奏館
        if n >=1 && n <= 6
            @open_time_ito = "17:00～20:00"
        elsif n == 7
            @open_time_ito = "11:00～14:00"
        else
            @open_time_ito = "Close"
        end
    
        # 皎々舎
        # 日常ゾーン
        if n >=1 && n <= 5
            @open_time_nichijo = "8:00～20:00"
        elsif n == 6
            @open_time_nichijo = "8:00～19:00"
        else
            @open_time_nichijo = "10:00～17:00"
        end
        # 勉学ゾーン
        if n >=1 && n <= 5
            @open_time_bengaku = "8:00～20:00"
        elsif n == 6
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

        return @open_time_east1, @open_time_chuoh, @open_time_ito,
        @open_time_nichijo, @open_time_bengaku, @open_time_chumon, @open_time_ryokou,
        @open_time_Qshop, @open_time_konbini, @open_time_west5, @open_time_bigdora2,
        @open_time_igakushop, @open_time_ohashi, @open_time_tikushi
    end
end