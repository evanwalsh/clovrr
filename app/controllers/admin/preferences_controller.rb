class Admin::PreferencesController < AdminController
  def index
    @preferences = Preference.all
  end

  def new
    @preference = Preference.new
  end
  
  def create
    @preference = Preference.new params[:preference]
    @preference.user = current_user
    if @preference.save
      redirect_to admin_preferences_url, notice: 'Preference published.'
    else
      flash[:error] = 'Preference could not be created.'
      render :new
    end
  end

  def edit
    @preference = Preference.where(url: params[:id]).first
  end
  
  def update
    @preference = Preference.where(url: params[:id]).first
    if @preference.update_attributes params[:preference]
      redirect_to admin_preferences_url, notice: 'Preference saved.'
    else
      flash[:error] = 'Preference could not be saved.'
      render :edit
    end
  end
end
