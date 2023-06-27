# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin.create!(
   #email: 'admin@admin',
   #password: 'testtest'
#)

#Tag.create([
  #{ tags: '餃子' },
  #{ tags: 'チャーハン' },
  #{ tags: 'チャーシュー丼' },
#])

admins = [
    {email: 'admin@admin', password: 'testtest'},
]

admins.each do |admin|
    admin_data = Admin.find_by(email: admin[:email])
    if admin_data.nil?
        Admin.create(email: admin[:email], password: admin[:password])
    end
end

tags = %w(餃子 チャーハン チャーシュー丼)
tags.each do |tag|
    Tag.find_or_create_by(tags: tag)
end

ra_men8s = [
    {
        email: 'user@example.com',
        password: 'passw@rd',
        last_name: 'ゲスト',
        first_name: '太郎',
        last_name_kana: 'げすと',
        first_name_kana: 'たろう',
        post_code: '000-0000',
        address: '大阪',
        tel: '000-0000-0000',
        is_deleted: false,
        genres: [
            {
                name: '醤油ラーメン',
                shops: [
                    name: 'あおい',
                    introduction: '定番',
                    reviews: [
                        {star: 4, introduction: 'おいしい1', image: 'ramen_syouyu.png'},
                        {star: 3, introduction: 'おいしい2', image: 'ramen_syouyu.png'},
                        {star: 3, introduction: 'おいしい3', image: 'ramen_syouyu.png'},
                        {star: 4, introduction: 'おいしい4', image: 'ramen_syouyu.png'},
                        {star: 5, introduction: 'おいしい5', image: 'ramen_syouyu.png'},
                    ]
                ]
            },
            {
                name: '塩ラーメン',
                shops: [
                    name: 'やよい',
                    introduction: '超定番',
                    reviews: [
                        {star: 4, introduction: 'おいしい1', image: 'ramen_syouyu.png'},
                        {star: 3, introduction: 'おいしい2', image: 'ramen_syouyu.png'},
                        {star: 3, introduction: 'おいしい3', image: 'ramen_syouyu.png'},
                        {star: 4, introduction: 'おいしい4', image: 'ramen_syouyu.png'},
                        {star: 5, introduction: 'おいしい5', image: 'ramen_syouyu.png'},
                    ]
                ]
            },
        ]
    }
]

ra_men8s.each do |ra_men8|

    # カスタマーIDを取るための処理
    customer_data = Customer.find_by(email: ra_men8[:email])
    if customer_data.nil?
        customer_data = Customer.create!(
            email: ra_men8[:email],
            password: ra_men8[:password],
            last_name: ra_men8[:last_name],
            first_name: ra_men8[:first_name],
            last_name_kana: ra_men8[:last_name_kana],
            first_name_kana: ra_men8[:first_name_kana],
            post_code: ra_men8[:post_code],
            address: ra_men8[:address],
            tel: ra_men8[:tel],
            is_deleted: false,
        )
    end

    # ジャンル生成
    ra_men8[:genres].each do |genre|
        genre_data = Genre.find_or_create_by(genre_name: genre[:name])
        genre[:shops].each do |shop|

            item_data = Item.find_or_create_by!(item_name: shop[:name]) do |s|
                s.introduction = shop[:introduction]
                s.genre_id = genre_data.id
                s.customer_id = customer_data.id
            end

            shop[:reviews].each do |review|
                Review.find_or_create_by(introduction: review[:introduction]) do |r|
                    r.customer_id = customer_data.id
                    r.item_id = item_data.id
                    r.star = review[:star]
                    r.image.attach(io: File.open(Rails.root.join("app/assets/images/#{review[:image]}")), filename: review[:image])
                end
            end
        end
    end
end


# Genre.create([
#   { genre_name: '醤油ラーメン' },
#   { genre_name: '塩ラーメン' },
#   { genre_name: '豚骨ラーメン' },
#   { genre_name: '味噌ラーメン' },
# ])

# Item.create([
#   { item_name: 'あおい',
#   ntroduction: '定番',
#   genre_name: '醤油ラーメン'
#   },
#   { item_name: '塩しお',
#   ntroduction: 'あっさり',
#   genre_name: '塩ラーメン'
#   },
#   { item_name: 'とんこつとん',
#   ntroduction: '濃厚',
#   genre_name: '豚骨ラーメン'
#   },
#   { item_name: 'みそめん',
#   ntroduction: 'コク深い味わい',
#   genre_name: '味噌ラーメン'
#   },
# ])

# Review.create([
#   { star: 1,
#   ntroduction: 'おいしい',
#   image: File.open('./app/assets/images/ramen_syouyu.png'),
#   item_id:
#   customer_id:
#   },
#   { star: 2,
#   ntroduction: 'めっちゃおいしい',
#   image: File.open('./app/assets/images/ramen_shio.png')
#   },
#   { star: 3,
#   ntroduction: 'めちゃくちゃおいしい',
#   image: File.open('./app/assets/images/ramen_tonkotsu.png')
#   },
#   { star: 4,
#   ntroduction: 'ばりおいしい',
#   image: File.open('./app/assets/images/ramen_miso.png')
#   },
# ])