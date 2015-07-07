@ChatMessage = new Meteor.Collection 'data.ChatMessage'
Partitioner.partitionCollection(@ChatMessage);
@ChatRoom = new Meteor.Collection 'data.ChatRoom'
Partitioner.partitionCollection(@ChatRoom);
@ChatSubscription = new Meteor.Collection 'data.ChatSubscription'
Partitioner.partitionCollection(@ChatSubscription);
