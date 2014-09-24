module MCollective
  module Agent
    class Apt<RPC::Agent

      action "clean" do
        out = ""
        run("/usr/bin/apt-get clean", :stdout => out, :chomp => true )
        reply[:output] = "Removing all packages from apt cache"
      end

      action "update" do
        out = ""
        run("/usr/bin/apt-get update", :stdout => out, :chomp => true )
        reply[:output] = "Updating apt sources"
      end
    end
  end
end
