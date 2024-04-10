class LoggedInController < ApplicationController
  before_action :authenticate
end
