class AddSomeData < ActiveRecord::Migration[6.1]
  def change
    u = User.create(name: "江叶")
    u.comments.create(comment: "测试测试测试")
    u.comments.create(comment: "daileyingyude测试")
    u.comments.create(comment: "日常使用型测试")
    u.comments.create(comment: "测试测试测试")
    u.comments.create(comment: "测试测试测试")
    u.comments.create(comment: "测试测试测试")
    u.comments.create(comment: "测试测试测试")
    u.comments.create(comment: "测试测试测试")
    u.comments.create(comment: "测试测试测试")
    u.comments.create(comment: "测试测试测试")
    u.comments.create(comment: "测试测试测试")
    u.comments.create(comment: "测试测试测试")
    u.comments.create(comment: "测试测试测试")
    u.comments.create(comment: "测试测试测试")
    u.comments.create(comment: "加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试")
    u.comments.create(comment: "加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试")
    u.comments.create(comment: "加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试加长夜用型测试")
    u.comments.create(comment: "白天睡得香测试")
  end
end
