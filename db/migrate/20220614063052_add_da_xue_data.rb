class AddDaXueData < ActiveRecord::Migration[6.1]
  def up
    json = JSON.load(File.open("lib/chinese-poetry/sishuwujing/daxue.json"))
    book = Book.create!(title: "大学")
    article = Article.create!(book: book, title: json["chapter"])
    json["paragraphs"].each do |p|
      Paragraph.create!(content: p, article: article)
    end
  end

  def down
    if book = Book.find_by(title: "大学")
      articles = book.articles
      articles.each do |a|
        a.paragraphs.destroy_all
        a.destroy
      end
      book.destroy
    end
  end
end
