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

    context 'rooms' do
      it { expect(get: '/player/rooms').to route_to controller: 'player/rooms', action: 'index' }
      it { expect(get: '/player/rooms/1').to route_to controller: 'player/rooms', action: 'show', id: '1' }
    end

    context 'reservations' do
      it { expect(get: '/player/reservations').to route_to controller: 'player/reservations', action: 'index' }
      it { expect(get: '/player/rooms/1/reservations/new').to route_to controller: 'player/reservations', action: 'new', room_id: '1' }
      it { expect(post: '/player/rooms/1/reservations/temp').to route_to controller: 'player/reservations', action: 'temp', room_id: '1' }
      it { expect(get: '/player/rooms/1/reservations/confirm').to route_to controller: 'player/reservations', action: 'confirm', room_id: '1' }
      it { expect(post: '/player/rooms/1/reservations').to route_to controller: 'player/reservations', action: 'create', room_id: '1' }
      it { expect(get: '/player/reservations/1/edit').to route_to controller: 'player/reservations', action: 'edit', id: '1' }
      it { expect(patch: '/player/reservations/1').to route_to controller: 'player/reservations', action: 'update', id: '1' }
    end
  end

  context 'host' do
    it { expect(get: '/host').to route_to controller: 'host/sessions', action: 'new' }

    context 'sessions' do
      it { expect(get: '/host/sessions/new').to route_to controller: 'host/sessions', action: 'new' }
      it { expect(post: '/host/sessions').to route_to controller: 'host/sessions', action: 'create' }
      it { expect(delete: '/host/sessions').to route_to controller: 'host/sessions', action: 'destroy' }
    end

    context 'menu' do
      it { expect(get: '/host/menu').to route_to controller: 'host/menu', action: 'show' }
    end

    context 'rooms' do
      it { expect(get: '/host/rooms').to route_to controller: 'host/rooms', action: 'index' }
      it { expect(get: '/host/rooms/new').to route_to controller: 'host/rooms', action: 'new' }
      it { expect(post: '/host/rooms').to route_to controller: 'host/rooms', action: 'create' }
      it { expect(get: '/host/rooms/1/edit').to route_to controller: 'host/rooms', action: 'edit', id: '1' }
      it { expect(patch: '/host/rooms/1').to route_to controller: 'host/rooms', action: 'update', id: '1' }
    end

    context 'plans' do
      it { expect(get: '/host/rooms/1/plans/new').to route_to controller: 'host/plans', action: 'new', room_id: '1' }
      it { expect(post: '/host/rooms/1/plans').to route_to controller: 'host/plans', action: 'create', room_id: '1' }
      it { expect(get: '/host/plans/1/edit').to route_to controller: 'host/plans', action: 'edit', id: '1' }
      it { expect(patch: '/host/plans/1').to route_to controller: 'host/plans', action: 'update', id: '1' }
    end

    context 'reservations' do
      it { expect(get: '/host/reservations').to route_to controller: 'host/reservations', action: 'index' }
      it { expect(get: '/host/reservations/1/edit').to route_to controller: 'host/reservations', action: 'edit', id: '1' }
      it { expect(patch: '/host/reservations/1').to route_to controller: 'host/reservations', action: 'update', id: '1' }
    end
  end
end
