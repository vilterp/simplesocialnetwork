class PeopleController < ApplicationController  
  
  def home
    @person = current_person
  end
  
  # render new.rhtml
  def new
    redirect_to home_path if logged_in?
    @person = Person.new
  end
 
  def create
    logout_keeping_session!
    @person = Person.new(params[:person])
    success = @person && @person.save
    if success && @person.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_person = @person # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
  def show
    @person = Person.find_by_id(params[:id])
  end
  
  def edit
    @person = Person.find_by_id(params[:id])
  end
  
  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      flash[:notice] = 'Profile updated.'
      redirect_to @person
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @person = Person.find_by_id(params[:id])
    @person.destroy
    flash[:notice] = 'Your account was deleted! Bye!'
    redirect_to signup_path
  end
  
end
