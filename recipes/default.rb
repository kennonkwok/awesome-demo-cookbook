builder = data_bag_item('builders', 'awesome-demo-content')
apt_repo_uri = builder['apt_repo_uri']
apt_repo_component = builder['apt_repo_component']
builder_id = builder['id']

#TODO - probably want to drive this whole section off of the builder_id later
apt_repository 'awesome-demo' do
  uri        apt_repo_uri
  components apt_repo_component
end

package 'awesome-demo' do
  action :upgrade
  notififes :restart, 'service[awesome-demo]', :delayed
end

service 'awesome-demo' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
