ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    # div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #   span :class => "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    section "204Hats Outstanding Orders" do
      table_for Order.order(:id).where("status <> 'Shipped'") do
        column "Customers" do |order|
          link_to order.customer.first_name + " " + order.customer.last_name, admin_customer_path(order.customer)
        end
        column "Order Number" do |order|
          link_to order.id, admin_order_path(order.id)
        end
        column "Order Status" do |order|
          order.status
        end
        column "Order Creation Date" do |order|
          order.created_at
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

       #column do
       #  panel "Info" do
       #    para "Welcome to ActiveAdmin."
       #  end
       #end
  end # content
end
