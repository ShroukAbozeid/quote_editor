class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]
  def index
    @quotes = Quote.recent_first
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      # TODO: turbo stream update
      redirect_to quotes_path, notice: "Quote was successfully created."
    else
      # TODO: turbo stream error handling
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      # TODO: turbo stream update
      redirect_to quotes_path, notice: "Quote was successfully updated."
    else
      # TODO: turbo stream error handling
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    # TODO: turbo stream update
    redirect_to quotes_path, notice: "Quote was successfully destroyed."
  end

  private
  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:content)
  end
end
