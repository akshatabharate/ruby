class PagesController < ApplicationController
    def about
        @title = 'about us';
        @content = 'this is about page';
    end
end
