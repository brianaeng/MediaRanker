class BooksController < ApplicationController
  def index
    @books = Book.all.sort_by { |book_hash| [book_hash[:num_votes], (-book_hash[:id])] }.reverse
  end

  def show
    find
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new

    @book.title = params[:book][:title]
    @book.num_votes = 0
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]

    @book.save

    redirect_to book_path(@book.id)
  end

  def upvote
    find

    @book.num_votes += 1
    @book.save

    redirect_to book_path(@book.id)
  end

  def edit
    find
  end

  def update
    find

    @book.title = params[:book][:title]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]

    @book.save

    redirect_to book_path(@book.id)
  end

  def destroy
    find

    @book.destroy

    redirect_to books_path
  end

  private
  def find
    @book = Book.find(params[:id].to_i)
  end
end
