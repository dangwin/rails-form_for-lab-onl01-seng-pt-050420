class SchoolClassesController < ApplicationController

    def index
        @school_classes = SchoolClass.all 
    end

    def show
        @school_class = SchoolClass.find_by(id: params[:id])
    end

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.new(school_class_attributes(:title, :room_number))
        @school_class.save
        redirect_to school_class_path(@school_class)
    end

    def edit
        @school_class = SchoolClass.find_by(id: params[:id])
    end

    def update
        @school_class = SchoolClass.update(school_class_attributes(:title, :room_number))
        redirect_to school_class_path(@school_class)
    end

    private
    def school_class_attributes(*args)
        params.require(:school_class).permit(*args)
    end
end