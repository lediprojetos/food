require 'Lib/lib_autentication'
class ApplicationController < ActionController::Base
	include Auntentication
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	helper_method :usuario_logado, :user


	$Servicos = 1
	$Combos = 2
	$Unico = 1
end

class Numeric
  def percent_of(n)
    self.to_f / n.to_f * 100.0
  end
end