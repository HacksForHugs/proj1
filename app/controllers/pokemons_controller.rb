class PokemonsController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
		if @pokemon.update_attributes(:trainer => current_trainer)
			redirect_to root_path
		end
	end

	def damage
		@pokemon = Pokemon.find(params[:id])

		if @pokemon.health - 10 == 0
			@trainer = @pokemon.trainer
			@pokemon.destroy
			redirect_to trainer_path(@trainer)
		elsif @pokemon.update_attributes(:health => (@pokemon.health - 10))
			redirect_to trainer_path(@pokemon.trainer)
		end
	end

	def new
    @trainer = Trainer.find params[:trainer_id]
    @pokemon = @trainer.pokemons.build
  end

  def create
    @trainer = Trainer.find params[:trainer_id]
    @pokemon = @trainer.pokemons.build(:name => pokemon_params[:name], :health => 100, :level => 1)
    if @pokemon.save
      redirect_to @pokemon.trainer
    else
      render "new"
      flash[:error] = @pokemon.errors.full_messages.to_sentence
    end
  end

  def pokemon_params
    params.require(:pokemon).permit(:name)
   end


	# def update
	# 	@pokemon = Pokemon.find params[:id]
	# 	if @pokemon.update quit_params
	#   		redirect_to @quit.user
	# 	else
	#   		render "edit"
	# 	end
	# end

	# def quit_params
	#  	params.require(:pokemon).permit(:id)
	#  end

end
