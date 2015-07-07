@UserAndRoom = new Meteor.Collection null
Partitioner.partitionCollection(@UserAndRoom)
@ChatMessageHistory = new Meteor.Collection null
Partitioner.partitionCollection(@ChatMessageHistory)

@ChatRoom = new Meteor.Collection 'data.ChatRoom'
Partitioner.partitionCollection(@ChatRoom)
@ChatSubscription = new Meteor.Collection 'data.ChatSubscription'
Partitioner.partitionCollection(@ChatSubscription)
@ChatMessage = new Meteor.Collection 'data.ChatMessage'
Partitioner.partitionCollection(@ChatMessage)

Meteor.startup ->
	ChatMessage.find().observe
		added: (record) ->
			if ChatRoom._collection._docs._map[record.rid]? and not ChatMessageHistory._collection._docs._map[record._id]?
				ChatMessageHistory.insert record

		changed: (record) ->
			_id = record._id
			delete record._id

			ChatMessageHistory.update { _id: _id }, { $set: record }

		removed: (record) ->
			ChatMessageHistory.remove {_id: record._id}
