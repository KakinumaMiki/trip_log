Schedule.seed(:id,
              { plan_id: 1, name: '1日目', memo: '1日目のmemo', went_on: Time.parse("2022/07/12") },
              { plan_id: 1, name: '2日目', memo: '2日目のmemo', went_on: Time.parse("2022/07/13") },
              { plan_id: 1, name: '3日目', memo: '3日目のmemo', went_on: Time.parse("2022/07/14") },
              { plan_id: 2, name: '1日', memo: '1日だけのmemo', went_on: Time.parse("2022/07/20") },
)
