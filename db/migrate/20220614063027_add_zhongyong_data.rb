class AddZhongyongData < ActiveRecord::Migration[6.1]
  def up
    json = JSON.load(File.open("lib/chinese-poetry/sishuwujing/zhongyong.json"))
    book = Book.create!(title: "中庸")
    article = Article.create!(book: book, title: json["chapter"])
    json["paragraphs"].each do |p|
      Paragraph.create!(content: p, article: article)
    end
  end

  def down
    if book = Book.find_by(title: "中庸")
      articles = book.articles
      articles.each do |a|
        a.paragraphs.destroy_all
        a.destroy
      end
      book.destroy
    end
  end
end
