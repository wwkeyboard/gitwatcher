class Repo < Grit::Repo
  attr_reader :bad_repo, :name
  
  def initialize(repo)
    @name = repo
    super File.join(Environment::CODE_HOME, repo)
  rescue Grit::InvalidGitRepositoryError => e
    @bad_repo = true
    puts "bad repo: #{repo}"
  end
  
  def diff_for(commit_hash)
    commit = Grit::Commit.diff(self, commit_hash).first
    if commit
      CodeRay.scan( commit.diff, :diff ).div
    else
      "No changeset for this commit"
    end
  end

  def parsed_commits
    return nil if @bad_repo
    commits('develop').collect {|c| {:id => c.id,
        :repository => name,
        :message => c.message,
        :author => c.author,
        :date => c.authored_date,
        :url => "/repo/#{name}/#{c.id}"}
    }
  end
end
