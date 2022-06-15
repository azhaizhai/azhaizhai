class AddTangShiData < ActiveRecord::Migration[6.1]
  def up
    book = Book.create!(title: "全唐诗")
    58.times do |i|
      json = JSON.load(File.open("lib/chinese-poetry/json/poet.tang.#{ i*1000 }.json"))
      json.each do |j|
        article = Article.create!(book: book, title: j["title"], author: j["author"], description: j["id"])
        j["paragraphs"].each do |p|
          Paragraph.create!(content: p, article: article)
        end
      end
    end
  end

  def down
    if book = Book.find_by(title: "全唐诗")
      articles = book.articles
      articles.each do |a|
        a.paragraphs.destroy_all
        a.destroy
      end
      book.destroy
    end
  end
end
