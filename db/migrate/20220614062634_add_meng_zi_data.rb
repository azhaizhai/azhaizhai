class AddMengZiData < ActiveRecord::Migration[6.1]
  def up
    json = JSON.load(File.open("lib/chinese-poetry/sishuwujing/mengzi.json"))
    book = Book.create!(title: "孟子")
    json.each do |j|
      article = Article.create!(book: book, title: j["chapter"])
      j["paragraphs"].each do |p|
        Paragraph.create!(content: p, article: article)
      end
    end
  end

  def down
    if book = Book.find_by(title: "孟子")
      articles = book.articles
      articles.each do |a|
        a.paragraphs.destroy_all
        a.destroy
      end
      book.destroy
    end
  end
end
