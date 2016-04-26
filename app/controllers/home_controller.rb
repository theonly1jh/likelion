require 'mailgun'

class HomeController < ApplicationController
    def index
    end
    
    def write
        @title = params[:title]
        @content = params[:content]
        
        
        new_post = Email.new
        new_post.title = @title
        new_post.content = @content
        
        new_post.save
        
        redirect_to "/list"
        


    end
    
    def list
        @every_post = Email.all.order("id desc")
    
    end
    
    def update_view
        @one_post = Email.find(params[:id])
        
    end


    
    def destroy
        @one_post = Email.find(params[:id])
        @one_post.destroy
        redirect_to "/list"
    end
    
        
end

