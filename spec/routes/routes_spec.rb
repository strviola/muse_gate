require 'rails_helper'

RSpec.describe 'Rounting', type: :routing do
  it { expect(get: '/').to route_to controller: 'top', action: 'show' }

  context 'player' do
    it { expect(get: '/player').to route_to controller: 'player/sessions', action: 'new' }
    it { expect(get: '/player/sessions/new').to route_to controller: 'player/sessions', action: 'new' }
    it { expect(post: '/player/sessions').to route_to controller: 'player/sessions', action: 'create' }
    it { expect(delete: '/player/sessions').to route_to controller: 'player/sessions', action: 'destroy' }
  end
end
