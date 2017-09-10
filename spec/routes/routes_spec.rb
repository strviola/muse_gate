require 'rails_helper'

RSpec.describe 'Rounting', type: :routing do
  it { expect(get: '/').to route_to controller: 'top', action: 'show' }

  context 'player' do
    it { expect(get: '/player').to route_to controller: 'player/sessions', action: 'new' }
    context 'sessions' do
      it { expect(get: '/player/sessions/new').to route_to controller: 'player/sessions', action: 'new' }
      it { expect(post: '/player/sessions').to route_to controller: 'player/sessions', action: 'create' }
      it { expect(delete: '/player/sessions').to route_to controller: 'player/sessions', action: 'destroy' }
    end
    context 'reservations' do
      it { expect(get: '/player/reservations').to route_to controller: 'player/reservations', action: 'index' }
      it { expect(get: '/player/reservations/1').to route_to controller: 'player/reservations', action: 'show', id: '1' }
      it { expect(get: '/player/reservations/new').to route_to controller: 'player/reservations', action: 'new' }
      it { expect(post: '/player/reservations').to route_to controller: 'player/reservations', action: 'create' }
      it { expect(get: '/player/reservations/1/edit').to route_to controller: 'player/reservations', action: 'edit', id: '1' }
      it { expect(patch: '/player/reservations/1').to route_to controller: 'player/reservations', action: 'update', id: '1' }
      it { expect(delete: '/player/reservations/1').to route_to controller: 'player/reservations', action: 'destroy', id: '1' }
    end
  end
end
