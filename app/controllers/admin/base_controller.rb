class Admin::BaseController < ApplicationController
    before_action :current_admin?
end 