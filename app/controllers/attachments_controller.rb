class AttachmentsController < ApplicationController

  def destroy
    ap params
    @post = Post.find(params[:post_id])
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to post_path @post }
      format.json { head :no_content }
    end
  end

end
