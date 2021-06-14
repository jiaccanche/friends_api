module Api
    module V1
        #Mapeo de api version 1
        class FriendsController < ApplicationController
            
            #skip auth
            skip_before_action :verify_authenticity_token
            
            def index
                friends = Friend.order('id')

                render json: {
                    status: 'EXITOSO',
                    data: friends
                }, status: :ok
            
            end

            def show

                friend = Friend.find( params[:id] )

                render json: {
                    status: 'EXITOSO',
                    data: friend
                }, status: :ok

            end

            def create
                puts "init - process"
                friend = Friend.new( friend_params )
                
                if friend.save
                    render json: {
                        status: 'EXITOSO',
                        data: friend
                    }, status: :ok
                
                else
                    render json: {
                        status: 'EXITOSO',
                        data: friend.errors
                    }, status: :bad_request
                end
            
            end

            def update
                friend = Friend.find( params[:id] )

                if friend.update(  friend_params )
                    
                    render json: {
                        status: 'EXITOSO',
                        data: friend
                    }, status: :ok
                
                else
                    
                    render json: {
                        status: 'EXITOSO',
                        data: friend.errors
                    }, status: :bad_request
                
                end
                
            end


            def destroy
                friend = Friend.find( params[:id] )
                
                if friend.destroy
                    
                    render json: {
                        status: 'EXITOSO',
                        data: friend
                    }, status: :ok
                
                else
                    
                    render json: {
                        status: 'EXITOSO',
                        data: friend.errors
                    }, status: :bad_request
                
                end
                
            end

            private
            def friend_params
                puts "get params process"
                params.require(:friend).permit(:name, :lastName, :age, :active, :id)
            end
        
        end
    
    end
    
end