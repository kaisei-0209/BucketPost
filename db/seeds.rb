
Masa = User.create!(name: "Masa",
                email: "Masa@example.com",
                password: "sample",
                password_confirmation: "sample",
                profile: "憧れの松本人志さんのようなビッグなお笑いスターになって、コメンテーターでも司会でも俳優でもなんでもこなす、大物になりたい！",
                image: File.open("#{Rails.root}/app/assets/images/Masa.jpg"))

Takashi = User.create!(name: "Takashi",
                email: "Takashi@example.com",
                password: "sample",
                password_confirmation: "sample",
                profile: "ラーメンが大好きです。日本全国のラーメン屋を食べるまで天国へはいけません。",
                image: File.open("#{Rails.root}/app/assets/images/Takashi.jpg"))

Ryoma = User.create!(name: "Ryoma",
                email: "Ryoma@example.com",
                password: "sample",
                password_confirmation: "sample",
                profile: "誰もがしたいと思っているけど、行動に移す人が少ない「世界一周」をお金を貯めて絶対にします！",
                image: File.open("#{Rails.root}/app/assets/images/Ryoma.jpg"))

Kounosuke = User.create!(name: "Kounosuke",
                email: "Kounosuke@example.com",
                password: "sample",
                password_confirmation: "sample",
                profile: "実業家です。電気製品メーカーの社長をやっております。家族との時間をもっと増やすこと。それが今一番やりたいことです。",
                image: File.open("#{Rails.root}/app/assets/images/Kyounosuke.jpg"))

Keisuke = User.create!(name: "Keisuke",
                email: "Keisuke@example.com",
                password: "sample",
                password_confirmation: "sample",
                profile: "小学生です。サッカーやってます！世界一のサッカー選手になるまでは死んでも死に切れません！というか、絶対になります！",
                image: File.open("#{Rails.root}/app/assets/images/Keisuke.jpg"))

Ichiro = User.create!(name: "Ichiro",
                email: "Ichiro@example.com",
                password: "sample",
                password_confirmation: "sample",
                profile: "愛知県に住んでいる小学生です。野球が大好きです。将来は一流の野球選手になりたいです。",
                image: File.open("#{Rails.root}/app/assets/images/Ichiro.jpg"))

Haruka = User.create!(name: "Haruka",
                email: "Haruka@example.com",
                password: "sample",
                password_confirmation: "sample",
                profile: "女優です！、楽しいことばかりではないけど、自分の人生を楽しくできるのは自分だけ！頑張ります！",
                image: File.open("#{Rails.root}/app/assets/images/Haruka.jpg"))

Naomi = User.create!(name: "Naomi",
                email: "Naomi@example.com",
                password: "sample",
                password_confirmation: "sample",
                profile: "テニスプレイヤーです。16歳です。今やりたいことは、引退するまでに全国大会に出て優勝することです！",
                image: File.open("#{Rails.root}/app/assets/images/Naomi.jpg"))

Spielberg = User.create!(name: "Spielberg",
                email: "Spielberg@example.com",
                password: "sample",
                password_confirmation: "sample",
                profile: "映画監督です。誰もが素晴らしいと記憶に残る映画を作ります！",
                image: File.open("#{Rails.root}/app/assets/images/Spielberg.jpg"))

Walt = User.create!(name: "Walt",
                email: "Walt@example.com",
                password: "sample",
                password_confirmation: "sample",
                profile: "人の縁を大事にして生きています。",
                image: File.open("#{Rails.root}/app/assets/images/Walt.jpg"))

Jobs = User.create!(name: "Jobs",
                email: "Jobs@example.com",
                password: "sample",
                password_confirmation: "sample",
                profile: "プログラミングを勉強中です。様々な人が使いたくなるようなWebアプリを作りたいです！",
                image: File.open("#{Rails.root}/app/assets/images/Jobs.jpg"))

                #管理ユーザーを作成
User.create!(name: "管理者",
              email: "admin@example.jp",
              password: "111111",
              password_confirmation: "111111",
              admin: true,
              profile: "管理者です。ユーザーの削除を行えます",
              image: File.open("#{Rails.root}/app/assets/images/admin.jpg"))


# 投稿
Haruka.posts.create!(title: "食事制限" , content: "毎日食事制限辛いけど、自分の目標を達成するにはこれくらいは我慢する！。")
Ryoma.posts.create!(title: "後悔はしない" , content: "周りが反対していても、自分のやりたいことをやらないと死ぬときに絶対後悔するよね！",
                    image: File.open("#{Rails.root}/app/assets/images/party.jpg"))
Spielberg.posts.create!(title: "夢見て生きる" , content: "僕は、夜に夢を見るんじゃない。一日中夢を見ているんだ。生きる糧として、夢を見ている。")
Walt.posts.create!(title: "目標" , content: "夢見ることができれば、それは実現できる。",
                    image: File.open("#{Rails.root}/app/assets/images/target.jpg"))
Ichiro.posts.create!(title: "絶対に叶えたいこと" , content: "ぼくは一流のプロ野球選手になってみんなに認められたいです。")
Ichiro.posts.create!(title: "やるべきこと" , content: "そのためには、中学高校と全国大会に出て活躍しなければなりません。")
Ichiro.posts.create!(title: "必要なこと" , content: "活躍できるためには練習が必要です。")
Ichiro.posts.create!(title: "野球に触れた日" , content: "ぼくは、3歳のときから練習を始めています。3歳から7歳までは半年くらいやっていました。")
Ichiro.posts.create!(title: "積み重ね" , content: "3年生の時から今では、365日中360日は激しい練習をやってます。",
                    image: File.open("#{Rails.root}/app/assets/images/ground.jpg"))
Ichiro.posts.create!(title: "娯楽" , content: "だから１週間中で友達と遊べる時間は、5～6時間です。")
Ichiro.posts.create!(title: "自信" , content: "そんなに練習をやっているのだから、必ずプロ野球選手になれると思います。")
Kounosuke.posts.create!(title: "運命" , content: "「成功の秘訣はなんですか？」とよく聞かれますが、基本的には偶然とご縁の賜物だと思っております。")
Kounosuke.posts.create!(title: "大切なひととき" , content: "ただ最近は仕事が忙しくて家族との時間があまり取れていません。一番幸せな時は家族との時間です。")

Naomi.posts.create!(title: "好調" , content: "最近調子がいい。この前まで、「もう手遅れなんじゃないか」と悩んでいたのに。。。")
Naomi.posts.create!(title: "兆し" , content: "きっかけは、ある時、ふと「みんな、それぞれ別の道を歩んでいるのかもしれない」と思ったことです。")
Naomi.posts.create!(title: "比べるだけ無駄です" , content: "それからは、自分と他の誰かを比べることもなくなり、練習に集中できるようになり、結果もついてくるようになりました。")
Naomi.posts.create!(title: "自分を見つめよう" , content: "誰かと比べて落ち込まれている方も、ぜひ、自分のなすべき努力に集中してみてください！")
Jobs.posts.create!(title: "確かな自分を持つこと" , content: "私の尊敬する実業家の方が「他人の意見で自分の本当の心の声を消してはならない。自分の直感を信じる勇気を持ちなさい。」と仰っていました。")
Jobs.posts.create!(title: "技術の力" , content: "私は、技術の力で、世界を変えられると思っています。")
Jobs.posts.create!(title: "覚悟" , content: "その為には、反逆者と言われようと、いつだって、自分の理性と直感を信じて、前に進まなければならないと思っています。")

Takashi.posts.create!(title: "命は贈り物" , content: "ウィリアム・シェイクスピアはこう言っています「人間、一度しか死ぬことはできない。命は神さまからの借りものだ」と。")
Takashi.posts.create!(title: "大好きなこと" , content: "だからこそ私は日本全国のラーメンを食べ尽くすまで天国へはいけないのです！！")
Takashi.posts.create!(title: "カロリー爆弾" , content: "本日は二郎系ラーメンでカロリーとニンニクを注入してきます！！")
Keisuke.posts.create!(title: "少しだけポロリ" , content: "今日の練習が終わりました。練習試合に負けて、めっちゃ走らされたけど、あれって意味あるのかなぁ？")
Keisuke.posts.create!(title: "日々のケア" , content: "家に帰ってお風呂に入ったら、ストレッチとアイシングをします。世界一のサッカー選手になるには、世界一練習しないとダメで、その為にはからだのケアも大切です。",
                          image: File.open("#{Rails.root}/app/assets/images/stretchi.jpg"))
Keisuke.posts.create!(title: "両親への感謝" , content: "世界一のサッカー選手になったら、もちろん大金持ちになって、親孝行したいなぁ。。")
Masa.posts.create!(title: "不幸中の幸い" , content: "新宿のルミネtheよしもとでライブでした〜。今日は相方が少し風邪気味で、ガラガラ声だったのが逆にウケた笑")
Masa.posts.create!(title: "ライブは楽しいよ！" , content: "みなさんもぜひライブ見にきてくださいー！やっぱり生で見るのとテレビだと印象が全然違いますよ！(ぼくらテレビだとほとんど見られないですしね！笑)")
Masa.posts.create!(title: "ライバル出現" , content: "それにしても、一緒に出てたあのコンビ、めっちゃおもしろかったなぁ。俺も負けずに頑張るぞ！")


# リレーションシップ
users = User.all
user = users.first
following = users[2..12]
followers = users[3..12]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
