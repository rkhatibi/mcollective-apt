metadata    :name        => "mcolllective agent apt",
            :description => "mco apt plugin",
            :author      => "Cobbled from parts of other plugins",
            :license     => "Apache 2.0",
            :version     => "1.0",
            :url         => "https://github.com/rkhatibi/mcollective-apt",
            :timeout     => 60

action "clean", :description => "Remove all package archive files" do
    display :always

    output "status",
          :description => "Status of cleaning execution",
          :display_as  => "Cleaning Execution"
end

action "update", :description => "Update repository information" do
    display :always

    output "status",
          :description => "Status of update exection",
          :display_as  => "Update Execution"
end
