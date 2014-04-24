class ToDosController < ApplicationController

 def index 
 	@to_dos = Todo.all
 end

end
