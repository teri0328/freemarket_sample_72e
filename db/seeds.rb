categories=[
            {gen1: "レディース", gen1_children:[
                                                  {gen2: "", gen2_children[]}
                                              ]},
            {gen1: "メンズ", gen1_children:[

                                            ]},
            {gen1: "ベビー・キッズ", gen1_children:[

                                                  ]},
            {gen1: "インテリア・住まい・小物", gen1_children:[

                                                          ]},
            {gen1: "本・音楽・ゲーム", gen1_children:[

                                                          ]},
            {gen1: "おもちゃ・ホビー・グッズ", gen1_children:[

                                                    ]},
            {gen1: "コスメ・香水・美容", gen1_children:[

                                                      ]},
            {gen1: "家電・スマホ・カメラ", gen1_children:[

                                                      ]},
            {gen1: "スポーツ・レジャー", gen1_children:[

                                                    ]},
            {gen1: "ハンドメイド", gen1_children:[

                                                ]},
            {gen1: "チケット", gen1_children:[

                                            ]},
            {gen1: "自動車・オートバイ", gen1_children:[

                                                    ]},
            {gen1: "その他", gen1_children:[

                                            ]}
]

# Categoryクラスのインスタンスを生成
@category1 = Category.create(name: "レディース")
# 配列を定義。中身は[{子カテゴリ, 孫カテゴリー群}]という構成。
category1s = [{gen2: "トップス", gen3:["Tシャツ/カットソー(半袖/袖なし)", "Tシャツ/カットソー(七分/長袖)", "シャツ/ブラウス(半袖/袖なし)", "シャツ/ブラウス(七分/長袖)", "ポロシャツ", "キャミソール", "タンクトップ", "ホルターネック", "ニット/セーター", "チュニック", "カーディガン/ボレロ", "アンサンブル", "ベスト/ジレ", "パーカー", "トレーナー/スウェット", "ベアトップ/チューブトップ", "ジャージ", "その他"]}]
            #  "ジャケット/アウター", "パンツ", "スカート", "ワンピース", "靴", "ルームウェア/パジャマ", "レッグウェア", "帽子", "バッグ", "アクセサリー", "ヘアアクセサリー", "小物", "時計"

# １を添字の始まりに指定し、配列に対し繰り返し処理を行う。
category1s.each.with_index(1) do [category1, i]
  gen2_var = "@category1_#{i}"
  # 小カテゴリーを自動生成
  gen2_val = @category1.children.create(name:"#{category1[:gen2]}")
  eval("#{gen2_var} = gen2_val")
  category1[:gen3].each do |gen3_val|
    eval("#{gen2_var}".children.create(name:gen3_val))
  end
end