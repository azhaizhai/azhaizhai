class AddShiJingData < ActiveRecord::Migration[6.1]
  def up
    json = JSON.load(File.open("lib/chinese-poetry/shijing/shijing.json"))
    book = Book.create!(title: "诗经")
    json.each do |j|
      section = Section.find_or_create_by(title: j["chapter"], book: book)
      article = Article.create!(book: book, section: section, title: "#{j["section"]}·#{j["title"]}")
      j["content"].each do |p|
        Paragraph.create!(content: p, article: article)
      end
    end
  end

  def down
    if book = Book.find_by(title: "诗经")
      articles = book.articles
      articles.each do |a|
        a.paragraphs.destroy_all
        a.destroy
      end
      book.sections.destroy_all
      book.destroy
    end
  end
end
