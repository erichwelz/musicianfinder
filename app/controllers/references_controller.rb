class ReferencesController < ApplicationController
  before_filter :load_user
  
  def show
  	@user = Reference.find(params[:id])
  end

  def create
  	@reference = @user.target_references.build(reference_params)
  	@reference.source = current_user
  
  	if @reference.save
  		redirect_to @user, notice: 'Reference Posted'
  	else
  		redirect_to @user
  	end
  end

  def destroy
  	@reference = Reference.find(params[:id])
  	@reference.destroy
  end

  private
  def reference_params
  	params.require(:reference).permit(:comment, :source_id, :target_id, :feedback_value, :jammed, :performed, :recorded)
  end
def
   load_user
  	@user = User.find(params[:user_id])
  end
end