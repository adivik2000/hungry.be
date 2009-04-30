class Invite < CouchRest::ExtendedDocument
  property :poll_id
  property :address
  property :has_voted, :default => false
  timestamps!

  view_by :poll,
    :map =>
      "function(doc) {
       if(doc['couchrest-type'] == 'Invite') {
          emit(doc['poll_id'], null);
        }
      }" 
end
