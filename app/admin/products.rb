ActiveAdmin.register Product do
  batch_action :flag do |selection|
      Post.find(selection).each { |p| p.flag! }
      redirect_to collection_path, :notice => "Posts flagged!"
    end

    index do
      selectable_column
      column :category
      column :description
      column :name
      column :price
      column "QTY", :stock_quantity
      
      column "Image" do |image|
        image_tag(image.image_path, :size => "40x30")
      end
      default_actions
    end
end
