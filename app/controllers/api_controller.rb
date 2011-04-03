require 'fastercsv'

class ApiController < ApplicationController
  def get
    @shops = Shop.all

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @shops }
    end
  end
  
  def export
    
    # データベースからの検索処理
    @shops = Shop.all
    
    # 出力ファイルのコンテンツタイプの決定
    cntnt_type = ""
    if request.user_agent =~ /windows/i then
      # クライアント環境がWindowsの場合はExcel形式で返す
      cntnt_type = "application/vnd.ms-excel"
    else
      # それ以外の場合にはCSV形式で返す
      cntnt_type = "text/csv"
    end
    
    # ファイル名称の設定
    file_name = "hoge.csv"
    # CSVオブジェクトを生成し、データをセットしていく
    output = FasterCSV.generate(:force_quotes => true) do |csv|
#    CSV::Writer.generate(output = "") do |csv|
      for shop in @shops
        csv << [shop.id ,shop.category, shop.name, shop.address ]
      end
    end
    # CSVファイルの出力
    send_data(NKF.nkf('-U -s -Lw', output), :type => cntnt_type, :filename => file_name)
  end

end
