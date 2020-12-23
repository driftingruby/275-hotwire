class CommentsController < ApplicationController
  before_action :set_ticket

  def new
    @comment = @ticket.comments.new
  end

  def create
    @comment = @ticket.comments.create!(comment_params)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @ticket }
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end