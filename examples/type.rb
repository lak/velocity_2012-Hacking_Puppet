Puppet::Type.newtype(:repo) do
  @doc = "Manage repos"
  ensurable

  newparam(:source) do
    desc "The repo source"

    validate do |value|
      if value =~ /^git/
        resource[:provider] = :git
      else
        resource[:provider] = :svn
      end
    end
    isnamevar
  end

  newparam(:path) do
    desc "Destination path"
    validate do |value|
      unless value =~ /^\/[a-z0-9]+/
        raise ArgumentError , "#{value} is not a valid file path"
      end
    end
  end
end

