class Api::V1::PlayersController < ApplicationController
  before_action :set_player, only: [:show,:update,:destroy]

  # Only allows index to show if player is not found in records

  def index
    player = Player.all
    render json: players, status: 200
  end

  # Lists all of the players from Database

  def create
    player = Player.create(player_params)
    render json: player, status: 201
  end

  # Create a new player in the Dababase

  def update
    @player.update(player_params)
    render json: @player, status: 200
  end

  # Update a player info in Database

  # def destroy
  #   playerId = @player.id
  #   @player.destroy
  #   render json: {message:"Zap! Player deleted", playerId:playerId}
  # end

  def show
    render json: @player, status: 200
  end

  # Show a players info

  private
  def player_params
    params.permit(:name, :score, :time, :win)
  end

  def set_player
    @player = Player.find(params[:id])
  end
end
