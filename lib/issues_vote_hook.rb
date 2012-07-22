# Provides a link to the issue age graph on the issue index page
class IssuesVoteHook < Redmine::Hook::ViewListener
  render_on :view_issues_show_details_bottom, :inline => <<-END
    <tr><td><b><%= l :label_votes %>:</b></td><td>
    <% vv = @issue.votes_value %>
    <%= content_tag('span', vv, :class => (vv > 0? 'votes-positive': ( vv < 0 ? 'votes-negative' : ''))) %>
    <% @project = @issue.project %>
    <% if authorize_for('issues', 'vote') && !@issue.voted_by_user? %>
      <%= link_to("", { :controller => 'vote', :action => 'up',   :id => @issue }, :class => 'icon icon-vote-up'  , :method => 'post', :confirm => 'up?')   %>
      <%= link_to("", { :controller => 'vote', :action => 'down', :id => @issue }, :class => 'icon icon-vote-down', :method => 'post', :confirm => 'down?') %>
    <% end %>
    </td></tr>
END
end
