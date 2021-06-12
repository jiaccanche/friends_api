module Api
    module V1
        #Mapeo de api version 1
        class FriendsController < ApplicationController
            
            def index
                friends = Friend.order('id')

                render json: {
                    status: 'EXITOSO',
                    data: friends
                }, status: :ok
            
            end

            def show

                friend = Friend.find( param[:id] )

                render json: {
                    status: 'EXITOSO',
                    data: friend
                }, status: :ok

            end

            def create

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
                
                if friend.update_attributes(  friend_params )
                    
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
                params.permit(:name, :lastName, :age, :active)
            end
        
        end
    
    end
    
end