class Book

  def set_title_and_author(title, author)
    @title = title
    @author = author
  end

  def description
    "#{@title} was written by #{@author}"
  end

end

book = Book.new
book.set_title_and_author("Alex", "Henry")
book.description