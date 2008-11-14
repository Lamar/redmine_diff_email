require_dependency 'changeset'
class Changeset
  after_create :send_diff_emails
  
  private
  
  def send_diff_emails
    if repository.project.custom_value_for(CustomField.find_by_name("Send Diff Emails"))
      DiffMailer.deliver_diff_notification(repository.diff("", previous.revision, revision), self)
    end
  end
end