namespace :task_name do
  desc "実行処理の説明"
  task :create, ['name'] => :environment do |task|
    condition1 = Condition.new(name:"新品、未使用")
    condition1.save!
    condition2 = Condition.new(name:"未使用に近い")
    condition2.save!
    condition3 = Condition.new(name:"目立った傷や汚れなし")
    condition3.save!
    condition4 = Condition.new(name:"やや傷や汚れあり")
    condition4.save!
    condition5 = Condition.new(name:"やや傷や汚れあり")
    condition5.save!
    condition6 = Condition.new(name:"全体的に状態が悪い")
    condition6.save!
  end
end