class Reviewer::EventsController < Reviewer::ApplicationController
  skip_before_filter :require_proposal

  def show
    participant = Participant.find_by(person_id: current_user)
    rating_counts = @event.ratings.group(:person_id).count
    render locals: {
             event: @event.decorate,
             rating_counts: rating_counts,
             participant: participant
           }
  end

end