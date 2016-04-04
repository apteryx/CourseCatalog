class SearchController < ApplicationController
  def new
    @subjects = Subject.all.map { |s| [s.name, s.id] }
    @subjects.prepend nil
  end

  def results
    @user = User.find session[:user_id]

    unless params[:subject_id] == ""
      @subject = Subject.find params[:subject_id]
      @courses = @subject.courses
    end

    sid = params[:subject_id]
    # preprocess if subject_id selected
    @courses = (sid == "") ? Course.all : Subject.find(sid).courses
    @courses = @courses.where("name like ?", "%#{params[:q]}%")

    respond_to do |format|
      format.js
      format.html
    end
  end
end
