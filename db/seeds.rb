#管理ユーザーを作成
User.create!(name: "管理者",
              email: "admin@example.jp",
              password: "111111",
              password_confirmation: "111111",
              admin: true)
