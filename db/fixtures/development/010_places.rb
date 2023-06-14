Place.seed(:id,
           { prefecture_id: 1, category_id: 1, name: '登別温泉', address: '北海道登別市', gone: true, memo: 'memo1', user_id: 1, status: false },
           { prefecture_id: 1, category_id: 4, name: '札幌時計台', address: '北海道札幌市', gone: false, memo: 'memo2', user_id: 1, status: false },
           { prefecture_id: 1, category_id: 4, name: '旭山動物園', address: '北海道旭川市', gone: true, memo: 'memo3', user_id: 1, status: false },
           { prefecture_id: 1, category_id: 1, name: '洞爺湖温泉', address: '北海道洞爺湖町', gone: false, memo: 'memo4', user_id: 1, status: false },
           { prefecture_id: 11, category_id: 4, name: '長瀞', address: '埼玉県長瀞町', gone: true, memo: 'ライン下り楽しかった', user_id: 1, status: false },
           { prefecture_id: 1, category_id: 1, name: '他の人温泉', address: '北海道登別市', gone: true, memo: 'memo1', user_id: 2, status: true },
           { prefecture_id: 1, category_id: 4, name: '他の人時計台', address: '北海道札幌市', gone: false, memo: 'memo2', user_id: 2, status: true },
)
