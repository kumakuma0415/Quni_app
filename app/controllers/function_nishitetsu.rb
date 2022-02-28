class FunctionNishitetsu
    # 西鉄バスの営業時間を表示
    def business_hours_display
        # HPサイト取得
        # 1/27の日付でも最新の情報が手に入るみたい
        @hp_nishitetsu_toTenjin = "https://jik.nishitetsu.jp/route?f_zahyo_flg=0&f_list=0001%2C563169&t_zahyo_flg=0&t_list=0000%2CD00105&rightnow_flg=2&sdate=2022%2F01%2F27&stime_h=10&stime_m=45&stime_flg=1&jkn_busnavi=1&syosaiFlg=0"
        @hp_nishitetsu_toHakata = "https://jik.nishitetsu.jp/route?f_zahyo_flg=0&f_list=0001%2C563169&t_zahyo_flg=0&t_list=0000%2CL00002&rightnow_flg=2&sdate=2022%2F01%2F31&stime_h=19&stime_m=25&stime_flg=1&jkn_busnavi=1&syosaiFlg=0"
        
        @hp_nishitetsu_toUniversity = "https://jik.nishitetsu.jp/route?f_list=0000,D00105&f_zahyo_flg=0&t_list=0001,563169&t_zahyo_flg=0&sdate=2022/01/27&stime_h=19&stime_m=15&stime_flg=1&sort=2&jkn_busnavi=1"
        @hp_nishitetsu_fromHakata_toUniversity = "https://jik.nishitetsu.jp/route?f_zahyo_flg=0&f_list=0000%2CD00202&t_zahyo_flg=0&t_list=0001%2C563169&rightnow_flg=2&sdate=2022%2F02%2F01&stime_h=12&stime_m=15&stime_flg=1&jkn_busnavi=1&syosaiFlg=0"



        # 九大ビッグオレンジ～天神ソラリア～博多駅
        agent3 = Mechanize.new                  #agentは任意の変数
        page_nishitetsu_toTenjin = agent3.get(@hp_nishitetsu_toTenjin)  #pageは任意の変数 getの引数はサイトのURL
        page_nishitetsu_toHakata = agent3.get(@hp_nishitetsu_toHakata)  #pageは任意の変数 getの引数はサイトのURL
        elements3 = page_nishitetsu_toTenjin.search('.item .time span') #div.idxcol aは取得したい要素  elementsは任意の変数
        elements3_3 = page_nishitetsu_toHakata.search('.item .time span') #div.idxcol aは取得したい要素  elementsは任意の変数
        
        if elements3[0]
            @nishitetsu_toTenjin0 = elements3[0].inner_text
            @nishitetsu_toTenjin1 = elements3[1].inner_text
            @nishitetsu_toTenjin0_1 = @nishitetsu_toTenjin0 + "発 ➡ " + @nishitetsu_toTenjin1 + "着"
            @nishitetsu_toHakata1 = elements3_3[1].inner_text
            @nishitetsu_toHakata0_1 = @nishitetsu_toTenjin0 + "発 ➡ " + @nishitetsu_toHakata1 + "着"
        else
            @nishitetsu_toTenjin0_1 = "今日は終了しました"
            @nishitetsu_toHakata0_1 = "今日は終了しました"
        end

        if elements3[2]
            @nishitetsu_toTenjin2 = elements3[2].inner_text
            @nishitetsu_toTenjin3 = elements3[3].inner_text
            @nishitetsu_toTenjin2_3 = @nishitetsu_toTenjin2 + "発 ➡ " + @nishitetsu_toTenjin3 + "着"
            @nishitetsu_toHakata3 = elements3_3[3].inner_text
            @nishitetsu_toHakata2_3 = @nishitetsu_toTenjin2 + "発 ➡ " + @nishitetsu_toHakata3 + "着"
        else
            @nishitetsu_toTenjin2_3 = ""
            @nishitetsu_toHakata2_3 = ""
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
            @nishitetsu_toUniversity0_1 = @nishitetsu_toUniversity0 + "発 ➡ " + @nishitetsu_toUniversity1 + "着"
            
            @nishitetsu_fromHakata_toUniversity0 = elements4_3[0].inner_text
            @nishitetsu_fromHakata_toUniversity1 = elements4_3[1].inner_text
            @nishitetsu_fromHakata_toUniversity0_1 = @nishitetsu_fromHakata_toUniversity0 + "発 ➡ " + @nishitetsu_fromHakata_toUniversity1 + "着"
        else
            @nishitetsu_toUniversity0_1 = "今日は終了しました"
            @nishitetsu_fromHakata_toUniversity0_1 = "今日は終了しました"
        end

        
        if elements4[2] && elements4_3[2]
            @nishitetsu_toUniversity2 = elements4[2].inner_text
            @nishitetsu_toUniversity3 = elements4[3].inner_text
            @nishitetsu_toUniversity2_3 = @nishitetsu_toUniversity2 + "発 ➡ " + @nishitetsu_toUniversity3 + "着"
            
            @nishitetsu_fromHakata_toUniversity2 = elements4_3[2].inner_text
            @nishitetsu_fromHakata_toUniversity3 = elements4_3[3].inner_text
            @nishitetsu_fromHakata_toUniversity2_3 = @nishitetsu_fromHakata_toUniversity2 + "発 ➡ " + @nishitetsu_fromHakata_toUniversity3 + "着"
        else
            @nishitetsu_toUniversity2_3 = ""
            @nishitetsu_fromHakata_toUniversity2_3 = ""
        end

        return @hp_nishitetsu_toTenjin, @hp_nishitetsu_toHakata, @hp_nishitetsu_toUniversity, @hp_nishitetsu_fromHakata_toUniversity, 
        
        @nishitetsu_toTenjin0_1, @nishitetsu_toHakata0_1,
        @nishitetsu_toTenjin2_3, @nishitetsu_toHakata2_3,

        @nishitetsu_toUniversity0_1, @nishitetsu_fromHakata_toUniversity0_1,
        
        @nishitetsu_toUniversity2_3, @nishitetsu_fromHakata_toUniversity2_3 
    end
end