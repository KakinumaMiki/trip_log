Plan.seed(:id,
          { name: '屋久島旅行', start_date: Time.parse("2022/07/12"), end_date: Time.parse("2022/07/14"), with_who: '友達', memo: '2回目中1回目', user_id: 1, status: false },
          { name: '日帰り旅行', start_date: Time.parse("2022/07/20"), end_date: Time.parse("2022/07/20"), with_who: '友達', memo: 'memoです', user_id: 1, status: false },
          { name: '他の人旅行', start_date: Time.parse("2022/07/20"), end_date: Time.parse("2022/07/20"), with_who: '友達', memo: 'memoです', user_id: 2, status: true },
)
