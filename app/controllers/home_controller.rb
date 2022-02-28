class HomeController < ApplicationController

  def top

    # 昭和バスの時間を表示
    f = FunctionShowa.new
    @hp_showa_toStation, @hp_showa_toUniversity, 
    @showa_toStation0, @showa_toStation1, @showa_toStation2, @showa_toStation3,
    @showa_toUniversity0, @showa_toUniversity1, @showa_toUniversity2, @showa_toUniversity3 = f.business_hours_display
    

    # 西鉄バスの時間を表示
    f = FunctionNishitetsu.new
    @hp_nishitetsu_toTenjin, @hp_nishitetsu_toHakata, @hp_nishitetsu_toUniversity, @hp_nishitetsu_fromHakata_toUniversity, 
        
    @nishitetsu_toTenjin0_1, @nishitetsu_toHakata0_1,
    
    @nishitetsu_toTenjin2_3, @nishitetsu_toHakata2_3,

    @nishitetsu_toUniversity0_1, @nishitetsu_fromHakata_toUniversity0_1,
    
    @nishitetsu_toUniversity2_3, @nishitetsu_fromHakata_toUniversity2_3  = f.business_hours_display


    # 各図書館の営業時間を表示
    f = FunctionLibrary.new
    @hp_chuou, @hp_rikei, @hp_igaku, @hp_geijutsu, @hp_chikushi,
    @time_chuou,  @time_rikei,  @time_igaku,  @time_geijutsu,  @time_chikushi = f.business_hours_display

    # 各学食の営業時間を表示
    f = FunctionCafe.new
    @today_menu_lunch, @today_menu_dinner, 
    @open_time_bigsky, @open_time_lcafe,
    @open_time_bigorange, @open_time_Qasis, @open_time_bigdining, @open_time_underground,
    @open_time_libca, @open_time_agri, @open_time_bigdora, @open_time_ikei = f.business_hours_display

    # 各売店の営業時間を表示
    f = FunctionShop.new
    @open_time_east1, @open_time_chuoh, @open_time_ito,
    @open_time_nichijo, @open_time_bengaku, @open_time_chumon, @open_time_ryokou,
    @open_time_Qshop, @open_time_konbini, @open_time_west5, @open_time_bigdora2,
    @open_time_igakushop, @open_time_ohashi, @open_time_tikushi = f.business_hours_display

    # 今までの投稿を表示
    @posts = Post.all.order(created_at: :desc)

  end


  # 投稿をしたときの処理
  def create
    if params[:username] != "" || params[:content] != ""
      @post = Post.new(content: params[:content], username: params[:username])
      @post.save
      redirect_to("/")
    else
      redirect_to("/")
    end
  end

end