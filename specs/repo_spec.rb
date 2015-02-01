require './environment'

describe 'repo' do
  it "knows if a directory is a repository" do
    Repo.is_repo?("#{Environment::PROJECT_BASE}").should be_true
    Repo.is_repo?('/').should_not be_true
  end
end