class DiffMailer < ActionMailer::Base
  def diff_notification(diff, changeset)
    recipients changeset.repository.project.users.select{|u|u.mail}.map{|u|u.mail }
    from 'redmine@lamar.com'
    subject "Redmine code review: #{changeset.repository.project.name} rev #{changeset.revision}"    
    #content_type 'multipart/alternative'

    part :content_type => "text/html", 
      :body => render_message("diff_notification.text.html.rhtml", :diff => diff, :changeset => changeset)
    
    attachment 'text/x-patch' do |a|
      a.filename = "changeset_r#{changeset.revision}.diff"
      a.body = diff.join
    end
  end
end