RSpec.shared_examples 'from request to left' do
  describe 'Update from request to left' do
    describe 'update by the user' do
      before do
        put "/invitations/#{request_invitation.id.to_s}", {session_id: account_session.token, app_key: 'test_key', token: 'test_token', status: 'left'}
      end
      it 'Returns a Bad Request(400) status' do
        expect(last_response.status).to be 400
      end
      it 'Returns the correct body' do
        expect(last_response.body).to include_json({
          status: 400,
          field: 'status',
          error: 'impossible'
        })
      end
      it 'Has not updated the invitation' do
        expect(request_invitation.reload.status_request?).to be true
      end
    end
    describe 'update by the creator' do
      before do
        put "/invitations/#{request_invitation.id.to_s}", {session_id: creator_session.token, app_key: 'test_key', token: 'test_token', status: 'left'}
      end
      it 'Returns a Bad Request(400) status' do
        expect(last_response.status).to be 400
      end
      it 'Returns the correct body' do
        expect(last_response.body).to include_json({
          status: 400,
          field: 'status',
          error: 'impossible'
        })
      end
      it 'Has not updated the invitation' do
        expect(request_invitation.reload.status_request?).to be true
      end
    end
  end
end